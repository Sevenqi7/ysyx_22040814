import chisel3._
import chisel3.util._
import AXIDefs._
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
        //debug
        val cache_hit    = Output(Bool())
        val cache_state  = Output(UInt(3.W))

    })
    val axi      = IO(new AXIMasterIF(32, 64, 4))
    val axi_req  = IO(new MyReadyValidIO)

    val PF_npc   = RegInit(0x80000000L.U(64.W))
    io.PF_npc    := PF_npc
    val axi_busy = RegInit(0.U(1.W))
    axi_busy        := !axi_req.ready
    axi_req.valid   := 1.U


    /*****************ICache******************/
    
    //parameter
    val offsetWidth = 4
    val tagWidth    = 20
    val nrSets      = 256
    val nrLines     = 2
    val inst_cache  = Module(new ICache(tagWidth, nrSets, nrLines, offsetWidth))
    
    io.cache_hit               := inst_cache.io.hit
    io.cache_state             := inst_cache.io.state

    axi.readAddr.bits.id       := 0.U
    axi.readAddr.bits.len      := 2.U
    axi.readAddr.bits.size     := "b011".U       //8 bytes
    axi.readAddr.bits.burst    := "b01".U
    axi.readAddr.bits.lock     := 0.U
    axi.readAddr.bits.cache    := 0.U
    axi.readAddr.bits.prot     := 0.U
    axi.readAddr.bits.addr     := inst_cache.io.axi_raddr(31, 0)
    axi.readAddr.valid         := inst_cache.io.axi_rreq
    axi.readData.ready         := !io.stall
    inst_cache.io.addr         := MuxCase(PF_npc(31, 0), Seq(
        (io.bp_flush, io.bp_npc),
        (io.stall | (inst_cache.io.arvalid & !inst_cache.io.hit), io.PF_pc ),
        (io.bp_taken, io.bp_npc)
        ))
    inst_cache.io.valid        := 1.U
    inst_cache.io.axi_arready  := axi.readAddr.ready
    inst_cache.io.axi_rvalid   := axi.readData.valid
    inst_cache.io.axi_rlast    := axi.readData.bits.last
    inst_cache.io.axi_rdata    := axi.readData.bits.data
    /*****************ICache******************/
    
    io.inst                         := inst_cache.io.rdata
    io.inst_valid                   := inst_cache.io.rvalid

    PF_npc := MuxCase(io.PF_npc + 4.U, Seq(
        (io.bp_flush, io.bp_npc + 4.U),
        (io.stall | (inst_cache.io.arvalid & !inst_cache.io.hit), io.PF_npc      ),
        (io.bp_taken, io.bp_npc + 4.U)
    ))


    val npc = Wire(UInt(64.W))
    npc := MuxCase(PF_npc, Seq(
        (io.bp_flush  , io.bp_npc),
        (io.stall | (inst_cache.io.arvalid & !inst_cache.io.hit),  io.PF_pc),
        (io.bp_taken  , io.bp_npc)
    ))
    
    regConnect(io.PF_pc, npc)


    //IFU doesn't write mem
    axi.writeAddr.bits.id      := 0.U
    axi.writeAddr.bits.addr    := 0.U 
    axi.writeAddr.bits.len     := 0.U
    axi.writeAddr.bits.size    := 0.U
    axi.writeAddr.bits.burst   := 0.U
    axi.writeAddr.bits.lock    := 0.U
    axi.writeAddr.bits.cache   := 0.U
    axi.writeAddr.bits.prot    := 0.U
    axi.writeAddr.valid        := 0.U
    axi.writeData.bits.id      := 0.U
    axi.writeData.bits.data    := 0.U
    axi.writeData.bits.strb    := 0.U
    axi.writeData.bits.last    := 1.U
    axi.writeData.valid        := 0.U
    axi.writeResp.ready        := 0.U

    //Fetch inst from sram



}
