import chisel3._
import chisel3.util._

class WB_to_ID_Message
{
    val regWriteData  = UInt(64.W)
    val regWriteEn    = Bool()
    val regWriteID    = UInt(5.W)
}

class WBU extends Module{
    val io = IO(new Bundle{
        val MEM_to_WB_bus    = Flipped(Decoupled(new MEM_to_WB_Message))
        val WB_to_ID_forward = Decoupled(new WB_to_ID_Message)

        //for NPC to trace
        val WB_pc            = Output(UInt(64.W))
        val WB_Inst          = Output(UInt(32.W))
    })

    //the actual reg writing operation is in IDU
    //so here directly connect WB_* with MEM_*
    // io.WB_valid        := io.MEM_to_WB_bus.valid
    // io.WB_RegWriteData := io.MEM_to_WB_bus.bits.regWriteData
    // io.WB_RegWriteEn   := io.MEM_to_WB_bus.bits.regWriteEn
    // io.WB_RegWriteID   := io.MEM_to_WB_bus.bits.regWriteID
    io.WB_to_ID_forward.bits.regWriteData := io.MEM_to_WB_bus.bits.regWriteData    
    io.WB_to_ID_forward.bits.regWriteEn   := io.MEM_to_WB_bus.bits.regWriteEn
    io.WB_to_ID_forward.bits.regWrite     := io.MEM_to_WB_bus.bits.regWriteID
    io.WB_to_ID_forward.valid             := io.MEM_to_WB_bus.valid

    io.WB_pc           := io.MEM_to_WB_bus.bits.PC
    io.WB_Inst         := io.MEM_to_WB_bus.bits.Inst

    io.MEM_to_WB_bus.ready := 1.U
}