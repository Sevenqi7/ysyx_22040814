import chisel3._
import chisel3.util._
import AXILiteDefs._
import utils._
import LSUOpType._

class PMEM_MEM_Message extends Bundle{
    val ALU_result      = UInt(64.W)
    val regWriteEn      = Bool()
    val regWriteID      = UInt(5.W)
    val memWriteData    = UInt(64.W)
    val memWriteEn      = Bool()
    val memReadEn       = Bool()
    val lsutype         = UInt(5.W)
    val PC              = UInt(64.W)
    val Inst            = UInt(32.W)
}

class PMEM_to_ID_Message extends Bundle{
    val ALU_result      = UInt(64.W)
    val regWriteEn      = Bool()
    val regWriteID      = UInt(5.W)
    val memReadEn       = Bool()
}

class MEM_pre_stage extends Module{
    val io = IO(new Bundle{
        val EX_to_MEM_bus   = Flipped(Decoupled(new EX_MEM_Message))
        val PMEM_to_MEM_bus = Decoupled(new PMEM_MEM_Message)
        val PMEM_to_ID_forward = Decoupled(new PMEM_to_ID_Message)
        val memReadData     = Output(UInt(64.W))
    })
    val axi_lite = IO(new AXILiteMasterIF(32, 64))
    val axi_req  = IO(new DecoupledIO)

    //unpack bus from EXU
    val EX_pc        =  io.EX_to_MEM_bus.bits.PC
    val EX_Inst      =  io.EX_to_MEM_bus.bits.Inst
    val ALU_result   =  io.EX_to_MEM_bus.bits.ALU_result  
    val memWriteData =  io.EX_to_MEM_bus.bits.memWriteData
    val memWriteEn   =  io.EX_to_MEM_bus.bits.memWriteEn
    val memReadEn    =  io.EX_to_MEM_bus.bits.memReadEn
    val lsutype      =  io.EX_to_MEM_bus.bits.lsutype
    val regWriteID   =  io.EX_to_MEM_bus.bits.regWriteID
    val regWriteEn   =  io.EX_to_MEM_bus.bits.regWriteEn
    
    axi_req.valid   :=  memReadEn | memWriteEn
    val wstrb = Wire(UInt(8.W))
    wstrb := 0.U
    switch(lsutype){
        is (sd) {wstrb := 0xFF.U}
        is (sw) {wstrb := 0x0F.U}
        is (sh) {wstrb := 0x03.U}
        is (sb) {wstrb := 0x01.U}
    }

    val memReadData = Wire(UInt(64.W))
    memReadData := 0.U
    switch(io.PMEM_to_MEM_bus.bits.lsutype){
        is (ld) {memReadData := axi_lite.readData.bits.data}
        is (lw) {memReadData := SEXT(axi_lite.readData.bits.data(31, 0), 32)}
        is (lh) {memReadData := SEXT(axi_lite.readData.bits.data(15, 0), 16)}
        is (lb) {memReadData := SEXT(axi_lite.readData.bits.data( 7, 0),  8)}
        is (lwu){memReadData := axi_lite.readData.bits.data(31, 0)}
        is (lhu){memReadData := axi_lite.readData.bits.data(15, 0)}
        is (lbu){memReadData := axi_lite.readData.bits.data( 7 ,0)}
    }

    regConnect(io.PMEM_to_MEM_bus.bits.PC           , EX_pc         )
    regConnect(io.PMEM_to_MEM_bus.bits.Inst         , EX_Inst       )
    regConnect(io.PMEM_to_MEM_bus.bits.ALU_result   , ALU_result    )
    regConnect(io.PMEM_to_MEM_bus.bits.regWriteEn   , regWriteEn    )
    regConnect(io.PMEM_to_MEM_bus.bits.regWriteID   , regWriteID    )
    regConnect(io.PMEM_to_MEM_bus.bits.memReadEn    , memReadEn     )
    regConnect(io.PMEM_to_MEM_bus.bits.memWriteEn   , memWriteEn    )
    regConnect(io.PMEM_to_MEM_bus.bits.memWriteData , memWriteData  )
    regConnect(io.PMEM_to_MEM_bus.bits.lsutype      , lsutype       )
    regConnect(io.PMEM_to_MEM_bus.valid             , io.EX_to_MEM_bus.valid)
    io.memReadData                          := memReadData
    io.EX_to_MEM_bus.ready                  := 1.U

    //r
    axi_lite.readAddr.valid                 := memReadEn
    // axi_lite.readAddr.valid                 := 1.U
    axi_lite.readData.ready                 := memReadEn
    // axi_lite.readData.ready                 := 1.U
    axi_lite.readAddr.bits.addr             := ALU_result(31, 0)

    //w
    axi_lite.writeAddr.valid                := memWriteEn
    axi_lite.writeAddr.bits.addr            := ALU_result(31, 0)
    axi_lite.writeData.valid                := memWriteEn
    axi_lite.writeData.bits.data            := memWriteData
    axi_lite.writeResp.ready                := memWriteEn 
    axi_lite.writeData.bits.strb            := wstrb

    //forward
    io.PMEM_to_ID_forward.bits.ALU_result   := ALU_result    
    io.PMEM_to_ID_forward.bits.regWriteEn   := regWriteEn
    io.PMEM_to_ID_forward.bits.regWriteID   := regWriteID
    io.PMEM_to_ID_forward.bits.memReadEn    := memReadEn
    io.PMEM_to_ID_forward.valid             := 1.U
}