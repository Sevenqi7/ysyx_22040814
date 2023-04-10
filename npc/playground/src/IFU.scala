import chisel3._
import chisel3.util._
import utils._

class IFU extends Module{
    val io = IO(new Bundle{
        val ID_npc = Input(UInt(64.W))
        val ID_stall = Input(Bool())
        val IF_pc = Output(UInt(64.W))
    })
    
    regConnectWithResetAndStall(io.IF_pc, io.ID_npc, reset, 0x80000000L.U(64.W), io.ID_stall)
    // val pcReg = RegInit(0x80000000L.U(64.W))
    // pcReg := io.ID_npc
    // io.IF_pc := pcReg
}