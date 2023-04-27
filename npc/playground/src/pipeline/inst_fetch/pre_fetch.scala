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

    val bp_fail_r = RegInit(0.U(1.W))
    when(io.bp_flush | io.bp_taken){
        bp_fail_r := 1.U
    }.elsewhen(axi_req.ready){
        bp_fail_r := 0.U
    }

    axi_req.valid   := 1.U
    PF_npc := MuxCase(io.PF_npc + 4.U, Seq(
        // (io.bp_flush              , io.bp_npc      ),
        ((io.bp_taken | io.bp_flush) & !axi_req.ready   , io.bp_npc),
        (io.bp_taken | io.bp_flush, io.bp_npc + 4.U),
        (bp_fail_r.asBool         , io.PF_npc      ),
        (io.stall | !axi_req.ready, io.PF_pc       )
    ))
    // PF_npc      := MuxCase(io.PF_npc+4.U, Seq(
    //     (io.bp_fail, io.ID_npc),
    //     (bp_fail_r.asBool, io.PF_npc),
    //     (io.stall | !axi_req.ready, io.PF_pc)
    // ))

    
    regConnectWithResetAndStall(io.PF_pc, Mux(io.bp_taken | io.bp_flush, io.bp_npc, PF_npc), reset.asBool, 0.U(64.W), io.stall | !axi_req.ready)

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
    axi_lite.readData.ready         := !io.stall

    io.inst                         := axi_lite.readData.bits.data(31, 0)
    io.inst_valid                   := (axi_lite.readData.valid && axi_lite.readData.bits.resp === 0.U) & !axi_busy & axi_req.ready

}
