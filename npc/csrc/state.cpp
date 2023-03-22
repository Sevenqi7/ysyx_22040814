#include <verilator.h>
#include <npc.h>

uint32_t npc_state = NPC_STOP;


void unknown_inst(int inst)
{
    npc_state = NPC_ABORT;
    printf("\033[0m\033[1;31m%s\033[0m\n", "UNKNOWN INST RECEIVED:\n");
    printf("\033[0m\033[1;32mPC:%016x inst:%08x\033[0m\n", top->io_IF_pc, (uint32_t)inst);
}

void ebreak(int halt_ret)
{
    npc_state = NPC_END;
    printf("\033[0m\033[1;32m%s\033[0m\n", "NPCTRAP SUCCESS");
    if(halt_ret)
        printf("    \033[0m\033[1;31m%s 0x%lx\033[0m\n", "HIT BAD TRAP AT PC:", top->io_IF_pc);
    else
        printf("    \033[0m\033[1;32m%s 0x%lx\033[0m\n", "HIT GOOD TRAP AT PC:", top->io_IF_pc);
}