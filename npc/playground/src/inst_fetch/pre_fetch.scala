import chisel3._
import chisel3.util._
import AXILiteDefs._
import utils._


class IF_pre_fetch extends Module{
    val io = IO(new Bundle{
        val IF_pc        = Input(UInt(64.W))
        val ID_npc       = Input(UInt(64.W))
        val inst_valid   = Output(Bool())
        val PF_pc        = Output(UInt(64.W))
        val stall        = Input(Bool())
        val bp_fail      = Output(Bool())

        val PF_npc       = Output(UInt(64.W))
    })
    val axi_lite = IO(Decoupled(new AXILiteMasterIF(32, 64)))
    val PF_npc   = RegInit(0x80000000L.U(64.W))
    
    io.PF_npc    := PF_npc
    PF_npc      := MuxCase(io.PF_npc+4.U, Seq(
        (io.stall | !axi_lite.ready, io.PF_npc),
        (io.bp_fail                , io.ID_npc)
    ))

    io.bp_fail := io.ID_npc =/= io.PF_pc && io.PF_pc =/= 0.U && io.IF_pc =/= 0.U && !io.stall
    val bp_fail_r = RegInit(0.U(1.W))
    bp_fail_r := io.bp_fail
    regConnectWithResetAndStall(io.PF_pc, PF_npc, reset.asBool | io.bp_fail, 0.U(64.W), io.stall | !axi_lite.ready)

    //IFU doesn't write mem
    axi_lite.bits.writeAddr.valid        := 0.U
    axi_lite.bits.writeAddr.bits.addr    := 0.U
    axi_lite.bits.writeData.valid        := 0.U
    axi_lite.bits.writeData.bits.data    := 0.U
    axi_lite.bits.writeData.bits.strb    := 0.U
    axi_lite.bits.writeResp.ready        := 0.U
    
    //Fetch inst from sram
    axi_lite.bits.readAddr.valid         := !io.stall
    axi_lite.bits.readAddr.bits.addr     := PF_npc(31, 0)
    axi_lite.bits.readData.ready         := !io.stall

    axi_lite.valid                       := !io.stall

    io.inst_valid                   := (axi_lite.readData.valid && axi_lite.readData.bits.resp === 0.U) & !io.bp_fail & !bp_fail_r & axi_lite.ready
}