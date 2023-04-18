import chisel3._
import chisel3.util._
import utils._
import OpType._
import InstType._
import java.util.Base64.Decoder

class LSU extends BlackBox with HasBlackBoxPath{
    val io = IO(new Bundle{
        val pc   = Input(UInt(64.W))
        val addr = Input(UInt(64.W))
        val LsuType = Input(UInt(5.W))
        val WriteEn = Input(UInt(1.W))
        val ReadEn  = Input(UInt(1.W))
        val WriteData = Input(UInt(64.W))
        val ReadData = Output(UInt(64.W))
    })
    addPath("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/npc/playground/verilog/LSU.v")
}

//bypass
class MEM_to_ID_Message extends Bundle{
    val regWriteData = UInt(64.W)
    val regWriteEn   = Bool()
    val regWriteID   = UInt(5.W)
}

class MEM_to_WB_Message extends Bundle{

    val regWriteData = UInt(64.W)
    val regWriteEn   = Bool()
    val regWriteID   = UInt(5.W)

    //for NPC to trace
    val PC           = UInt(64.W)
    val Inst         = UInt(32.W)
}


class MEMU extends Module{
    val io = IO(new Bundle{
        val EX_to_MEM_bus = Flipped(Decoupled(new EX_MEM_Message))
        val MEM_to_WB_bus = Decoupled(new MEM_to_WB_Message)
        val MEM_to_ID_forward = Decoupled(new MEM_to_ID_Message)

        //for NPC to trace
        val PMEM_pc = UInt(64.W)
    })

    //unpack bus from EXU


    val pre_mem      =  Module(new MEM_pre_stage)
    val data_ram     =  Module(new sim_sram)
    io.PMEM_pc       =  pre_mem.io.PMEM_to_MEM_bus.bits.PC

    pre_mem.io.EX_to_MEM_bus <> io.EX_to_MEM_bus

    data_ram.io.pc      := pre_mem.io.PMEM_to_MEM_bus.bits.PC
    data_ram.io.aclk    := clock
    data_ram.io.aresetn := !reset.asBool
    //ar
    data_ram.io.araddr  := pre_mem.axi_lite.readAddr.bits.addr
    data_ram.io.arvalid := pre_mem.axi_lite.readAddr.valid
    pre_mem.axi_lite.readAddr.ready     := data_ram.io.arready
    //r
    pre_mem.axi_lite.readData.bits.data := data_ram.io.rdata
    pre_mem.axi_lite.readData.bits.resp := data_ram.io.rresp
    pre_mem.axi_lite.readData.valid     := data_ram.io.rvalid
    data_ram.io.rready                  := pre_mem.axi_lite.readData.ready
    //aw
    data_ram.io.awaddr                  := pre_mem.axi_lite.writeAddr.bits.addr
    data_ram.io.awvalid                 := pre_mem.axi_lite.writeAddr.valid
    pre_mem.axi_lite.writeAddr.ready    := data_ram.io.awready
    //w
    data_ram.io.wdata                   := pre_mem.axi_lite.writeData.bits.data
    data_ram.io.wstrb                   := pre_mem.axi_lite.writeData.bits.strb
    data_ram.io.wvalid                  := pre_mem.axi_lite.writeData.valid
    pre_mem.axi_lite.writeData.ready    := data_ram.io.wready
    //b
    pre_mem.axi_lite.writeResp.bits.resp  := data_ram.io.bresp
    pre_mem.axi_lite.writeResp.valid      := data_ram.io.bvalid
    data_ram.io.bready                    := pre_mem.axi_lite.writeResp.ready


    val regWriteData = Wire(UInt(64.W))

    regWriteData := Mux(pre_mem.io.PMEM_to_MEM_bus.bits.memReadEn, pre_mem.io.PMEM_to_MEM_bus.bits.memReadData, 
                                                                    pre_mem.io.PMEM_to_MEM_bus.bits.ALU_result)
    
    regConnect(io.MEM_to_WB_bus.bits.PC                , pre_mem.io.PMEM_to_MEM_bus.bits.PC   )
    regConnect(io.MEM_to_WB_bus.bits.Inst              , pre_mem.io.PMEM_to_MEM_bus.bits.Inst   )
    regConnect(io.MEM_to_WB_bus.bits.regWriteEn        , pre_mem.io.PMEM_to_MEM_bus.bits.regWriteEn   )
    regConnect(io.MEM_to_WB_bus.bits.regWriteID        , pre_mem.io.PMEM_to_MEM_bus.bits.regWriteID    )
    regConnect(io.MEM_to_WB_bus.bits.regWriteData      , regWriteData)
    regConnect(io.MEM_to_WB_bus.valid                  , pre_mem.io.PMEM_to_MEM_bus.valid)
    pre_mem.io.PMEM_to_MEM_bus.ready       := 1.U    

    io.MEM_to_ID_forward.bits.regWriteData := regWriteData
    io.MEM_to_ID_forward.bits.regWriteEn   := pre_mem.io.PMEM_to_MEM_bus.bits.regWriteEn
    io.MEM_to_ID_forward.bits.regWriteID   := pre_mem.io.PMEM_to_MEM_bus.bits.regWriteID
    io.MEM_to_ID_forward.valid             := pre_mem.io.PMEM_to_MEM_bus.bits.regWriteEn & (pre_mem.io.PMEM_to_MEM_bus.bits.regWriteID > 0.U)

}  
