#include <isa.h>
#include <cpu/cpu.h>
#include <readline/readline.h>
#include <readline/history.h>
#include <memory/paddr.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <elf.h>

static int f_info_num = 0;
static struct function_info
{
    uint32_t f_addr;
    char f_name[64];
}f_info[32];


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
  printf("strtab:%s\n", strtab);
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
          printf("syn_num:%d\n", sym_num);
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
                  f_info[f_info_num].f_addr = sym.st_value;
                  f_info_num++;
              }
          }
          
      }
  }
  for(int i=0;i<f_info_num;i++)
  {
      printf("funcname:%s funcaddress:%x\n", f_info[i].f_name, f_info[i].f_addr);
  }
  free(strtab);
  free(shstrtab);
}