import chisel3._
import chisel3.util._

class ICache_IF_Message extends Bundle {
  val data_ok = Input(Bool())
  val Inst    = Input(Vec(FetchNr, UInt(32.W)))
}

class IF_ID_Message extends Bundle {
  val PCBase = UInt(64.W)
  val Inst   = Vec(FetchNr, UInt(32.W))
}

class IFU extends Module {
  val io = IO {
    val ICache_IF_Bus = new ICache_IF_Message()
    val PF_IF_Bus     = Flipped(Decoupled(new PF_IF_Message()))
    val IF_ID_Bus     = Decoupled(new IF_ID_Message())
  }

  val IF_pc = RegInit(0.U(64.W))

  IF_pc                  := io.PF_IF_Bus.PCBase
  io.IF_ID_Bus.valid     := io.ICache_IF_Bus.bits.data_ok
  io.IF_ID_Bus.bits.Inst := io.ICache_IF_Bus.Inst
  io.PF_IF_Bus.ready     := 1.U
}
