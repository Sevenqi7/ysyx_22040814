import chisel3._
import chisel3.util._
import utils._

class sim_sram extends BlackBox with HasBlackBoxPath{
    val io = IO(new Bundle{
        val pc = Input(UInt(64.W))
        val aclk = Input(Clock())
        val aresetn = Input(Reset())
        //ar
        val araddr = Input(UInt(32.W))
        val arvalid = Input(Bool())
        val arready = Output(Bool())
        //r
        val rdata = Output(UInt(64.W))
        val rresp = Output(UInt(2.W))
        val rvalid = Output(Bool())
        val rready = Input(Bool())
        //aw
        val awaddr = Input(UInt(32.W))
        val awvalid = Input(Bool())
        val awready = Output(Bool())
        //w
        val wdata = Input(UInt(64.W)) 
        val wstrb = Input(UInt(8.W))
        val wvalid = Input(Bool())
        val wready = Output(Bool())
        //b
        val bresp = Output(UInt(2.W))
        val bvalid = Output(Bool())
        val bready = Input(Bool())
    })
    addPath("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/npc/playground/verilog/sim_sram.v")
}

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
    })

    val inst_ram = Module(new sim_sram)
    val pre_fetch = Module(new IF_pre_fetch)
    val bp_fail = Wire(Bool())
    val flush   = Wire(Bool())

    io.PF_npc                               := pre_fetch.io.PF_npc
    io.PF_pc                                := pre_fetch.io.PF_pc
    io.axidata                              := pre_fetch.axi_lite.readData.bits.data

    bp_fail                                 := pre_fetch.io.bp_fail
    pre_fetch.io.IF_pc                      := io.IF_to_ID_bus.bits.PC
    pre_fetch.io.ID_npc                     := io.ID_npc
    pre_fetch.io.stall                      := !io.IF_to_ID_bus.ready

    //axi-lite
    inst_ram.io.pc                          := pre_fetch.io.PF_pc
    inst_ram.io.aclk                        := clock
    inst_ram.io.aresetn                     := !reset.asBool
    //ar
    inst_ram.io.araddr                      := pre_fetch.axi_lite.readAddr.bits.addr
    inst_ram.io.arvalid                     := pre_fetch.axi_lite.readAddr.valid
    pre_fetch.axi_lite.readAddr.ready       := inst_ram.io.arready
    //r
    pre_fetch.axi_lite.readData.bits.data   := inst_ram.io.rdata
    pre_fetch.axi_lite.readData.bits.resp   := inst_ram.io.rresp
    pre_fetch.axi_lite.readData.valid       := inst_ram.io.rvalid
    inst_ram.io.rready                      := pre_fetch.axi_lite.readData.ready
    //aw
    inst_ram.io.awaddr                      := pre_fetch.axi_lite.writeAddr.bits.addr
    inst_ram.io.awvalid                     := pre_fetch.axi_lite.writeAddr.valid
    pre_fetch.axi_lite.writeAddr.ready      := inst_ram.io.awready
    //w
    inst_ram.io.wdata                       := pre_fetch.axi_lite.writeData.bits.data
    inst_ram.io.wstrb                       := pre_fetch.axi_lite.writeData.bits.strb
    inst_ram.io.wvalid                      := pre_fetch.axi_lite.writeData.valid
    pre_fetch.axi_lite.writeData.ready      := inst_ram.io.wready
    //b
    pre_fetch.axi_lite.writeResp.bits.resp  := inst_ram.io.bresp
    pre_fetch.axi_lite.writeResp.valid      := inst_ram.io.bready
    inst_ram.io.bready                      := pre_fetch.axi_lite.writeResp.ready

    flush                                   := reset.asBool | !pre_fetch.io.inst_valid | bp_fail

    //pipeline
    regConnectWithResetAndStall(io.IF_to_ID_bus.bits.PC, pre_fetch.io.PF_pc   , flush, 0.U, !io.IF_to_ID_bus.ready)
    regConnectWithResetAndStall(io.IF_to_ID_bus.bits.Inst, pre_fetch.io.inst  , flush, 0.U, !io.IF_to_ID_bus.ready)
    regConnectWithResetAndStall(io.IF_to_ID_bus.valid, pre_fetch.io.inst_valid, flush, 0.U, !io.IF_to_ID_bus.ready)
    
}

