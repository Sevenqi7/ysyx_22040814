import chisel3._
import chisel3.util._

class IFU extends Module{
    val io = IO(new Bundle{
        val IF_npc = Input(UInt(32.W))
        val IF_pc = Output(UInt(64.W))
    })
    val pcReg = RegInit(0x80000000.U(64.W))
    pcReg := RegNext(io.IF_npc)
    io.IF_pc := pcReg
}