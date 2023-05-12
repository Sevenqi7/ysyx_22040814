import chisel3._
import chisel3.util._
import AXILiteDefs._
import utils._


class IF_to_ID_Message extends Bundle{
    val PC = UInt(64.W)
    val Inst = UInt(32.W)
}

class IFU extends Module{
    val io = IO(new Bundle{
        val IF_to_ID_bus = Decoupled(new IF_to_ID_Message)
        val bp_stall = Input(Bool())
        val bp_flush = Input(Bool())
        val bp_taken = Input(Bool())
        val bp_npc   = Input(UInt(64.W))
        //for npc to trap
        val PF_npc  = Output(UInt(64.W))
        val PF_pc   = Output(UInt(64.W))
        val PF_valid = Output(Bool())

        val axidata = Output(UInt(64.W))
    })
    val axi      = IO(new AXIMasterIF(32, 64, 4))
    val axi_req  = IO(new MyReadyValidIO)

    val pre_fetch = Module(new IF_pre_fetch)
    val flush   = Wire(Bool())

    axi                                     <> pre_fetch.axi
    axi_req                                 <> pre_fetch.axi_req

    io.PF_npc                               := pre_fetch.io.PF_npc
    io.PF_pc                                := pre_fetch.io.PF_pc
    io.PF_valid                             := pre_fetch.io.inst_valid
    io.axidata                              := pre_fetch.axi.readData.bits.data

    pre_fetch.io.IF_pc                      := io.IF_to_ID_bus.bits.PC
    pre_fetch.io.IF_valid                   := io.IF_to_ID_bus.valid
    pre_fetch.io.bp_flush                   := io.bp_flush
    pre_fetch.io.bp_npc                     := io.bp_npc
    pre_fetch.io.bp_taken                   := io.bp_taken
    pre_fetch.io.stall                      := !io.IF_to_ID_bus.ready | io.bp_stall

    flush                                   := reset.asBool | io.bp_flush
    //pipeline
    regConnectWithResetAndStall(io.IF_to_ID_bus.bits.PC, pre_fetch.io.PF_pc   , flush, 0.U, !io.IF_to_ID_bus.ready)
    regConnectWithResetAndStall(io.IF_to_ID_bus.valid, pre_fetch.io.inst_valid, flush, 0.U, !io.IF_to_ID_bus.ready)
    regConnectWithResetAndStall(io.IF_to_ID_bus.bits.Inst, pre_fetch.axi.readData.bits.data  , flush, 0.U, !io.IF_to_ID_bus.ready)
    // regConnectWithResetAndStall(io.IF_to_ID_bus.bits.Inst, pre_fetch.io.inst  , flush, 0.U, !io.IF_to_ID_bus.ready)

}

