import chisel3._
import chisel3.util._

class WBU extends Module{
    val io = IO(new Bundle{
        val MEM_to_WB_bus    = Flipped(Decoupled(new MEM_to_WB_Message))

        val WB_RegWriteData  = Output(UInt(64.W))
        val WB_RegWriteEn    = Output(Bool())
        val WB_RegWriteID    = Output(UInt(5.W))

        //for NPC to trace
        val WB_valid         = Output(Bool())
        val WB_pc            = Output(UInt(64.W))
        val WB_Inst          = Output(UInt(32.W))
    })

    //the actual reg writing operation is in IDU
    //so here directly connect WB_* with MEM_*
    io.WB_valid        := io.MEM_to_WB_bus.valid

    io.WB_pc           := io.MEM_to_WB_bus.bits.PC
    io.WB_Inst         := io.MEM_to_WB_bus.bits.Inst
    io.WB_RegWriteData := io.MEM_to_WB_bus.bits.regWriteData
    io.WB_RegWriteEn   := io.MEM_to_WB_bus.bits.regWriteEn
    io.WB_RegWriteID   := io.MEM_to_WB_bus.bits.regWriteID

    io.MEM_to_WB_bus.ready := 1.U
}