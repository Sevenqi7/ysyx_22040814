import chisel3._
import chisel3.util._

class WBU extends Module{
    val io = IO(new Bundle{
        val MEM_RegWriteData = Input(UInt(64.W))
        val MEM_RegWriteEn   = Input(UInt(1.W))
        val MEM_RegWriteID   = Input(UInt(5.W))

        val WB_RegWriteData  = Output(UInt(64.W))
        val WB_RegWriteEn    = Output(UInt(1.W))
        val WB_RegWriteID    = Output(UInt(5.W))

        //for NPC to trace
        val WB_pc            = Output(UInt(64.W))
        val WB_Inst          = Output(UInt(32.W))
        val MEM_pc           = Input(UInt(64.W))
        val MEM_Inst         = Input(UInt(32.W))
    })

    //the actual reg writing operation is in IDU
    //so here directly connect WB_* with MEM_*
    io.WB_pc           := io.MEM_pc
    io.WB_Inst         := io.MEM_Inst
    io.WB_RegWriteData := io.MEM_RegWriteData
    io.WB_RegWriteEn   := io.MEM_RegWriteEn
    io.WB_RegWriteID   := io.MEM_RegWriteID
}