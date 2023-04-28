import chisel3._
import chisel3.util._
import AXILiteDefs._
import utils._


class IF_pre_fetch extends Module{
    val io = IO(new Bundle{
        val IF_pc        = Input(UInt(64.W))
        val IF_valid     = Input(Bool())
        val inst         = Output(UInt(32.W))
        val inst_valid   = Output(Bool())
        val PF_pc        = Output(UInt(64.W))
        val stall        = Input(Bool())
        val bp_npc       = Input(UInt(64.W))
        val bp_taken     = Input(Bool())
        val bp_flush     = Input(Bool())

        val PF_npc       = Output(UInt(64.W))
    })
    val axi_lite = IO(new AXILiteMasterIF(32, 64))
    val axi_req  = IO(new MyReadyValidIO)

    val PF_npc   = RegInit(0x80000000L.U(64.W))
    io.PF_npc    := PF_npc
    val axi_busy = RegInit(0.U(1.W))
    axi_busy := !axi_req.ready
    axi_req.valid   := 1.U

    PF_npc := MuxCase(io.PF_npc + 4.U, Seq(
        (io.bp_flush, io.bp_npc + 4.U),
        ((io.stall | !axi_req.ready | axi_busy.asBool), io.PF_npc),
        (io.bp_taken, io.bp_npc + 4.U)
    ))


    val npc = Wire(UInt(64.W))
    npc := MuxCase(PF_npc, Seq(
        (io.bp_flush, io.bp_npc),
        (io.stall    | !axi_req.ready | axi_busy.asBool, io.PF_pc),
        (io.bp_taken  , io.bp_npc)
    ))
    
    regConnect(io.PF_pc, npc)

    
    //IFU doesn't write mem
    axi_lite.writeAddr.valid        := 0.U
    axi_lite.writeAddr.bits.addr    := 0.U 
    axi_lite.writeData.valid        := 0.U
    axi_lite.writeData.bits.data    := 0.U
    axi_lite.writeData.bits.strb    := 0.U
    axi_lite.writeResp.ready        := 0.U

    //Fetch inst from sram
    axi_lite.readAddr.valid         := !io.stall
    axi_lite.readAddr.bits.addr     := Mux(io.bp_taken | io.bp_flush, io.bp_npc, PF_npc(31, 0))
    axi_lite.readAddr.bits.addr     := MuxCase(PF_npc(31, 0), Seq(
                                            (io.bp_flush, io.bp_npc),
                                            (io.stall | !axi_req.ready | axi_busy.asBool, io.PF_pc ),
                                            (io.bp_taken, io.bp_npc)
                                        ))
    
    axi_lite.readData.ready         := !io.stall

    io.inst                         := axi_lite.readData.bits.data(31, 0)
    io.inst_valid                   := (axi_lite.readData.valid && axi_lite.readData.bits.resp === 0.U) & axi_req.ready & !axi_busy.asBool

}
