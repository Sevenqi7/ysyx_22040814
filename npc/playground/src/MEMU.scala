import chisel3._
import chisel3.util._
import OpType._
import InstType._

class LSU extends BlackBox with HasBlackBoxPath{
    val io = IO(new Bundle{
        val addr = Input(UInt(64.W))
        val LsuType = Input(UInt(3.W))
        val WriteEn = Input(UInt(1.W))
        val WriteData = Input(UInt(64.W))
        val ReadData = Output(UInt(64.W))
    })
    addPath("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/npc/playground/verilog/lsu.v")
}

class MEMU extends Module{
    val io = IO(new Bundle{
        val EX_ALUResult = Input(UInt(64.W))
        val EX_MemWriteData = Input(UInt(64.W))
        val EX_MemWriteEn = Input(UInt(1.W))
        val EX_LsuType      = Input(UInt(3.W))
        val EX_RegWriteEn   = Input(UInt(1.W))
        val EX_RegWriteID   = Input(UInt(5.W))
        
        val MEM_RegWriteData = Output(UInt(64.W))
        val MEM_RegWriteEn  = Output(UInt(1.W))
        val MEM_RegWriteID  = Output(UInt(5.W))
    })

    io.MEM_RegWriteEn := io.EX_RegWriteEn
    io.MEM_RegWriteID := io.EX_RegWriteID
    
    val mem = Module(new LSU)
    mem.io.addr := io.EX_ALUResult
    mem.io.LsuType := io.EX_LsuType
    mem.io.WriteEn := io.EX_MemWriteEn
    mem.io.WriteData := io.EX_MemWriteData
    io.MEM_RegWriteData := Mux((io.EX_LsuType =/= 0.U) && (io.EX_MemWriteEn === 0.U), mem.io.ReadData, io.EX_ALUResult)

}  

