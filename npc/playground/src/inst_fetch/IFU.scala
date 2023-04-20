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
        val ID_npc = Input(UInt(64.W))
        val IF_to_ID_bus = Decoupled(new IF_to_ID_Message)
        //for npc to trap
        val PF_npc  = Output(UInt(64.W))
        val PF_pc   = Output(UInt(64.W))

        val axidata = Output(UInt(64.W))
        val axi_IF  = Decoupled(new AXILiteMasterIF(64, 32))
    })

    val pre_fetch = Module(new IF_pre_fetch)
    val bp_fail = Wire(Bool())
    val flush   = Wire(Bool())

    io.axi_IF                               <> pre_fetch.axi_lite

    io.PF_npc                               := pre_fetch.io.PF_npc
    io.PF_pc                                := pre_fetch.io.PF_pc
    io.axidata                              := pre_fetch.axi_lite.bits.readData.bits.data

    bp_fail                                 := pre_fetch.io.bp_fail
    pre_fetch.io.IF_pc                      := io.IF_to_ID_bus.bits.PC
    pre_fetch.io.ID_npc                     := io.ID_npc
    pre_fetch.io.stall                      := !io.IF_to_ID_bus.ready

    flush                                   := reset.asBool | !pre_fetch.io.inst_valid | bp_fail
    
    val inst = pre_fetch.axi_lite.bits.readData.bits.data

    //pipeline
    regConnectWithResetAndStall(io.IF_to_ID_bus.bits.PC  , pre_fetch.io.PF_pc     , flush, 0.U, !io.IF_to_ID_bus.ready)
    regConnectWithResetAndStall(io.IF_to_ID_bus.valid    , pre_fetch.io.inst_valid, flush, 0.U, !io.IF_to_ID_bus.ready)
    regConnectWithResetAndStall(io.IF_to_ID_bus.bits.Inst, inst                   , flush, 0.U, !io.IF_to_ID_bus.ready)

}

