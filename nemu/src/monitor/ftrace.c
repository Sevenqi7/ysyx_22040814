#include <isa.h>
#include <cpu/cpu.h>
#include <readline/readline.h>
#include <readline/history.h>
#include <memory/paddr.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <elf.h>


#define MAX_FTRACE_INFO_SIZE 256
#define MAX_FTRACE_STACK_SIZE 256

#define CONFIG_FTRACE 1
#ifdef CONFIG_FTRACE
static int f_info_num = 0;
static struct function_info
{
    vaddr_t f_addr;
    char f_name[64];
}f_info[MAX_FTRACE_INFO_SIZE];

//这些函数被调用的频率太高，不屏蔽掉ftrace直接没法看了
static char *ignore_func[] = {
    "putch", "printfputch", "printnum", "vprintfmt"
};

static bool check_ignore(struct function_info *f)
{
    int ignore_num = sizeof(ignore_func) / sizeof(char *);
    for(int i=0;i<ignore_num;i++)
        if(!strcmp(ignore_func[i], f->f_name))
            return true;
    return false;
}

static struct function_call_stack
{
    struct function_info function[MAX_FTRACE_STACK_SIZE];    
    bool is_ret[MAX_FTRACE_STACK_SIZE];
    vaddr_t call_pc[MAX_FTRACE_STACK_SIZE];
    vaddr_t ret_addr[MAX_FTRACE_STACK_SIZE];
    int end;
}f_trace_buf = {.end = 0, .is_ret = {false}};

void ftrace_check_jal(vaddr_t jump_addr, vaddr_t ret_addr, int rs1, int rd)
{
    // Log("jump_addr:%lx ret_addr:%lx rd:%d, rs1:%d", jump_addr, ret_addr, rd, rs1);
    if(rd == 0 && rs1 == 1)
    {
        for(int i=f_trace_buf.end-1;i >= 0;i--)
        {
            if(f_trace_buf.ret_addr[i] == jump_addr)
            {
                if(check_ignore(&f_trace_buf.function[i])) return;
                f_trace_buf.function[f_trace_buf.end] = f_trace_buf.function[i];
                f_trace_buf.is_ret[f_trace_buf.end] = true;
                f_trace_buf.call_pc[f_trace_buf.end] = ret_addr - 4;

                // Log("%s ret", f_trace_buf.function[f_trace_buf.end].f_name);
                f_trace_buf.end = (f_trace_buf.end + 1) % MAX_FTRACE_STACK_SIZE;
                return;
            }
        }
    }
    for(int i=0;i<f_info_num;i++)
    {
        if(f_info[i].f_addr == jump_addr)
        {
            if(check_ignore(&f_info[i])) return;
            f_trace_buf.function[f_trace_buf.end] = f_info[i];
            f_trace_buf.ret_addr[f_trace_buf.end] = ret_addr;
            f_trace_buf.is_ret[f_trace_buf.end] = false;
            f_trace_buf.call_pc[f_trace_buf.end] = ret_addr - 4;

            // Log("end:%d", f_trace_buf.f_traceq_end);
            // Log("jump to 0x%lx(%s)", f_trace_buf.function[f_trace_buf.end].f_addr, f_trace_buf.function[f_trace_buf.end].f_name);

            f_trace_buf.end = (f_trace_buf.end + 1) % MAX_FTRACE_STACK_SIZE;
            return ;
        }
    }
}

void display_ftrace(int num)
{
    int i = (f_trace_buf.end + 1) % MAX_FTRACE_STACK_SIZE, j = 0;
    printf("Current ftrace stack size is :%d\n", MAX_FTRACE_STACK_SIZE);
    for(;(i != f_trace_buf.end) && num;i=(i+1)%MAX_FTRACE_STACK_SIZE)
    {
        if(f_trace_buf.call_pc[i] == 0) continue;
        printf("0x%lx:", f_trace_buf.call_pc[i]);
        num--;
        if(f_trace_buf.is_ret[i] == false)
        {
            for(int k=0;k<2*j;k++) printf(" ");
            printf("call[%s@0x%lx]\n", f_trace_buf.function[i].f_name, f_trace_buf.function[i].f_addr);
            j++;
        }
        else
        {
            j--;
            for(int k=0;k<2*j;k++) printf(" ");
            printf("ret  [%s]\n", f_trace_buf.function[i].f_name);
        }
    }
}
#endif


void sdb_get_symbol_list(char *elf_path)
{
    #ifdef CONFIG_FTRACE
  int fd = open(elf_path, O_RDONLY, 0);
  if(fd == -1)
  {
    printf("Failed to open elf file %s: !\n", elf_path);
    return ;
  }
  Elf64_Ehdr ehdr;
  if(read(fd, &ehdr, sizeof(Elf64_Ehdr)) != sizeof(Elf64_Ehdr))
  {
      printf("Failed to read Elf Header\n");
      return ;
  }
  //read .shstrtab
  lseek(fd, ehdr.e_shoff + ehdr.e_shentsize * ehdr.e_shstrndx, SEEK_SET);
  Elf64_Shdr shdr;
  if(read(fd, &shdr, sizeof(shdr)) != sizeof(Elf64_Shdr))
  {
      printf("Failed to read section header of string table!\n");
      return ;
  }
  char *shstrtab = malloc(shdr.sh_size);
  lseek(fd, shdr.sh_offset, SEEK_SET);
  if(read(fd, shstrtab, shdr.sh_size) != shdr.sh_size)
  {
      printf("Failed to read section .shstrtab!\n");
      return ;
  }

  //read shstrtab
  for(int i=0;i<ehdr.e_shnum;i++)
  {
      lseek(fd, ehdr.e_shoff + ehdr.e_shentsize * i, SEEK_SET);
      if(read(fd, &shdr, sizeof(Elf64_Shdr)) != sizeof(Elf64_Shdr))
          return;
      if(shdr.sh_type == SHT_STRTAB && !strcmp(".strtab", shstrtab + shdr.sh_name))
          break;
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
        //   printf("syn_num:%d\n", sym_num);
          for(int j=0;j<sym_num;j++)
          {
              if(read(fd, &sym, sizeof(Elf64_Sym)) != sizeof(Elf64_Sym))
              {
                  printf("Failed to read symbol info!\n");
                  return ;
              }
              if((sym.st_info & 0xf) == STT_FUNC)
              {
                  // assert(0);
                  char *func_name = strtab + sym.st_name;
                  memcpy(f_info[f_info_num].f_name, func_name, strlen(func_name)+1);
                //   printf("symbol %d: %s\n", j, func_name);
                  f_info[f_info_num].f_addr = sym.st_value;
                  f_info_num++;
                  assert(f_info_num < MAX_FTRACE_INFO_SIZE);
              }
          }
          
      }
  }

  free(strtab);
  free(shstrtab);
  #endif
}
