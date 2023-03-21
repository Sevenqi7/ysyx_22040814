#include <verilator.h>
#include <npc.h>

uint32_t npc_state = NPC_STOP;


void ebreak(int halt_ret)
{
    npc_state = NPC_END;
    printf("\033[0m\033[1;32m%s\033[0m\n", "NPCTRAP SUCCESS");
    if(halt_ret)
        printf("    \033[0m\033[1;31m%s 0x%lx\033[0m\n", "HIT BAD TRAP AT PC:", top->io_IF_pc);
    else
        printf("    \033[0m\033[1;32m%s 0x%lx\033[0m\n", "HIT GOOD TRAP AT PC:", top->io_IF_pc);
}