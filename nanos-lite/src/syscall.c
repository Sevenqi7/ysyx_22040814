#include <common.h>
#include "syscall.h"

char *syscall_name[] =
{
  "exit", "yield", "open", "read", "write", "kill",
  "getpid", "close", "lseek", "brk", "fstat", "time",
  "signal", "execve", "fork", "link", "unlink", "wait",
  "times", "gettimeofday"
};

void do_syscall(Context *c) {
  uintptr_t a[4];
  a[0] = c->GPR1;
  a[1] = c->gpr[10];
  a[2] = c->gpr[11];
  a[3] = c->gpr[12];
  int fd, len;
  char *buf;
  switch (a[0]) {
    case SYS_exit : halt(c->gpr[10]);
    case SYS_yield: yield(); c->gpr[10] = 0; break;
    case SYS_write:
                    fd = a[1], buf = (char *)a[2], len=a[3];
                    if(fd == 1 || fd == 2)
                      for(int i=0;i<len;i++) 
                        putch(buf[i]);
                    break;
    default: panic("Unhandled syscall ID = %d", a[0]);
  }
  Log("STRACE: SYS_%s called, retval:%d, args:%d %d %d", syscall_name[a[0]], c->GPR2, c->GPR3, c->GPR4);
}
