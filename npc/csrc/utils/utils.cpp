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
    }
#ifdef CONFIG_DEBUGMSG
    Log("ID_npc:0x%lx", top->io_ID_npc);
    Log("PF_npc:0x%lx", top->io_PF_npc);
    Log("PF_pc:0x%lx", top->io_PF_pc);
    Log("PF_axidata:0x%lx", top->io_PF_axidata);
    Log("IF_pc:0x%lx", top->io_IF_pc); 
    Log("IF_valid:%d", top->io_IF_valid);
    Log("IF_req:%d", top->io_IF_AXIREQ);
    Log("IF_Inst:0x%x", top->io_IF_Inst);
    Log("ID_pc:0x%lx", top->io_ID_pc);
    Log("EX_pc:0x%lx", top->io_EX_pc);
    Log("MEM_pc:0x%lx", top->io_PMEM_pc);
    Log("MEM_req:%d", top->io_MEM_AXIREQ);
    Log("WB_pc:0x%lx ", top->io_WB_pc);
    Log("ID_ALUData1:0x%lx ID_ALUData2:0x%lx", top->io_ID_ALU_Data1, top->io_ID_ALU_Data2);
    Log("ID_Rs1Data:0x%lx ID_Rs2Data:0x%lx", top->io_ID_Rs1Data, top->io_ID_Rs2Data);
    Log("ALUResult:0x%lx", top->io_ALUResult);
    Log("MemRegWriteData_Pass:0x%lx", top->io_MEM_RegWriteData);
    Log("WB_RegWriteData:0x%lx", top->io_WB_RegWriteData);
    Log("WB_RegWriteID:%d", top->io_WB_RegWriteID);
    Log("WB_valid:%d", top->io_WB_valid);
    if(top->io_stall)
        Log("stall deteceted");
#endif
}