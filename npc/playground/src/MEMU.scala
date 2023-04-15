import chisel3._
import chisel3.util._
import utils._
import OpType._
import InstType._
import java.util.Base64.Decoder

class LSU extends BlackBox with HasBlackBoxPath{
    val io = IO(new Bundle{
        val pc   = Input(UInt(64.W))
        val addr = Input(UInt(64.W))
        val LsuType = Input(UInt(5.W))
        val WriteEn = Input(UInt(1.W))
        val ReadEn  = Input(UInt(1.W))
        val WriteData = Input(UInt(64.W))
        val ReadData = Output(UInt(64.W))
    })
    addPath("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/npc/playground/verilog/LSU.v")
}

class MEM_to_WB_Message extends Bundle{

    val regWriteData = Output(UInt(64.W))
    val regWriteEn   = Output(UInt(1.W))
    val regWriteID   = Output(UInt(5.W))

    //for NPC to trace
    val PC           = Output(UInt(64.W))
    val Inst         = Output(UInt(32.W))
}


class MEMU extends Module{
    val io = IO(new Bundle{
        val EX_to_MEM_bus = Flipped(Decoupled(new EX_MEM_Message))
        val MEM_to_WB_bus = Decoupled(new MEM_to_WB_Message)
        //for IDU.Bypass
        val MEM_regWriteData_Pass = Output(UInt(64.W))
    })

    //unpack bus from EXU
    val ALU_result   =  io.EX_to_MEM_bus.bits.ALU_result  
    val memWriteData =  io.EX_to_MEM_bus.bits.memWriteData
    val memWriteEn   =  io.EX_to_MEM_bus.bits.memWriteEn
    val memReadEn    =  io.EX_to_MEM_bus.bits.memReadEn
    val lsutype      =  io.EX_to_MEM_bus.bits.lsutype
    val regWriteID   =  io.EX_to_MEM_bus.bits.regWriteID
    val regWriteEn   =  io.EX_to_MEM_bus.bits.regWriteEn

    val mem = Module(new LSU)
    val regWriteData = Wire(UInt(64.W))

    io.MEM_regWriteData_Pass := regWriteData
    regWriteData := Mux(memReadEn.asBool, mem.io.ReadData, ALU_result)
    
    regConnect(io.MEM_to_WB_bus.bits.PC                ,         io.EX_to_MEM_bus.bits.PC  )
    regConnect(io.MEM_to_WB_bus.bits.Inst              ,         io.EX_to_MEM_bus.bits.Inst)
    regConnect(io.MEM_to_WB_bus.bits.regWriteEn        ,                         regWriteEn)
    regConnect(io.MEM_to_WB_bus.bits.regWriteID        ,                         regWriteID)
    regConnect(io.MEM_to_WB_bus.bits.regWriteData      ,                       regWriteData)
    regConnect(io.MEM_to_WB_bus.valid                  ,             io.EX_to_MEM_bus.valid)
    io.EX_to_MEM_bus.ready := 1.U    

    //LSU for DPI-C with verilator
    mem.io.pc   := io.MEM_to_WB_bus.bits.PC
    mem.io.addr := ALU_result
    mem.io.LsuType := lsutype
    mem.io.WriteEn := memWriteEn
    mem.io.WriteData := memWriteData
    mem.io.ReadEn  := memReadEn
}  
