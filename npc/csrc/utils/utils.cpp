#include <verilator.h>
#include <npc.h>

//toggle the clk 2 times
void clock_step()
{
    for(int i=0;i<2;i++)
    {
        contextp->timeInc(1); // 1 timeprecision period passes...
        top->clock = !top->clock;
        top->eval();
        if(i)
        {       
                Log("IF_pc:0x%lx", top->io_IF_pc); 
                Log("ID_pc:0x%lx", top->io_ID_pc);
                Log("EX_pc:0x%lx", top->io_MEM_pc);
                Log("WB_pc:0x%lx ", top->io_WB_pc);
                Log("ALUData1:0x%lx ALUData2:0x%lx", top->io_ALU_Data1, top->io_ALU_Data2);
                Log("ID_Rs1Data:0x%lx ID_Rs2Data:0x%lx", top->io_ID_Rs1Data, top->io_ID_Rs2Data);
                Log("ALUResult:0x%lx", top->io_ALUResult);
                Log("MemRegWriteData_Pass:0x%lx", top->io_MEM_RegWriteData);
        }
    }
}