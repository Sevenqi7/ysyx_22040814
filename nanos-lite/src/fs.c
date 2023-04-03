#include <fs.h>

typedef size_t (*ReadFn) (void *buf, size_t offset, size_t len);
typedef size_t (*WriteFn) (const void *buf, size_t offset, size_t len);

extern uint8_t ramdisk_start;
extern uint8_t ramdisk_end;

typedef struct {
  char *name;
  size_t size;
  size_t disk_offset;
  ReadFn read;
  WriteFn write;
  size_t open_offset;
} Finfo;

enum {FD_STDIN, FD_STDOUT, FD_STDERR, FD_FB};

size_t fs_read(int fd, const void *buf, size_t len);
size_t fs_write(int fd, const void *buf, size_t len);
int fs_open(const char *pathname, int flags, int mode);
size_t fs_lseek(int fd, size_t offset, int whence);
int fs_close(int fd);

size_t invalid_read(void *buf, size_t offset, size_t len) {
  panic("should not reach here");
  return 0;
}

size_t invalid_write(const void *buf, size_t offset, size_t len) {
  panic("should not reach here");
  return 0;
}

/* This is the information about all files in disk. */
static Finfo file_table[] __attribute__((used)) = {
  [FD_STDIN]  = {"stdin", 0, 0, invalid_read, invalid_write},
  [FD_STDOUT] = {"stdout", 0, 0, invalid_read, invalid_write},
  [FD_STDERR] = {"stderr", 0, 0, invalid_read, invalid_write},
#include "files.h"
};

void init_fs() {
  // TODO: initialize the size of /dev/fb
}

size_t fs_read(int fd, const void *buf, size_t len)
{
  int file_len = file_table[fd].size, offset = file_table[fd].disk_offset;
  memcpy((void *)buf, &ramdisk_start + offset, len > file_len ? file_len : len);
  return len > file_len ? file_len : len;
}

size_t fs_write(int fd, const void *buf, size_t len)
{
  int file_len = file_table[fd].size, offset = file_table[fd].disk_offset;
  memcpy(&ramdisk_start + offset, buf, len > file_len ? file_len : len);
  return len > file_len ? file_len : len;
}

int fs_open(const char *pathname, int flags, int mode)
{
  int filenum = sizeof(file_table) / sizeof(Finfo);
  for(int i=0;i<filenum;i++)
    if(!strcmp(pathname, file_table[i].name))
      return i;
  return -1; 
}

size_t fs_lseek(int fd, size_t offset, int whence)
{
  int filenum = sizeof(file_table) / sizeof(Finfo);
  if(fd < filenum)
  {
    switch(whence)
    {
      case SEEK_SET: file_table[fd].open_offset = offset;   break;
      case SEEK_CUR: file_table[fd].open_offset += offset;  break;
      case SEEK_END: file_table[fd].open_offset = file_table[fd].size-1; break;
      default: assert(0);
    }
    return file_table[fd].open_offset;
  }
  return -1;
}

int fs_close(int fd)
{
  return 0;
}