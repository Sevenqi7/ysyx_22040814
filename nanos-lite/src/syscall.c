#include <common.h>
#include "syscall.h"

char *syscall_name[] =
{
  "exit", "yield", "open", "read", "write", "kill",
  "getpid", "close", "lseek", "brk", "fstat", "time",
  "signal", "execve", "fork", "link", "unlink", "wait",
  "times", "gettimeofday"
};

#define STRACE 1

extern char _heap_start;

void do_syscall(Context *c) {
  uintptr_t a[4];
  a[0] = c->GPR1;
  a[1] = c->gpr[10];
  a[2] = c->gpr[11];
  a[3] = c->gpr[12];
  int fd, len;
  char *buf;
  #ifdef STRACE
  Log("STRACE: SYS_%s called, args:%u %u %u", syscall_name[a[0]], a[1], a[2], a[3]);
  #endif
  switch (a[0]) {
    case SYS_exit : halt(c->gpr[10]);
    case SYS_yield: yield(); c->gpr[10] = 0; break;
    case SYS_write:
                    fd = a[1], buf = (char *)a[2], len=a[3];
                    if(fd == 1 || fd == 2)
                      for(int i=0;i<len;i++) 
                        putch(buf[i]);
                    c->gpr[10] = len;
                    break;
    case SYS_brk  : c->gpr[10] = 0; break;
    default: panic("Unhandled syscall ID = %d", a[0]);
  }
  #ifdef STRACE
  Log("STRACE: retval: %d", c->gpr[10]);
  if(a[0] == SYS_brk) assert(c->gpr[10] == 0);
  #endif
}
