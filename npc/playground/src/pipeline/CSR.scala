import chisel3._
import chisel3.util._

class M_CSR extends Module{
    val io = IO(new Bundle{
        val writeEn = Input(Bool())
        val writeID = Input(UInt(12.W))
        val writeData = Input(UInt())
        val readEn  = Output(Bool())

    })

    val mstatus = RegInit(0.U(64.W))
    val mtvec   = RegInit(0.U(64.W))
    val mepc    = RegInit(0.U(64.W))
    val mcause  = RegInit(0.U(64.W))

}