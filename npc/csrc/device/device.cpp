#include<verilator.h>
#include<npc.h>
#include<device.h>
#include<sys/time.h>

extern uint32_t *vgactl_port_base;
extern void *vmem;

static uint64_t boot_time = 0;

void vga_update_screen();
uint64_t get_time_internal();
uint64_t get_time();

uint64_t device_read(uint64_t addr)
{
    assert(addr>MMIO_BASE && addr<MMIO_END);
    if(addr == RTC_ADDR)
        return get_time();
    else if(addr == SYNC_ADDR)
        return vgactl_port_base[1];
    else if(addr == VGACTL_ADDR)
        return vgactl_port_base[0];
    else if(addr >= FB_ADDR && addr < FB_ADDR + 480000) return ((uint32_t *)vmem)[(addr - FB_ADDR)/4];
    else{
        Log("addr:0x%lx", addr);
        Log("pc:%016lx", top->io_IF_pc);
        
        // assert(0);
        return 0;
    }
}

void device_write(uint64_t addr, uint64_t data, int len)
{
    assert(addr>MMIO_BASE && addr<MMIO_END);
    if(addr == SERIAL_PORT) putchar((char)data);
    else if(addr == SYNC_ADDR){vgactl_port_base[1] = data;}
    else if(addr == VGACTL_ADDR) vgactl_port_base[0] = data;
    else if(addr >= FB_ADDR && addr < FB_ADDR + 480000) 
    {
        switch(len)
        {
            case 1: ((uint8_t *)vmem)[addr-FB_ADDR] = data; break;
            case 2: ((uint16_t *)vmem)[(addr-FB_ADDR) / sizeof(uint16_t)] = data; break;
            case 4: ((uint32_t *)vmem)[(addr-FB_ADDR) / sizeof(uint32_t)] = data; break;
            case 8: ((uint64_t *)vmem)[(addr-FB_ADDR) / sizeof(uint64_t)] = data; break;
            default: Log("unsupport write len!"); assert(0);
        }
        assert(len == 4);
        // ((uint32_t *)vmem)[(int)((addr - FB_ADDR) / 4 + offset)] = data;
    }
    else{
        Log("addr:0x%lx", addr); 
        assert(0);
    }
}

void device_update()
{
    vga_update_screen();
}



uint64_t get_time_internal()
{
    struct timespec now;
    clock_gettime(CLOCK_MONOTONIC_COARSE, &now);
    uint64_t us = now.tv_sec * 1000000 + now.tv_nsec / 1000;
    return us;    
}

uint64_t get_time()
{
    if(boot_time == 0) boot_time = get_time_internal();
    uint64_t now = get_time_internal();
    return now - boot_time;
}



