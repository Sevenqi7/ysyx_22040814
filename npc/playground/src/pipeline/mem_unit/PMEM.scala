import chisel3._
import chisel3.util._
import AXIDefs._
import utils._
import LSUOpType._

class PMEM_MEM_Message extends Bundle{
    val ALU_result      =   UInt(64.W)
    val regWriteEn      =   Bool()
    val regWriteID      =   UInt(5.W)
    val memWriteData    =   UInt(64.W)
    val memWriteEn      =   Bool()
    val memReadEn       =   Bool()
    val lsutype         =   UInt(5.W)
    val csrWriteAddr    =   UInt(12.W)
    val csrWriteEn      =   Bool()
    val csrWriteData    =   UInt(64.W)

    val PC              =   UInt(64.W)
    val Inst            =   UInt(32.W)
}

class PMEM_to_ID_Message extends Bundle{
    val ALU_result      = UInt(64.W)
    val regWriteEn      = Bool()
    val regWriteID      = UInt(5.W)
    val memReadEn       = Bool()
    val csrWriteAddr    =   UInt(12.W)
    val csrWriteEn      =   Bool()
}

class MEM_pre_stage extends Module{
    val io = IO(new Bundle{
        val EX_to_MEM_bus   = Flipped(Decoupled(new EX_MEM_Message))
        val PMEM_to_MEM_bus = Decoupled(new PMEM_MEM_Message)
        val PMEM_to_ID_forward = Decoupled(new PMEM_to_ID_Message)
        val memReadData     = Output(UInt(64.W))
    })
    val axi = IO(new AXIMasterIF(32, 64, 4))
    val axi_req  = IO(new MyReadyValidIO)
    
    //unpack bus from EXU
    val EX_pc        =  Mux(io.EX_to_MEM_bus.valid, io.EX_to_MEM_bus.bits.PC, 0.U)
    val EX_Inst      =  io.EX_to_MEM_bus.bits.Inst
    val ALU_result   =  io.EX_to_MEM_bus.bits.ALU_result  
    val memWriteData =  io.EX_to_MEM_bus.bits.memWriteData
    val memWriteEn   =  io.EX_to_MEM_bus.bits.memWriteEn
    val memReadEn    =  io.EX_to_MEM_bus.bits.memReadEn
    val lsutype      =  io.EX_to_MEM_bus.bits.lsutype
    val regWriteID   =  io.EX_to_MEM_bus.bits.regWriteID
    val regWriteEn   =  io.EX_to_MEM_bus.bits.regWriteEn
    val csrWriteEn   =  io.EX_to_MEM_bus.bits.csrWriteEn
    val csrWriteAddr =  io.EX_to_MEM_bus.bits.csrWriteAddr
    val csrWriteData =  io.EX_to_MEM_bus.bits.csrWriteData
    

    /*****************DCache******************/
    
    //parameter
    val offsetWidth = 4
    val tagWidth    = 21
    val nrSets      = 128
    val nrLines     = 2

    val mem_cache = Module(new DCache(tagWidth, nrSets, nrLines, offsetWidth))

    val wstrb = Wire(UInt(8.W))
    wstrb := 0.U
    switch(lsutype){
        is (sd) {wstrb := 0xFF.U}
        is (sw) {wstrb := 0x0F.U}
        is (sh) {wstrb := 0x03.U}
        is (sb) {wstrb := 0x01.U}
    }
    //r
    
    mem_cache.io.valid         := (memReadEn | memWriteEn) & io.EX_to_MEM_bus.valid
    mem_cache.io.op            := Mux(memWriteEn, 1.U, 0.U)
    mem_cache.io.addr          := ALU_result(31, 0)
    mem_cache.io.wstrb         := wstrb
    mem_cache.io.wdata         := memWriteData
    mem_cache.io.axi_arready   := axi.readAddr.ready
    mem_cache.io.axi_rlast     := axi.readAddr.bits.rlast
    mem_cache.io.axi_rvalid    := axi.readData.bits.valid
    mem_cache.io.axi_awready   := axi.writeAddr.ready
    mem_cache.io.axi_wready    := axi.writeData.ready
     
    
    val memReadData = Wire(UInt(64.W))
    memReadData := 0.U
    switch(io.PMEM_to_MEM_bus.bits.lsutype){
        is (ld) {memReadData := mem_cache.io.rdata}
        is (lw) {memReadData := SEXT(mem_cache.io.rdata(31, 0), 32)}
        is (lh) {memReadData := SEXT(mem_cache.io.rdata(15, 0), 16)}
        is (lb) {memReadData := SEXT(mem_cache.io.rdata( 7, 0),  8)}
        is (lwu){memReadData := mem_cache.io.rdata(31, 0)}
        is (lhu){memReadData := mem_cache.io.rdata(15, 0)}
        is (lbu){memReadData := mem_cache.io.rdata( 7 ,0)}
    }
    
