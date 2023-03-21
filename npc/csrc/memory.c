#include <verilator.h>
#include <npc.h>

static char pmem[MEMSIZE]__attribute((aligned(4096)));

uint64_t *pmem_addr(uint64_t *addr)
{
    return (uint64_t *)(pmem + ((uint64_t)addr & 0xFFFFFF));
}

void outofbound(uint64_t paddr)
{
    if(paddr >= MEMSIZE)
    {
        printf("\033[0m\033[1;31m%s addr:0x%lx\033[0m\n", "Addr out of bound, ", paddr);
        exit(-1);
    }
}

uint64_t pmem_read(uint64_t addr, int len)
{
    uint64_t paddr = addr & 0xFFFFFF;
    outofbound(paddr);
    int ret = 0;
    switch(len)
    {
        case 0: return 0;
        case 1: return *(uint8_t  *)(pmem + paddr);
        case 2: return *(uint16_t *)(pmem + paddr);
        case 4: return *(uint32_t *)(pmem + paddr);
        case 8: return *(uint64_t *)(pmem + paddr);
        default: printf("\033[0m\033[1;31m%s\033[0m", "Unsupported len\n"); exit(-1);
    }
    return 0;
}