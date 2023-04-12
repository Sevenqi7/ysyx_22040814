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


void sdb_mainloop();
void init_npc(int argc, char **argv);
VerilatedContext *contextp;
Vtop *top;

int main(int argc, char **argv, char **env)
{
    init_npc(argc, argv);
    while (!contextp->gotFinish() && npc_state.state != NPC_QUIT)
        sdb_mainloop();
    

    // Coverage analysis (calling write only after the test is known to pass)
#if VM_COVERAGE
    Verilated::mkdir("logs");
    contextp->coveragep()->write("logs/coverage.dat");
#endif
    // Return good completion status
    // Don't use exit() or destructor won't get called
    top->final();
    return npc_state.state != NPC_END;
}

