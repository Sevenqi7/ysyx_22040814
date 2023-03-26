#include<verilator.h>
#include<npc.h>
#include<device.h>
#include<time.h>

uint64_t device_read(uint64_t addr)
{
    assert(addr>MMIO_BASE && addr<MMIO_END);
    if(addr == RTC_ADDR)
        return clock();
}

void device_write(uint64_t addr, uint64_t data)
{
    assert(addr>MMIO_BASE && addr<MMIO_END);
    if(addr == SERIAL_PORT) putchar((char)data);
}