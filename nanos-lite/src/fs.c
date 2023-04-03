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

enum {FD_STDIN, FD_STDOUT, FD_STDERR, FD_FB, FD_EVENT};

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

extern size_t serial_write(const void *buf, size_t offset, size_t len);
extern size_t events_read(void *buf, size_t offset, size_t len);

/* This is the information about all files in disk. */
static Finfo file_table[] __attribute__((used)) = {
  [FD_STDIN]  = {"stdin", 0, 0, invalid_read, invalid_write},
  [FD_STDOUT] = {"stdout", 0, 0, invalid_read, serial_write},
  [FD_STDERR] = {"stderr", 0, 0, invalid_read, serial_write},
  [FD_EVENT]  = {"/dev/events", 0, 0, events_read, invalid_write},
#include "files.h"
};

void init_fs() {
  // TODO: initialize the size of /dev/fb
}

size_t fs_read(int fd, const void *buf, size_t len)
{
  if(file_table[fd].read)
      return file_table[fd].read((void *)buf, 0, len);
  int file_num = sizeof(file_table) / sizeof(Finfo), file_len = file_table[fd].size;
  assert(fd >= 0 && fd < file_num);
  int disk_offset = file_table[fd].disk_offset, open_offset = file_table[fd].open_offset;
  if(open_offset >= file_len) return -1;
  int offset = disk_offset + open_offset; 
  int read_len = len > (file_len-open_offset) ? (file_len-open_offset) : len;
  memcpy((void *)buf, &ramdisk_start + offset, read_len);
  file_table[fd].open_offset += read_len;
  // Log("readlen:%d", read_len);
  // Log("offset after read:%d", file_table[fd].open_offset);
  return read_len;
}

size_t fs_write(int fd, const void *buf, size_t len)
{
  if(file_table[fd].write)
      return file_table[fd].write(buf, 0, len);
  int file_num = sizeof(file_table) / sizeof(Finfo), file_len = file_table[fd].size;
  assert(fd >= 0 && fd < file_num);
  int disk_offset = file_table[fd].disk_offset, open_offset = file_table[fd].open_offset;
  if(open_offset >= file_len) return -1;
  int offset = disk_offset + open_offset; 
  int write_len = len > (file_len-open_offset) ? (file_len-open_offset) : len;
  memcpy(&ramdisk_start + offset, buf, write_len);
  file_table[fd].open_offset += write_len;
  // Log("writelen:%d", write_len);
  // Log("offset after write:%d", file_table[fd].open_offset);
  return write_len;
}

int fs_open(const char *pathname, int flags, int mode)
{
  int file_num = sizeof(file_table) / sizeof(Finfo);
  for(int i=0;i<file_num;i++)
    if(!strcmp(pathname, file_table[i].name))
      {file_table[i].open_offset = 0 ;return i;}
  return -1; 
}

size_t fs_lseek(int fd, size_t offset, int whence)
{
  int file_num = sizeof(file_table) / sizeof(Finfo);
  if(fd < file_num)
  {
    switch(whence)
    {
      case SEEK_SET: file_table[fd].open_offset = offset;   break;
      case SEEK_CUR: file_table[fd].open_offset += offset;  break;
      case SEEK_END: file_table[fd].open_offset = file_table[fd].size; break;
      default: assert(0);
    }
    // Log("open_offset is set to : %d", file_table[fd].open_offset);
    return file_table[fd].open_offset;
  }
  return -1;
}

int fs_close(int fd)
{
  return 0;
}

char *print_file_name(int fd)
{
  return file_table[fd].name;
}