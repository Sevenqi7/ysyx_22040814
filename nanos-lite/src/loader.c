#include <proc.h>
#include <elf.h>
#include <fs.h>

#ifdef __LP64__
# define Elf_Ehdr Elf64_Ehdr
# define Elf_Phdr Elf64_Phdr
#else
# define Elf_Ehdr Elf32_Ehdr
# define Elf_Phdr Elf32_Phdr
#endif

size_t ramdisk_read(void *buf, size_t offset, size_t len);
size_t ramdisk_write(const void *buf, size_t offset, size_t len);

// static uintptr_t loader(PCB *pcb, const char *filename) {
//   // TODO();
//   Elf_Ehdr eh;
//   Elf_Phdr ph;
//   ramdisk_read(&eh, 0, sizeof(Elf_Ehdr));
//   assert(*((uint32_t *)eh.e_ident) == 0x464c457f);
//   for(int i=0;i<eh.e_phnum;i++)
//   {
//     ramdisk_read(&ph, eh.e_phoff + i * sizeof(Elf_Phdr), sizeof(Elf_Phdr));
//     ramdisk_read((uintptr_t *)ph.p_vaddr ,ph.p_offset, ph.p_memsz);
//     Log("Segment %d: vaddr:0x%lx size:%d", i, ph.p_vaddr, ph.p_memsz);
//     memset((uintptr_t *)(ph.p_vaddr + ph.p_filesz), 0, ph.p_memsz - ph.p_filesz);
//   }
//   return eh.e_entry;
// }

static uintptr_t loader(PCB *pcb, const char *filename) {
  int fd = fs_open(filename, 0, 0);
  Log("loader load file:%s", filename);
  assert(fd != -1);
  Elf_Ehdr eh;
  Elf_Phdr ph;
  fs_read(fd, &eh, sizeof(Elf_Ehdr));
  assert(*((uint32_t *)eh.e_ident) == 0x464c457f);
  for(int i=0;i<eh.e_phnum;i++)
  {
    fs_lseek(fd, eh.e_phoff + i * sizeof(Elf_Phdr), SEEK_SET);
    fs_read(fd, &ph, sizeof(Elf_Phdr));
    // Log("Segment %d: vaddr:0x%lx size:%d", i, ph.p_vaddr, ph.p_memsz);
    fs_lseek(fd, ph.p_offset, SEEK_SET);
    fs_read(fd, (void *)ph.p_vaddr, ph.p_memsz);
    memset((uintptr_t *)(ph.p_vaddr + ph.p_filesz), 0, ph.p_memsz - ph.p_filesz);
  }
  fs_close(fd);
  return eh.e_entry;
}

void naive_uload(PCB *pcb, const char *filename) {
  uintptr_t entry = loader(pcb, filename);
  Log("Jump to entry = %p", entry);
  ((void(*)())entry) ();
}

