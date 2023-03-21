#include <verilator.h>
#include <expr.h>
#include <npc.h>

#include <readline/readline.h>
#include <readline/history.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void init_regex();
// void init_wp_pool();

static char* rl_gets() {
  static char *line_read = NULL;

  if (line_read) {
    free(line_read);
    line_read = NULL;
  }

  line_read = readline("(npc) ");

  if (line_read && *line_read) {
    add_history(line_read);
  }

  return line_read;
}

void execute(uint64_t n);

static int cmd_help(char *args)
{
    return 0;
}

static int cmd_c(char *args)
{
    execute(-1);
    return 0;
}

static int cmd_q(char *args)
{
    npc_state = NPC_QUIT;
    return -1;
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
    uint64_t addr;
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
            printf("%02lx  ", pmem_read(addr+j, 1));
        printf("\n");
    }
    return 0;
}

static int cmd_si(char *args)
{
    int steps = args ? atoi((const char *)args) : 1;
    execute(steps);
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
        reg_display();
    // else if(!strcmp("w", args))
    // {
    //     display_watchpoints();
    //     return 0;        
    // }
    return 0;
}

static struct {
  const char *name;
  const char *description;
  int (*handler) (char *);
} cmd_table [] = {
  { "help", "Display information about all supported commands", cmd_help },
  { "c", "Continue the execution of the program", cmd_c },
  { "q", "Exit NPC", cmd_q },
  { "si", "Step next N commands, 1 if N is not given", cmd_si},
  { "x", "Print the content of memory with a given address.", cmd_x},
//   { "w", "Set watchpoint.", cmd_w},
//   { "d", "Delete watchpoint.", cmd_d},
//   IFDEF(CONFIG_FTRACE, { "ftrace", "Display function call trace.", cmd_ftrace},)
  { "info", "Print the content of register(-r) or watchpoing(-w).", cmd_info}

  /* TODO: Add more commands */

};

#define NR_CMD ARRLEN(cmd_table)

void sdb_mainloop() {

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

void init_sdb()
{
    init_regex();
    // init_wp_pool();
}