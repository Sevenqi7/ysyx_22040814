#include <verilator.h>
#include <npc.h>

bool ioe_init();

void init_device()
{
    ioe_init();
    Log("finish");
}