/***************************************************************************************
* Copyright (c) 2014-2022 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <isa.h>
#include <cpu/cpu.h>
#include <readline/readline.h>
#include <readline/history.h>
#include <memory/paddr.h>
#include <unistd.h>
#include <fcntl.h>
#include <elf.h>
#include "sdb.h"


static int is_batch_mode = false;
static int f_info_num = 0;
static struct function_info
{
    uint32_t f_addr;
    char f_name[128];
}f_info[32];

void init_regex();
void init_wp_pool();

/* We use the `readline' library to provide more flexibility to read from stdin. */
static char* rl_gets() {
  static char *line_read = NULL;

  if (line_read) {
    free(line_read);
    line_read = NULL;
  }

  line_read = readline("(nemu) ");

  if (line_read && *line_read) {
    add_history(line_read);
  }

  return line_read;
}

static int cmd_c(char *args) {
    cpu_exec(-1);
    return 0;
}

static int cmd_p(char *args)
{
    if(!args)
    {
        printf("Usage: p <EXPRESSION>\n");
        return 0;
    }
    bool success = false;
    word_t result = expr(args, &success);
    if(!success)
        printf("Arugments Wrong!\n");
    printf("%lu\n", result);
    return 0;
}

static int cmd_q(char *args) {
    nemu_state.state = NEMU_QUIT;
    return -1;
}

static int cmd_help(char *args);

static int cmd_w(char *args)
{
    int wp_num;
    Log("cmdw");
    if(!args)
    {
        printf("Usage: w <EXPRESSION>\n");
        return 0;
    }
    wp_num = add_watchpoint(args);
    if(wp_num < 0)
        printf("Invalid Expression.\n");
    else
        printf("Watchpoint %d: %s\n", wp_num, args);
    return 0;
}

static int cmd_d(char *args)
{
    int wp_num;
    if(!args)
    {
        printf("Usage: d <WATCHPOINT_NUM>\n");
    }
    else
    {
        wp_num = atoi(args);
        if(del_watchpoint(wp_num))
            printf("Watchpoint %d deleted.\n", wp_num);
        else
            printf("Watchpoint %d doesn't exist.\n", wp_num);
    }
    return 0;
}

static int cmd_si(char *args)
{
    int steps = args ? atoi((const char *)args) : 1;
    cpu_exec(steps);
    return 0;
}

static int cmd_x(char *args)
{
    if(!args)
    {
      printf("usage: x <READ_NUM> <ADDR>");
      return 0;
    }
    char *str_end = args + strlen(args);
    strtok(args, " ");
    char *str = args + strlen(args) + 1;
    int times;
    vaddr_t addr;
    bool success = false;
    if(str > str_end)
    {
        times = 1;
        addr = expr(args, &success);
    }
    else
    {
        times = expr(args, &success);
        addr = expr(str, &success);        
    }
    if(!success)
    {
        printf("Wrong Arguments!\n");
        return 0;
    }
    // Log("Bytes:%lu addr:%d", addr, bytes);
    for(int i=0;i<times;i++, addr+=4)
    {
        printf("0x%lx: ", addr);
        for(int j=0;j<4;j++)
            printf("%02lx  ", paddr_read(addr+j, 1));
        printf("\n");
    }
    
    return 0;
}

static int cmd_info(char *args)
{
    if(!args)
    {
        printf("usage: <REG>: info r /<WATCHPOINT> info w\n");
        return 0;
    }
    if(!strcmp("r", args))
        isa_reg_display();
    else if(!strcmp("w", args))
    {
        display_watchpoints();
        return 0;        
    }
    return 0;
}

static struct {
  const char *name;
  const char *description;
  int (*handler) (char *);
} cmd_table [] = {
  { "help", "Display information about all supported commands", cmd_help },
  { "c", "Continue the execution of the program", cmd_c },
  { "p", "Display the value of the given expression.", cmd_p},
  { "q", "Exit NEMU", cmd_q },
  { "si", "Step next N commands, 1 if N is not given", cmd_si},
  { "x", "Print the content of memory with a given address.", cmd_x},
  { "w", "Set watchpoint.", cmd_w},
  { "d", "Delete watchpoint.", cmd_d},
  { "info", "Print the content of register(-r) or watchpoing(-w).", cmd_info}

  /* TODO: Add more commands */

};

