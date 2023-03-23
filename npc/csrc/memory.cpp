#include <verilator.h>
#include <npc.h>
#include <memory.h>

static uint8_t pmem[MEMSIZE]__attribute((aligned(4096)));

extern uint8_t* guest_to_host(paddr_t paddr){return pmem + (paddr & MEMMASK);}


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
    uint64_t paddr = addr & MEMMASK;
    outofbound(paddr);
    int ret = 0;
    switch(len)
    {
        case 0: return 0;
        case 1: return *(uint8_t  *)(pmem + paddr);
        case 2: return *(uint16_t *)(pmem + paddr);
        case 4: return *(uint32_t *)(pmem + paddr);
        case 8: return *(uint64_t *)(pmem + paddr);
        default: printf("\033[0m\033[1;31m%s\033[0m", "Unsupported len\n"); npc_state.state = NPC_ABORT;
    }
    return 0;
}

void pmem_write(uint64_t addr, int len, uint64_t data)
{
    uint64_t paddr = addr & MEMMASK;
    outofbound(paddr);
    int ret = 0;
    switch (len) {
    case 1: *(uint8_t  *)(pmem + paddr) = data; return;
    case 2: *(uint16_t *)(pmem + paddr) = data; return;
    case 4: *(uint32_t *)(pmem + paddr) = data; return;
    case 8: *(uint64_t *)(pmem + paddr) = data; return;
    default: printf("\033[0m\033[1;31m%s\033[0m", "Unsupported len\n"); npc_state.state = NPC_ABORT;
  }
}

extern "C" void dci_pmem_read(long long raddr, long long *rdata,char rmask) {
  // 总是读取地址为`raddr & ~0x7ull`的8字节返回给`rdata`
  int len = 0;
  while(rmask >>= 1) len++;
  Log("read len:%d", len);
  *rdata = pmem_read(raddr, len);
}
extern "C" void dci_pmem_write(long long waddr, long long wdata, char wmask) {
  // 总是往地址为`waddr & ~0x7ull`的8字节按写掩码`wmask`写入`wdata`
  // `wmask`中每比特表示`wdata`中1个字节的掩码,
  // 如`wmask = 0x3`代表只写入最低2个字节, 内存中的其它字节保持不变
  int len = 0;
  while(wmask >>= 1) len++;
  Log("write len:%d data:%lx addr:%lx", len, wdata, waddr);
  pmem_write(waddr, len, wdata);
}