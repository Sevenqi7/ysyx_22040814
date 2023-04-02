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
  switch (a[0]) {
    case SYS_exit : halt(c->gpr[10]);
    case SYS_yield: yield(); c->gpr[10] = 0; break;
    default: panic("Unhandled syscall ID = %d", a[0]);
  }
  Log("STRACE: SYS_%s called, retval:%d", syscall_name[a[0]], c->gpr[10]);
}
