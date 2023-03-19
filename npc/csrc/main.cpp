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
    if(addr > 0x80000000)
        return (uint32_t)inst_mem[addr & 0xFF];
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
    contextp->randReset(2);
    contextp->traceEverOn(true);
    contextp->commandArgs(argc, argv);
    const std::unique_ptr<Vtop> top{new Vtop{contextp.get(), "TOP"}};

    top->reset = !0;
    top->clock = 0;

    while (!contextp->gotFinish())
    {
        contextp->timeInc(1); // 1 timeprecision period passes...
        top->clock = !top->clock;
        top->io_inst = pmem_read(top->io_IF_pc)
        top->eval();
        // VL_PRINTF("[%" VL_PRI64 "d] clk=%x rstl=%x iquad=%" VL_PRI64 "x"
        //           " -> oquad=%" VL_PRI64 "x owide=%x_%08x_%08x\n",
        //           contextp->time(), top->clk, top->reset_l, top->in_quad, top->out_quad,
        //           top->out_wide[2], top->out_wide[1], top->out_wide[0]);
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
