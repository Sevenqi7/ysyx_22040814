import chisel3._
import chisel3.util._
import utils._

class IFU extends Module{
    val io = IO(new Bundle{
        val ID_npc = Input(UInt(64.W))
        val IF_pc = Output(UInt(64.W))
    })
    val pcReg = RegInit(0x80000000L.U(64.W))
    pcReg := io.ID_npc
    io.IF_pc := pcReg
}