import chisel3._
import chisel3.util._
import AXILiteDefs._
import utils._


class IF_pre_fetch extends Module{
    val io = IO(new Bundle{
        val IF_pc        = Input(UInt(64.W))
        val ID_npc       = Input(UInt(64.W))
        val inst         = Output(UInt(32.W))
        val inst_valid   = Output(Bool())
        val PF_pc        = Output(UInt(64.W))
        val stall        = Input(Bool())
        val bp_fail      = Output(Bool())
    })
    val axi_lite = IO(new AXILiteMasterIF(32, 64))
    val PF_npc   = RegInit(0x80000000L.U(64.W))

    PF_npc      := Mux(!io.bp_fail, PF_npc+4.U, io.ID_npc)
    io.bp_fail := io.ID_npc =/= (io.PF_pc+4.U) && io.PF_pc =/= 0.U

    regConnectWithResetAndStall(io.PF_pc, Mux(!io.bp_fail, PF_npc, io.ID_npc), reset | io.bp_fail, 0.U(64.W), io.stall)

    //IFU doesn't write mem
    axi_lite.writeAddr.valid        := 0.U
    axi_lite.writeAddr.bits.addr    := 0.U
    axi_lite.writeData.valid        := 0.U
    axi_lite.writeData.bits.data    := 0.U
    axi_lite.writeData.bits.strb    := 0.U
    axi_lite.writeResp.ready        := 0.U

    //Fetch inst from sram
    axi_lite.readAddr.valid         := !io.stall && !reset.asBool
    axi_lite.readAddr.bits.addr     := PF_npc(31, 0)
    axi_lite.readData.ready         := 1.U

    io.inst                         := axi_lite.readData.bits.data
    io.inst_valid                   := (axi_lite.readData.valid && axi_lite.readData.bits.resp === 0.U)
}