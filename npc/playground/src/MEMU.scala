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
        val EX_ALUResult = Input(UInt(64.W))
        val EX_MemWriteData = Input(UInt(64.W))
        val EX_MemWriteEn = Input(UInt(1.W))
        val EX_MemReadEn = Input(UInt(1.W))
        val EX_LsuType      = Input(UInt(5.W))
        val EX_RegWriteEn   = Input(UInt(1.W))
        val EX_RegWriteID   = Input(UInt(5.W))
        
        val MEM_RegWriteData = Output(UInt(64.W))
        val MEM_RegWriteEn  = Output(UInt(1.W))
        val MEM_RegWriteID  = Output(UInt(5.W))

        //for IDU.Bypass
        val MEM_MemReadData_Pass = Output(UInt(64.W))

        //for NPC to trace
        val EX_pc           = Input(UInt(64.W))
        val EX_Inst         = Input(UInt(32.W))
        val MEM_pc          = Output(UInt(64.W))
        val MEM_Inst        = Output(UInt(32.W))
    })

    val RegWriteData = Wire(UInt(64.W))
    
    regConnect(io.MEM_pc                ,                 io.EX_pc)
    regConnect(io.MEM_Inst              ,               io.EX_Inst)
    regConnect(io.MEM_RegWriteEn        ,         io.EX_RegWriteEn)
    regConnect(io.MEM_RegWriteID        ,         io.EX_RegWriteID)
    regConnect(io.MEM_RegWriteData      ,             RegWriteData)
    
    io.MEM_MemReadData_Pass := RegWriteData

    //LSU for DPI-C with verilator
    val mem = Module(new LSU)
    mem.io.pc   := io.MEM_pc
    mem.io.addr := io.EX_ALUResult
    mem.io.LsuType := io.EX_LsuType
    mem.io.WriteEn := io.EX_MemWriteEn
    mem.io.WriteData := io.EX_MemWriteData
    mem.io.ReadEn  := io.EX_MemReadEn
    RegWriteData := Mux(io.EX_MemReadEn.asBool, mem.io.ReadData, io.EX_ALUResult)
}  
