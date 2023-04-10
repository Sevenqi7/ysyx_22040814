#include <verilator.h>
#include <npc.h>

NPCState npc_state{.state=NPC_STOP};
bool inst_fault = false;

void unknown_inst()
{
    if(top->reset || top->io_stall) return;
    inst_fault = true;
}

void ebreak(long long int halt_ret)
{
    if(npc_state.state == NPC_END) return;
    npc_state.state = NPC_END;
    printf("\033[0m\033[1;32m%s\033[0m\n", "NPCTRAP SUCCESS");
    if(halt_ret)
        printf("    \033[0m\033[1;31m%s 0x%lx\033[0m\n", "HIT BAD TRAP AT PC:", top->io_WB_pc);
    else
        printf("    \033[0m\033[1;32m%s 0x%lx\033[0m\n", "HIT GOOD TRAP AT PC:", top->io_WB_pc);
}