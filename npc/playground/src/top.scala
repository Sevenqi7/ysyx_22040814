import chisel3._
import chisel3.util._
import chisel3.experimental._

class sim extends BlackBox with HasBlackBoxPath{
    val io = IO(new Bundle{
        val inst = Input(UInt(32.W))
    })
    addPath("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/npc/playground/verilog/sim.v")
}

class top extends Module{
    val io = IO(new Bundle{
        val inst = Input(UInt(32.W))
        val IF_pc = Output(UInt(64.W))
        val ALUResult = Output(UInt(64.W))
    })

    val simulate = Module(new sim(io.inst))

    val inst_fetch_unit = Module(new IFU)
    val inst_decode_unit = Module(new IDU)
    val excute_unit = Module(new EXU)

    io.IF_pc := inst_fetch_unit.io.IF_pc
    inst_fetch_unit.io.IF_npc := inst_decode_unit.io.ID_npc
    inst_decode_unit.io.IF_pc  := inst_fetch_unit.io.IF_pc
    inst_decode_unit.io.IF_Inst := io.inst

    // val ID_ALU_Data1 := inst_decode_unit.io.ID_ALU_Data1
    // val ID_ALU_Data2 := inst_decode_unit.io.ID_ALU_Data2
    // val ID_optype := inst_decode_unit.io.ID_optype
    // val ID_RegWritEn := inst_decode_unit.io.ID_RegWriteEn
    // val ID_RegWriteID := inst_decode_unit.io.ID_RegWriteID

    excute_unit.io.ID_RegWriteEn := inst_decode_unit.io.ID_RegWriteEn
    excute_unit.io.ID_RegWriteID := inst_decode_unit.io.ID_RegWriteID
    excute_unit.io.ID_ALU_Data1  := inst_decode_unit.io.ID_ALU_Data1
    excute_unit.io.ID_ALU_Data2  := inst_decode_unit.io.ID_ALU_Data2
    excute_unit.io.ID_optype     := inst_decode_unit.io.ID_optype
    inst_decode_unit.io.EX_RegWriteData := excute_unit.io.EX_RegWriteData
    inst_decode_unit.io.EX_RegWriteEn   := excute_unit.io.EX_RegWriteEn
    inst_decode_unit.io.EX_RegWriteID   := excute_unit.io.EX_RegWriteID
    io.ALUResult := excute_unit.io.EX_RegWriteData
    
}
