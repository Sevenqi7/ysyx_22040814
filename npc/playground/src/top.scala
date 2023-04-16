import chisel3._
import chisel3.util._
import chisel3.experimental._

class sim extends BlackBox with HasBlackBoxPath{
    val io = IO(new Bundle{
        val clock = Input(Clock())
        val reset = Input(UInt(1.W))
        val IF_pc = Input(UInt(64.W))
        val GPR  = Input(Vec(32, UInt(64.W)))
        val unknown_inst_flag = Input(UInt(1.W))
        val WB_Inst = Input(UInt(32.W))
        val inst = Output(UInt(64.W))
    })
    addPath("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/npc/playground/verilog/sim.v")
}

class top extends Module{
    val io = IO(new Bundle{
        val ID_npc = Output(UInt(64.W))
        val PF_npc = Output(UInt(64.W))
        val PF_pc = Output(UInt(64.W))
        val IF_pc = Output(UInt(64.W))
        val ID_pc = Output(UInt(64.W))
        val EX_pc = Output(UInt(64.W))
        val WB_pc = Output(UInt(64.W))
        val WB_Inst = Output(UInt(32.W))
        val WB_RegWriteData = Output(UInt(64.W))
        val WB_RegWriteID = Output(UInt(64.W))
        val WB_valid = Output(Bool())
        // val MEM_pc = Output(UInt(64.W))
        val MEM_RegWriteData = Output(UInt(64.W))
        val stall   = Output(Bool())

        val IF_Inst = Output(UInt(32.W))
        val IF_valid = Output(Bool())

        val ID_ALU_Data1 = Output(UInt(64.W))
        val ID_ALU_Data2 = Output(UInt(64.W))
        val ID_Rs1Data = Output(UInt(64.W))
        val ID_Rs2Data = Output(UInt(64.W))
        val ALUResult = Output(UInt(64.W))
    })

    val inst_fetch_unit = Module(new IFU)
    val inst_decode_unit = Module(new IDU)
    val excute_unit = Module(new EXU)
    val mem_unit = Module(new MEMU)
    val wb_unit = Module(new WBU)

    io.IF_Inst  := inst_fetch_unit.io.IF_to_ID_bus.bits.Inst
    io.IF_valid := inst_fetch_unit.io.IF_to_ID_bus.valid
    
    io.ID_npc   := inst_decode_unit.io.ID_npc
    io.PF_npc   := inst_fetch_unit.io.PF_npc
    io.PF_pc := inst_fetch_unit.io.PF_pc
    io.IF_pc := inst_fetch_unit.io.IF_to_ID_bus.bits.PC
    io.ID_pc := inst_decode_unit.io.ID_to_EX_bus.bits.PC
    io.EX_pc := mem_unit.io.EX_to_MEM_bus.bits.PC
    io.WB_pc := wb_unit.io.WB_pc
    io.WB_Inst := wb_unit.io.WB_Inst
    io.WB_RegWriteData := wb_unit.io.WB_RegWriteData
    io.WB_RegWriteID   := wb_unit.io.WB_RegWriteID
    io.WB_valid     := wb_unit.io.WB_valid
    io.MEM_RegWriteData := mem_unit.io.MEM_regWriteData_Pass
    
    io.ID_ALU_Data1 := inst_decode_unit.io.ID_to_EX_bus.bits.ALU_Data1
    io.ID_ALU_Data2 := inst_decode_unit.io.ID_to_EX_bus.bits.ALU_Data2
    io.ID_Rs1Data := inst_decode_unit.io.ID_to_EX_bus.bits.rs1_data
    io.ID_Rs2Data := inst_decode_unit.io.ID_to_EX_bus.bits.rs2_data
    io.ALUResult  := excute_unit.io.EX_to_MEM_bus.bits.ALU_result
    io.stall := inst_decode_unit.io.ID_stall
    
    val simulate = Module(new sim)
    
    simulate.io.IF_pc                       := inst_fetch_unit.io.IF_to_ID_bus.bits.PC
    simulate.io.GPR                         := inst_decode_unit.io.ID_GPR
    simulate.io.WB_Inst                     := wb_unit.io.WB_Inst
    simulate.io.unknown_inst_flag           := inst_decode_unit.io.ID_unknown_inst
    
    inst_fetch_unit.io.ID_npc               := inst_decode_unit.io.ID_npc
    
    inst_decode_unit.io.IF_to_ID_bus        <> inst_fetch_unit.io.IF_to_ID_bus
    inst_decode_unit.io.WB_RegWriteData     := wb_unit.io.WB_RegWriteData
    inst_decode_unit.io.WB_RegWriteEn       := wb_unit.io.WB_RegWriteEn
    inst_decode_unit.io.WB_RegWriteID       := wb_unit.io.WB_RegWriteID
    inst_decode_unit.io.MEM_RegWriteData    := mem_unit.io.MEM_regWriteData_Pass
    inst_decode_unit.io.MEM_RegWriteEn      := excute_unit.io.EX_to_MEM_bus.bits.regWriteEn
    inst_decode_unit.io.MEM_RegWriteID      := excute_unit.io.EX_to_MEM_bus.bits.regWriteID
    inst_decode_unit.io.EX_ALUResult        := excute_unit.io.EX_ALUResult_Pass

    excute_unit.io.ID_to_EX_bus             <> inst_decode_unit.io.ID_to_EX_bus
    excute_unit.io.flush                    := inst_decode_unit.io.ID_stall
    excute_unit.io.MEM_RegWriteData         := mem_unit.io.MEM_regWriteData_Pass
    excute_unit.io.WB_RegWriteEn            := wb_unit.io.WB_RegWriteEn
    excute_unit.io.WB_RegWriteID            := wb_unit.io.WB_RegWriteID
    excute_unit.io.WB_RegWriteData          := wb_unit.io.WB_RegWriteData

    mem_unit.io.EX_to_MEM_bus               <> excute_unit.io.EX_to_MEM_bus

    wb_unit.io.MEM_to_WB_bus                <> mem_unit.io.MEM_to_WB_bus

}
