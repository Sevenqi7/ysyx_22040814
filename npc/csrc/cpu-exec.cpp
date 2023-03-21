#include <verilator.h>

uint64_t pmem_read(uint64_t addr, int len);

void exec_once()
{
    for(int i=0;i<2;i++)
    {
        contextp->timeInc(1); // 1 timeprecision period passes...
        top->clock = !top->clock;
        if(!top->reset)
            top->io_inst = pmem_read(top->io_IF_pc, 4);
        if(!top->io_inst)
        {
            printf("\n\033[0m\033[1;31m%s 0x%lx\033[0m\n", "All 0 inst found in addr: ", top->io_IF_pc);
            exit(-1) ;
        }    

        top->eval();
        if(top->clock)
            Log("time=%ld clk=%x rst=%x inst=0x%x IF_pc=0x%lx\n", contextp->time(), top->clock, top->reset, top->io_inst, top->io_IF_pc);
    }
}

void execute(uint64_t n)
{
    for(int i=0;i<n;i++)
        exec_once();
}