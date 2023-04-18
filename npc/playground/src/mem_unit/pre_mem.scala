import chisel3._
import chisel3.util._
import AXILiteDefs._
import utils._
import LSUOpType._

class PMEM_MEM_Message extends Bundle{
    val ALU_result      = UInt(64.W)
    val regWriteEn      = Bool()
    val regWriteID      = UInt(5.W)
    val memReadData     = UInt(64.W)
    val memWriteData    = UInt(64.W)
    val memWriteEn      = Bool()
    val memReadEn       = Bool()
    val lsutype         = UInt(5.W)
    val PC              = UInt(64.W)
    val Inst            = UInt(32.W)
}

class MEM_pre_stage extends Module{
    val io = IO(new Bundle{
        val EX_to_MEM_bus   = Flipped(Decoupled(new EX_MEM_Message))
        val PMEM_to_MEM_bus = Decoupled(new PMEM_MEM_Message)
    })
    val axi_lite = IO(new AXILiteMasterIF(32, 64))

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

    val wstrb = Wire(UInt(8.W))
    wstrb := 0.U
    switch(io.PMEM_to_MEM_bus.bits.lsutype){
        is (sd) {wstrb := 0xFF.U}
        is (sw) {wstrb := 0x0F.U}
        is (sh) {wstrb := 0x03.U}
        is (sb) {wstrb := 0x01.U}
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
    io.PMEM_to_MEM_bus.bits.memReadData     := axi_lite.readData.bits.data
    io.EX_to_MEM_bus.ready                  := 1.U

    //r
    axi_lite.readAddr.valid                 := memReadEn
    axi_lite.readAddr.bits.addr             := ALU_result
    axi_lite.readData.ready                 := io.PMEM_to_MEM_bus.bits.memReadEn

    //w
    axi_lite.writeAddr.valid                := memWriteEn
    axi_lite.writeAddr.bits.addr            := ALU_result
    axi_lite.writeData.valid                := io.PMEM_to_MEM_bus.bits.memWriteEn
    axi_lite.writeData.bits.data            := io.PMEM_to_MEM_bus.bits.memWriteData
    axi_lite.writeData.bits.strb            := wstrb
    axi_lite.writeResp.ready                := io.PMEM_to_MEM_bus.bits.memWriteEn 
}