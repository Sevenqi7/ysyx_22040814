#include <common.h>
#include "syscall.h"

void do_syscall(Context *c) {
  uintptr_t a[4];
  a[0] = c->GPR1;
  Log("SYSCALL occured, id:%d", a[0]);
  switch (a[0]) {
    case SYS_exit : halt(c->gpr[10]);
    case SYS_yield: yield(); c->gpr[10] = 0; break;
    default: panic("Unhandled syscall ID = %d", a[0]);
  }
}
