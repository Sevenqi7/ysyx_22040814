#include<verilator.h>
#include<npc.h>
#include<device.h>
#include<time.h>

extern uint32_t *vgactl_port_base;
extern void *vmem;

void vga_update_screen();
void screen_size();

uint64_t device_read(uint64_t addr)
{
    assert(addr>MMIO_BASE && addr<MMIO_END);
    if(addr == RTC_ADDR)
        return clock();
    else if(addr == SYNC_ADDR)
        return vgactl_port_base[1];
    else if(addr == VGACTL_ADDR)
        return vgactl_port_base[0];
    else if(addr >= FB_ADDR && addr < FB_ADDR + 120000) return ((uint32_t *)vmem)[addr - FB_ADDR];
    else{
        // Log("addr:0x%lx", addr);
        // assert(0);
        return 0;
    }
}

void device_write(uint64_t addr, uint64_t data)
{
    assert(addr>MMIO_BASE && addr<MMIO_END);
    if(addr == SERIAL_PORT) putchar((char)data);
    else if(addr == SYNC_ADDR){vgactl_port_base[1] = data;}
    else if(addr == VGACTL_ADDR) vgactl_port_base[0] = data;
    else if(addr >= FB_ADDR && addr < FB_ADDR + 120000) {((uint32_t *)vmem)[(addr - FB_ADDR)] = data;}
    else{
        // Log("addr:0x%lx", addr);
        // assert(0);
    }
}

void device_update()
{
    vga_update_screen();
}