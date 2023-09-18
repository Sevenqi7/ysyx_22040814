import chisel3._
import chisel3.util._
import AXIDefs._

class PF_ICache_Message extends ThaliaBundle {
  val valid    = Output(Bool())
  val op       = Output(Bool())
  val uncached = Output(Bool())
  val PCBase   = Output(UInt(32.W))
  val addr_ok  = Input(Bool())
}

class PF_IF_Message extends Bundle {
  val PCBase = Output(UInt(64.W))
}

class PFU extends ThaliaModule {
  val io = IO (new Bundle{
    val PF_ICache_Bus = Decoupled(new PF_ICache_Message())
    val PF_IF_Bus     = Decoupled(new PF_IF_Message())
  })

  val PF_pc  = RegInit(0x80000000L.U(64.W))
  val PF_npc = RegInit(0x80000004L.U(64.W))

  io.PF_IF_Bus.bits.PCBase := PF_pc
  io.PF_IF_Bus.valid       := io.PF_ICache_Bus.bits.addr_ok
  when(io.PF_ICache_Bus.bits.addr_ok) {
    PF_pc  := PF_npc
    PF_npc := PF_npc + (FetchNr * 4).U
  }

  io.PF_ICache_Bus.bits.PCBase := PF_pc
  io.PF_ICache_Bus.valid       := 1.B
  io.PF_ICache_Bus.bits.op          := 0.B
  io.PF_ICache_Bus.bits.uncached    := 1.B

}
