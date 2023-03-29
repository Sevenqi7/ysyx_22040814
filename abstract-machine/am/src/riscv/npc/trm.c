#include <am.h>
#include <riscv/riscv.h>
#include <klib-macros.h>

extern char _heap_start;
int main(const char *args);

extern char _pmem_start;
#define PMEM_SIZE (128 * 1024 * 1024)
#define PMEM_END  ((uintptr_t)&_pmem_start + PMEM_SIZE)

Area heap = RANGE(&_heap_start, PMEM_END);
#ifndef MAINARGS
#define MAINARGS ""
#endif
static const char mainargs[] = MAINARGS;

extern void pmem_write(uint64_t addr, int len, uint64_t data);

void putch(char ch) {
  // outb(0xa00003f8, ch);
}


void halt(int code) {
  asm volatile(
    "ebreak"
  );
  while (1);
}

void _trm_init() {
  int ret = main(mainargs);
  halt(ret);
}
