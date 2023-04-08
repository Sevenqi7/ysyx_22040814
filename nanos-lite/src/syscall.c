#include <common.h>
#include <fs.h>
#include <proc.h>
#include "syscall.h"

char *syscall_name[] =
{
  "exit", "yield", "open", "read", "write", "kill",
  "getpid", "close", "lseek", "brk", "fstat", "time",
  "signal", "execve", "fork", "link", "unlink", "wait",
  "times", "gettimeofday"
};

struct timeval {
    uint64_t      tv_sec;     /* seconds */
    uint64_t      tv_usec;    /* microseconds */
};

struct timezone {
    int tz_minuteswest;     /* minutes west of Greenwich */
    int tz_dsttime;         /* type of DST correction */
};


// #define STRACE 1
extern void naive_uload(PCB *pcb, const char *filename);
extern char _heap_start;

void do_syscall(Context *c) {
  uintptr_t a[4];
  a[0] = c->GPR1;
  a[1] = c->gpr[10];
  a[2] = c->gpr[11];
  a[3] = c->gpr[12];
  int fd = a[1], len = a[3], whence = a[3], offset = a[2];
  char *filename = (char *) a[1], *buf = (char *)a[2];
  #ifdef STRACE
  char *print_file_name(int fd);
  Log("STRACE: SYS_%s called, args:%u 0x%x 0x%x", syscall_name[a[0]], a[1], a[2], a[3]);
  if(a[0] >= SYS_read && a[0] <= SYS_write) Log("Filename: %s", print_file_name(fd));
  else if(a[0] == SYS_open) Log("Filename:%s", filename);
  else if(a[0] == SYS_execve) Log("EXECVE:%s", filename);
  #endif
  switch (a[0]) {
    case SYS_exit : naive_uload(NULL, "/bin/menu");
    case SYS_yield: yield(); c->gpr[10] = 0; break;
    case SYS_open : c->gpr[10] = fs_open(filename, a[2], a[3]); break;
    case SYS_read : c->gpr[10] = fs_read(fd, buf, len); break;
    case SYS_close: c->gpr[10] = fs_close(fd); break;
    case SYS_lseek: c->gpr[10] = fs_lseek(fd, offset, whence); break;
    case SYS_write: c->gpr[10] = fs_write(fd, buf, len); break;
    case SYS_brk  : c->gpr[10] = 0; break;
    case SYS_execve: naive_uload(NULL, filename); assert("should not reach here" && 0);
    case SYS_gettimeofday: 
                    struct timeval *tv = (struct timeval *)a[1];
                    uint64_t time; 
                    ioe_read(AM_TIMER_UPTIME, &time);
                    tv->tv_sec = time / 1000000, tv->tv_usec = time % 1000000;
                    c->gpr[10] = 0; break;
    default: panic("Unhandled syscall ID = %d", a[0]);
  }
  #ifdef STRACE
  Log("STRACE: retval: %d", c->gpr[10]);
  if(a[0] == SYS_brk) assert(c->gpr[10] == 0);
  #endif
}