    axi_req.valid              := mem_cache.io.axi_rreq | mem_cache.io.axi_wreq
    axi.readAddr.bits.id       := 1.U
    axi.readAddr.bits.addr     := mem_cache.io.axi_raddr
    axi.readAddr.bits.len      := 0.U
    axi.readAddr.bits.size     := "b011.U".U       //64 bits
    axi.readAddr.bits.burst    := "b01".U
    axi.readAddr.bits.lock     := 0.U
    axi.readAddr.bits.cache    := 0.U
    axi.readAddr.bits.prot     := 0.U
    axi.readAddr.valid         := mem_cache.io.axi_rreq
    axi.readData.ready         := memReadEn & io.EX_to_MEM_bus.valid


    //w
    axi.writeAddr.bits.id      := 1.U
    axi.writeAddr.bits.addr    := mem_cahce.io.axi_waddr
    axi.writeAddr.bits.len     := 1.U
    axi.writeAddr.bits.size    := "b011".U
    axi.writeAddr.bits.burst   := "b01".U
    axi.writeAddr.bits.lock    := 0.U
    axi.writeAddr.bits.cache   := 0.U
    axi.writeAddr.bits.prot    := 0.U
    axi.writeAddr.valid        := mem_cache.io.axi_wreq

    axi.writeData.bits.id      := 1.U
    axi.writeData.bits.data    := mem_cahce.io.axi_wdata
    axi.writeData.bits.strb    := mem_cache.io.axi_wstrb
    axi.writeData.bits.last    := mem_cache.io.axi_wlast
    axi.writeData.valid        := mem_cache.io.axi_wreq
    axi.writeResp.ready        := 1.U
    /***************DCache  End****************/

    
    val stall = (memReadEn | memWriteEn) & io.EX_to_MEM_bus.valid & (!axi.readAddr.ready | !axi.writeAddr.ready)

    val PMEM_valid = Mux(stall, 0.U, io.EX_to_MEM_bus.valid)

    regConnect(io.PMEM_to_MEM_bus.bits.PC           , EX_pc                 )
    regConnect(io.PMEM_to_MEM_bus.bits.Inst         , EX_Inst               )
    regConnect(io.PMEM_to_MEM_bus.bits.ALU_result   , ALU_result            )
    regConnect(io.PMEM_to_MEM_bus.bits.regWriteEn   , regWriteEn            )
    regConnect(io.PMEM_to_MEM_bus.bits.regWriteID   , regWriteID            )
    regConnect(io.PMEM_to_MEM_bus.bits.memReadEn    , memReadEn             )
    regConnect(io.PMEM_to_MEM_bus.bits.memWriteEn   , memWriteEn            )
    regConnect(io.PMEM_to_MEM_bus.bits.memWriteData , memWriteData          )
    regConnect(io.PMEM_to_MEM_bus.bits.lsutype      , lsutype               )
    regConnect(io.PMEM_to_MEM_bus.bits.csrWriteEn   , csrWriteEn            )
    regConnect(io.PMEM_to_MEM_bus.bits.csrWriteAddr , csrWriteAddr          )
    regConnect(io.PMEM_to_MEM_bus.bits.csrWriteData , csrWriteData          )
    regConnect(io.PMEM_to_MEM_bus.valid             , PMEM_valid)
    
    io.memReadData             := memReadData
    io.EX_to_MEM_bus.ready     := Mux(stall, 0.U, 1.U)


    //forward
    io.PMEM_to_ID_forward.bits.ALU_result   := ALU_result    
    io.PMEM_to_ID_forward.bits.regWriteEn   := regWriteEn
    io.PMEM_to_ID_forward.bits.regWriteID   := regWriteID
    io.PMEM_to_ID_forward.bits.memReadEn    := memReadEn
    io.PMEM_to_ID_forward.bits.csrWriteEn   := csrWriteEn
    io.PMEM_to_ID_forward.bits.csrWriteAddr := csrWriteAddr
    io.PMEM_to_ID_forward.valid             := io.EX_to_MEM_bus.valid
}