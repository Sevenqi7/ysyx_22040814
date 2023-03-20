// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2017 by Wilson Snyder.
// SPDX-License-Identifier: CC0-1.0
//======================================================================

// For std::unique_ptr
#include <memory>

// Include common routines
#include <verilated.h>

// Include model header, generated from Verilating "top.v"
#include "svdpi.h"
#include "Vtop__Dpi.h"
#include "Vtop.h"
#include <stdio.h>

#define MEMSIZE     0x8000000

#define MEMOFFSET   0x8000000
#define EBREAK      0x00100073

static char pmem[MEMSIZE]__attribute((aligned(4096)));
void init(int argc, char **argv);

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

uint32_t halt_ret;
uint64_t now_pc;

void ebreak(unsigned halt_ret)
{
    printf("EBREAK executed, ending simulate...\n");
    printf("%x\n", halt_ret);
}


int main(int argc, char **argv, char **env)
{
    init(argc, argv);
    Verilated::mkdir("logs");
    const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
    contextp->debug(0);
    contextp->randReset(3);
    contextp->traceEverOn(true);
    contextp->commandArgs(argc, argv);
    const std::unique_ptr<Vtop> top{new Vtop{contextp.get(), "TOP"}};
    top->reset = !0;
    top->clock = 0;
    int cnt = 0;

    while (!contextp->gotFinish())
    {
        contextp->timeInc(1); // 1 timeprecision period passes...
        top->clock = !top->clock;
        if(!top->reset)
            top->io_inst = pmem_read(top->io_IF_pc, 4);
        if(!top->io_inst)
        {
            printf("\n\033[0m\033[1;31m%s 0x%lx\033[0m\n", "All 0 inst found in addr: ", top->io_IF_pc);
            return -1;
        }    
        if (!top->clock) {
            if (contextp->time() > 1 && contextp->time() < 10) {
                top->reset = !0;  // Assert reset
            } else {
                top->reset = !1;  // Deassert reset
            }
        }
        top->eval();
        printf("time=%ld clk=%x rst=%x inst=0x%x IF_pc=0x%lx\n", contextp->time(), top->clock, top->reset, top->io_inst, top->io_IF_pc);
        if(cnt++ > 50) break;
    }

    top->final();

    // Coverage analysis (calling write only after the test is known to pass)
#if VM_COVERAGE
    Verilated::mkdir("logs");
    contextp->coveragep()->write("logs/coverage.dat");
#endif

    // Return good completion status
    // Don't use exit() or destructor won't get called
    return 0;
}

void init(int argc, char **argv)
{
    // for(int i=0;i<10;i++)
    // {
    //     inst_mem[i] = 0xfff58593;
    // }
    // inst_mem[10] = 0x00100073;
    if(argc <= 1)
    {
        printf("\033[0m\033[1;31m%s\033[0m", "Usage: make ARCH=$ISA run\n");
        exit(0);
    }
    char *img_file = argv[1];
    if(img_file == NULL)
    {
        printf("\033[0m\033[1;31m%s\033[0m", "Error: No image is given!\n");
        exit(0);
    }
    FILE *fp = fopen(img_file, "rb");
    fseek(fp, 0, SEEK_END);
    long size = ftell(fp);
    printf("\033[0m\033[1;36mThe image is %s, size=%ld\033[0m\n", img_file, size);
    
    fseek(fp, 0, SEEK_SET);
    int ret = fread(pmem, size, 1, fp);
    if(ret == -1)
    {
        printf("\033[0m\033[1;31m%s\033[0m", "Error: Failed to read image file!\n");
        exit(-1);
    }
    fclose(fp);
}