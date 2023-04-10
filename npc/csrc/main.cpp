// DESCRIPTION: Verilator: Verilog example module
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2017 by Wilson Snyder.
// SPDX-License-Identifier: CC0-1.0
//======================================================================

#include <verilator.h>
#include <npc.h>
#include <memory.h>
#include <stdio.h>

long img_size;

long init_img(int argc, char **argv);
void init_sdb();
void init_disasm(const char *triple);
void init_ftrace(char *path);
void init_vga();
#ifdef CONFIG_DIFFTEST
void init_difftest(char *ref_so_file, long img_size, int port);
#endif
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

int main(int argc, char **argv, char **env)
{
    img_size = init_img(argc, argv);
    init_disasm("riscv64");
    init_ftrace(argv[2]);
    #ifdef CONFIG_DIFFTEST
    init_difftest(argv[3],img_size, 1234);
    #endif
    init_sdb();
    init_vga();
    while (!contextp->gotFinish() && npc_state.state != NPC_QUIT)
        sdb_mainloop();
    top->final();
    // Coverage analysis (calling write only after the test is known to pass)
#if VM_COVERAGE
    Verilated::mkdir("logs");
    contextp->coveragep()->write("logs/coverage.dat");
#endif

    // Return good completion status
    // Don't use exit() or destructor won't get called
    return npc_state.state == NPC_END;
}

long init_img(int argc, char **argv)
{
    Verilated::mkdir("logs");
    contextp = new VerilatedContext;
    contextp->debug(0);
    contextp->randReset(3);
    contextp->traceEverOn(true);
    contextp->commandArgs(argc, argv);
    top = new Vtop;
    top->clock = 0;
    while(top->io_IF_pc != RESET_VECTOR)
        reset(5);
    for(int i=0;i<PIPELINE_STAGES * 2;i++)
    {
        contextp->timeInc(1);
        top->clock = !top->clock;
        top->eval();
    }
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
    int ret = fread(pmem_addr(0), size, 1, fp);
    if(ret == -1)
    {
        printf("\033[0m\033[1;31m%s\033[0m", "Error: Failed to read image file!\n");
        exit(-1);
    }
    fclose(fp);
    return size;
}