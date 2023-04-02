#include <proc.h>
#include <elf.h>

#ifdef __LP64__
# define Elf_Ehdr Elf64_Ehdr
# define Elf_Phdr Elf64_Phdr
#else
# define Elf_Ehdr Elf32_Ehdr
# define Elf_Phdr Elf32_Phdr
#endif

size_t ramdisk_read(void *buf, size_t offset, size_t len);
size_t ramdisk_write(const void *buf, size_t offset, size_t len);

static uintptr_t loader(PCB *pcb, const char *filename) {
  // TODO();
  Elf_Ehdr eh;
  Elf_Phdr ph;
  ramdisk_read(&eh, 0, sizeof(Elf_Ehdr));
  for(int i=0;i<eh.e_phnum;i++)
  {
    ramdisk_read(&ph, eh.e_phoff + i * sizeof(Elf_Phdr), sizeof(Elf_Phdr));
    ramdisk_read((uintptr_t *)ph.p_vaddr ,ph.p_offset, ph.p_memsz);
    memset((uintptr_t *)(ph.p_vaddr + ph.p_filesz), 0, ph.p_memsz - ph.p_filesz);
  }
  return 0;
}

void naive_uload(PCB *pcb, const char *filename) {
  uintptr_t entry = loader(pcb, filename);
  Log("Jump to entry = %p", entry);
  ((void(*)())entry) ();
}

