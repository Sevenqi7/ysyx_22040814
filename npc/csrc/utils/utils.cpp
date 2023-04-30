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
    printf("\n");
    Log("bp_npc:0x%lx", top->io_bp_npc);
    Log("bp_taken:%d", top->io_bp_taken);
    Log("bp_flush:%d", top->io_bp_flush);
    // Log("BTB_hit:%d", top->io_BTB_hit);
    // Log("ras_push:0x%lx", top->io_ras_push);
    // Log("ras_pop:0x%lx", top->io_ras_pop);
    // Log("bht_update:%d", top->io_bht_update);
    // Log("pht_update:%d", top->io_pht_update);
    // Log("pht_idx:%d", top->io_pht_idx);
    // Log("pht_sel:%d", top->io_pht_sel);
    // Log("total fail prediction: %ld", top->io_jal_fail + top->io_jalr_fail + top->io_btype_fail);

    // Log("BTB_rtag:0x%x", top->io_BTB_rtag);
    // Log("BTB_rset:0x%x", top->io_BTB_rset);
    // Log("BTB_rdata:0x%lx", top->io_BTB_rdata);
    // Log("BTB_wtag:0x%x", top->io_BTB_wtag);
    // Log("BTB_wset:0x%x", top->io_BTB_wset);
    // Log("BTB_wdata:0x%lx", top->io_BTB_wdata);
    // Log("ID_npc:0x%lx", top->io_ID_npc);
    // Log("PF_npc:0x%lx", top->io_PF_npc);
    Log("PF_pc:0x%lx", top->io_PF_pc);
    // Log("PF_axidata:0x%lx", top->io_PF_axidata);
    Log("IF_pc:0x%lx", top->io_IF_pc); 
    Log("IF_valid:%d", top->io_IF_valid);
    // Log("IF_req:%d", top->io_IF_AXIREQ);
    // Log("IF_Inst:0x%x", top->io_IF_Inst);
    Log("ID_pc:0x%lx", top->io_ID_pc);
    Log("EX_pc:0x%lx", top->io_EX_pc);
    Log("MEM_pc:0x%lx", top->io_PMEM_pc);
    // Log("MEM_req:%d", top->io_MEM_AXIREQ);
    Log("WB_pc:0x%lx ", top->io_WB_pc);
    // Log("ID_ALUData1:0x%lx ID_ALUData2:0x%lx", top->io_ID_ALU_Data1, top->io_ID_ALU_Data2);
    // Log("ID_Rs1Data:0x%lx ID_Rs2Data:0x%lx", top->io_ID_Rs1Data, top->io_ID_Rs2Data);
    // Log("ALUResult:0x%lx", top->io_ALUResult);
    Log("MemRegWriteData_Pass:0x%lx", top->io_MEM_RegWriteData);
    Log("WB_RegWriteData:0x%lx", top->io_WB_RegWriteData);
    Log("WB_RegWriteID:%d", top->io_WB_RegWriteID);
    Log("WB_valid:%d", top->io_WB_valid);
    if(top->io_stall)
        Log("stall deteceted");
#endif
}