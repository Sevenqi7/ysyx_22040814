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
#include "Vtop.h"

#define MEMSIZE 2048

uint64_t inst_mem[MEMSIZE];

uint32_t pmem_read(uint64_t addr)
{
    if(addr >= 0x80000000)
        return (uint32_t)inst_mem[addr & 0xFF];
    return 0;
}


int main(int argc, char **argv, char **env)
{

    for(int i=0;i<10;i++)
    {
        inst_mem[i] = 0xfff58593;
    }

    if (false && argc && argv && env)
    {
    }
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
        top->io_inst = pmem_read(top->io_IF_pc);
        top->clock = !top->clock;
        if (!top->clock) {
            if (contextp->time() > 1 && contextp->time() < 10) {
                top->reset = !0;  // Assert reset
            } else {
                top->reset = !1;  // Deassert reset
            }
        }
        top->eval();
        printf("time=%ld clk=%x rst=%x inst=%x IF_pc=%lx\n", contextp->time(), top->clock, top->reset, top->io_inst, top->io_IF_pc);
        if(cnt++ > 20) break;
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
