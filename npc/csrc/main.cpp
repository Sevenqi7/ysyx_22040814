// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2017 by Wilson Snyder.
// SPDX-License-Identifier: CC0-1.0
//======================================================================

#include <verilator.h>
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
    // printf("addr:%lx\n", addr);
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

uint64_t *cpu_gpr = NULL;
extern "C" void set_gpr_ptr(const svOpenArrayHandle r) {
  cpu_gpr = (uint64_t *)(((VerilatedDpiOpenVar*)r)->datap());
}

void dump_gpr() {
  int i;
  for (i = 0; i < 32; i++) {
    printf("gpr[%d] = 0x%lx\n", i, cpu_gpr[i]);
  }
}

void sdb_mainloop();
VerilatedContext *contextp;
Vtop *top;

void reset(int time)
{
    top->reset = !0;
    for(int i=0;i<time;i++)
    {
        contextp->timeInc(1);
        top->clock = !top->clock;
        top->eval();
    }
    top->reset = !1;
}


void ebreak(int halt_ret)
{
    printf("\033[0m\033[1;32m%s\033[0m\n", "NPCTRAP SUCCESS");
    if(halt_ret)
        printf("    \033[0m\033[1;31m%s 0x%lx\033[0m\n", "HIT BAD TRAP AT PC:", top->io_IF_pc);
    else
        printf("    \033[0m\033[1;32m%s 0x%lx\033[0m\n", "HIT GOOD TRAP AT PC:", top->io_IF_pc);

}


int main(int argc, char **argv, char **env)
{
    init(argc, argv);
    while (!contextp->gotFinish())
    {
        sdb_mainloop();
        // contextp->timeInc(1); // 1 timeprecision period passes...
        // top->clock = !top->clock;
        // if(!top->reset)
        //     top->io_inst = pmem_read(top->io_IF_pc, 4);
        // if(!top->io_inst)
        // {
        //     printf("\n\033[0m\033[1;31m%s 0x%lx\033[0m\n", "All 0 inst found in addr: ", top->io_IF_pc);
        //     return -1;
        // }    

        // top->eval();
        // printf("time=%ld clk=%x rst=%x inst=0x%x IF_pc=0x%lx\n", contextp->time(), top->clock, top->reset, top->io_inst, top->io_IF_pc);
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
    Verilated::mkdir("logs");
    contextp = new VerilatedContext;
    contextp->debug(0);
    contextp->randReset(3);
    contextp->traceEverOn(true);
    contextp->commandArgs(argc, argv);
    top = new Vtop;
    top->clock = 0;
    reset(10);
    //read img
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