#define NR_CMD ARRLEN(cmd_table)

static int cmd_help(char *args) {
  /* extract the first argument */
  char *arg = strtok(NULL, " ");
  int i;

  if (arg == NULL) {
    /* no argument given */
    for (i = 0; i < NR_CMD; i ++) {
      printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
    }
  }
  else {
    for (i = 0; i < NR_CMD; i ++) {
      if (strcmp(arg, cmd_table[i].name) == 0) {
        printf("%s - %s\n", cmd_table[i].name, cmd_table[i].description);
        return 0;
      }
    }
    printf("Unknown command '%s'\n", arg);
  }
  return 0;
}

void sdb_set_batch_mode() {
  is_batch_mode = true;
}

void sdb_get_symbol_list(char *elf_path)
{
  int fd = open(elf_path, O_RDONLY, 0);
  if(fd == -1)
  {
    printf("Failed to open elf file!\n");
    return ;
  }
  Elf64_Ehdr ehdr;
  if(read(fd, &ehdr, sizeof(Elf64_Ehdr)) != sizeof(Elf64_Ehdr))
  {
      printf("Failed to read Elf Header\n");
      return ;
  }
  // Log("excute debugging");
  // Log("elf path:%s", elf_path);
  lseek(fd, ehdr.e_shoff + ehdr.e_shentsize * ehdr.e_shstrndx, SEEK_SET);
  Elf64_Shdr shdr;
  if(read(fd, &shdr, sizeof(shdr)) != sizeof(Elf64_Shdr))
  {
      printf("Failed to read section header of string table!\n");
      return ;
  }
  char *strtab = malloc(shdr.sh_size);
  lseek(fd, shdr.sh_offset, SEEK_SET);
  if(read(fd, strtab, shdr.sh_size) != shdr.sh_size)
  {
      printf("Failed to read string table!\n");
      return ;
  }
  lseek(fd, ehdr.e_shoff, SEEK_SET);
  for(int i=0;i<ehdr.e_shnum;i++)
  {
      if(read(fd, &shdr, sizeof(Elf64_Shdr)) != sizeof(Elf64_Shdr))
      {
          printf("Failed to load section %d!\n", i);
          return ;
      }
      if(shdr.sh_type == SHT_SYMTAB)
      {
          Elf64_Sym sym;
          lseek(fd, shdr.sh_offset, SEEK_SET);
          int sym_num = shdr.sh_size / sizeof(Elf64_Sym);
          for(int j=0;j<sym_num;j++)
          {
              if(read(fd, &sym, sizeof(Elf64_Sym)) != sizeof(Elf64_Sym))
              {
                  printf("Failed to read symbol info!\n");
                  return ;
              }
              if(sym.st_info == STT_FUNC)
              {
                  char *func_name = strtab + sym.st_name;
                  memcpy(f_info[f_info_num].f_name, func_name, strlen(func_name)+1);
                  f_info[f_info_num].f_addr = sym.st_value;
              }
          }
          
      }
  }
  free(strtab);
  char a[200000] = "0";
  printf("%s", a);
  // Log("Funciton symbol load success.");

}

void sdb_mainloop() {
  if (is_batch_mode) {
    cmd_c(NULL);
    return;
  }

  for (char *str; (str = rl_gets()) != NULL; ) {
    char *str_end = str + strlen(str);

    /* extract the first token as the command */
    char *cmd = strtok(str, " ");
    if (cmd == NULL) { continue; }

    /* treat the remaining string as the arguments,
     * which may need further parsing
     */
    char *args = cmd + strlen(cmd) + 1;
    if (args >= str_end) {
      args = NULL;
    }

#ifdef CONFIG_DEVICE
    extern void sdl_clear_event_queue();
    sdl_clear_event_queue();
#endif

    int i;
    for (i = 0; i < NR_CMD; i ++) {
      if (strcmp(cmd, cmd_table[i].name) == 0) {
        if (cmd_table[i].handler(args) < 0) { return; }
        break;
      }
    }

    if (i == NR_CMD) { printf("Unknown command '%s'\n", cmd); }
  }
}

void init_sdb() {
  /* Compile the regular expressions. */
  init_regex();

  /* Initialize the watchpoint pool. */
  init_wp_pool();
}
