import chisel3._
import chisel3.util._
import utils._
import OpType._
import InstType._

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

class MEMU extends Module{
    val io = IO(new Bundle{
        val EX_to_MEM_bus = Flipped(Decoupled(new EX_MEM_Message))
        
        val MEM_RegWriteData = Output(UInt(64.W))
        val MEM_RegWriteEn  = Output(UInt(1.W))
        val MEM_RegWriteID  = Output(UInt(5.W))

        //for IDU.Bypass
        val MEM_RegWriteData_Pass = Output(UInt(64.W))

        //for NPC to trace
        val MEM_pc          = Output(UInt(64.W))
        val MEM_Inst        = Output(UInt(32.W))
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
    val RegWriteData = Wire(UInt(64.W))

    io.MEM_RegWriteData_Pass := RegWriteData
    RegWriteData := Mux(memReadEn.asBool, mem.io.ReadData, ALU_result)
    
    regConnect(io.MEM_pc                ,         io.EX_to_MEM_bus.bits.PC  )
    regConnect(io.MEM_Inst              ,         io.EX_to_MEM_bus.bits.Inst)
    regConnect(io.MEM_RegWriteEn        ,                         regWriteEn)
    regConnect(io.MEM_RegWriteID        ,                         regWriteID)
    regConnect(io.MEM_RegWriteData      ,                       RegWriteData)
    

    //LSU for DPI-C with verilator
    mem.io.pc   := io.MEM_pc
    mem.io.addr := ALU_result
    mem.io.LsuType := lsuType
    mem.io.WriteEn := memWriteEn
    mem.io.WriteData := memWriteData
    mem.io.ReadEn  := memReadEn
}  
