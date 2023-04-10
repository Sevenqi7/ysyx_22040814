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
        val inst = Output(UInt(64.W))
    })
    addPath("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/npc/playground/verilog/sim.v")
}

class top extends Module{
    val io = IO(new Bundle{
        val WB_pc = Output(UInt(64.W))
        val WB_Inst = Output(UInt(32.W))
        val MEM_pc = Output(UInt(64.W))
        val ALUResult = Output(UInt(64.W))
        val stall   = Output(Bool())
    })

    val inst_fetch_unit = Module(new IFU)
    val inst_decode_unit = Module(new IDU)
    val excute_unit = Module(new EXU)
    val mem_unit = Module(new MEMU)
    val wb_unit = Module(new WBU)

    io.WB_pc := wb_unit.io.WB_pc
    io.MEM_pc := mem_unit.io.MEM_pc
    io.WB_Inst := wb_unit.io.WB_Inst
    io.stall := inst_decode_unit.io.ID_stall
    
    val simulate = Module(new sim)
    
    simulate.io.IF_pc                       := inst_fetch_unit.io.IF_pc
    simulate.io.GPR                         := inst_decode_unit.io.ID_GPR
    simulate.io.unknown_inst_flag           := inst_decode_unit.io.ID_unknown_inst
    
    inst_fetch_unit.io.ID_npc               := inst_decode_unit.io.ID_npc
    inst_fetch_unit.io.ID_stall            := inst_decode_unit.io.ID_stall
    
    inst_decode_unit.io.IF_pc               := inst_fetch_unit.io.IF_pc
    inst_decode_unit.io.IF_Inst             := simulate.io.inst(31, 0)
    inst_decode_unit.io.WB_RegWriteData     := wb_unit.io.WB_RegWriteData
    inst_decode_unit.io.WB_RegWriteEn       := wb_unit.io.WB_RegWriteEn
    inst_decode_unit.io.WB_RegWriteID       := wb_unit.io.WB_RegWriteID
    inst_decode_unit.io.MEM_RegWriteData    := excute_unit.io.EX_ALUResult
    inst_decode_unit.io.MEM_RegWriteEn      := excute_unit.io.EX_RegWriteEn
    inst_decode_unit.io.MEM_RegWriteID      := excute_unit.io.EX_RegWriteID
    inst_decode_unit.io.EX_ALUResult        := excute_unit.io.EX_ALUResult_Pass
    inst_decode_unit.io.MEM_MemReadData     := mem_unit.io.MEM_MemReadData_Pass

    excute_unit.io.ID_pc                    := inst_decode_unit.io.ID_pc
    excute_unit.io.ID_Inst                  := inst_decode_unit.io.ID_Inst
    excute_unit.io.ID_RegWriteEn            := inst_decode_unit.io.ID_RegWriteEn
    excute_unit.io.ID_RegWriteID            := inst_decode_unit.io.ID_RegWriteID
    excute_unit.io.ID_ALU_Data1             := inst_decode_unit.io.ID_ALU_Data1
    excute_unit.io.ID_ALU_Data2             := inst_decode_unit.io.ID_ALU_Data2
    excute_unit.io.ID_optype                := inst_decode_unit.io.ID_optype
    excute_unit.io.ID_MemWriteEn            := inst_decode_unit.io.ID_MemWriteEn
    excute_unit.io.ID_MemReadEn             := inst_decode_unit.io.ID_MemReadEn
    excute_unit.io.ID_FuType                := inst_decode_unit.io.ID_FuType
    excute_unit.io.ID_Rs1Data               := inst_decode_unit.io.ID_Rs1Data
    excute_unit.io.ID_Rs2Data               := inst_decode_unit.io.ID_Rs2Data
    excute_unit.io.flush                    := inst_decode_unit.io.ID_stall

    mem_unit.io.EX_pc                       := excute_unit.io.EX_pc
    mem_unit.io.EX_Inst                     := excute_unit.io.EX_Inst  
    mem_unit.io.EX_ALUResult                := excute_unit.io.EX_ALUResult
    mem_unit.io.EX_MemWriteData             := excute_unit.io.EX_MemWriteData
    mem_unit.io.EX_MemWriteEn               := excute_unit.io.EX_MemWriteEn
    mem_unit.io.EX_MemReadEn                := excute_unit.io.EX_MemReadEn
    mem_unit.io.EX_LsuType                  := excute_unit.io.EX_LsuType
    mem_unit.io.EX_RegWriteEn               := excute_unit.io.EX_RegWriteEn
    mem_unit.io.EX_RegWriteID               := excute_unit.io.EX_RegWriteID
    io.ALUResult                            := mem_unit.io.MEM_RegWriteData

    wb_unit.io.MEM_pc                       := mem_unit.io.MEM_pc
    wb_unit.io.MEM_Inst                     := mem_unit.io.MEM_Inst
    wb_unit.io.MEM_RegWriteData             := mem_unit.io.MEM_RegWriteData
    wb_unit.io.MEM_RegWriteEn               := mem_unit.io.MEM_RegWriteEn
    wb_unit.io.MEM_RegWriteID               := mem_unit.io.MEM_RegWriteID
}
