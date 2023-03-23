#ifndef __MEMORY_H
#define __MEMORY_H

#include <stdint.h>

typedef uint64_t paddr_t;
typedef uint64_t vaddr_t;
typedef unsigned char uint8_t;

extern uint8_t* guest_to_host(paddr_t paddr);
extern paddr_t host_to_guest(uint8_t *haddr);

//用C++实现的仿真用的存储器
extern uint64_t *pmem_addr(uint64_t *addr);
extern uint64_t  pmem_read(uint64_t addr, int len);
extern void      pmem_write(uint64_t addr, int len, uint64_t data);

#define MEMSIZE     0x8000000
#define MEMMASK     0x7FFFFFF
#define MEMOFFSET   0x8000000

#endif