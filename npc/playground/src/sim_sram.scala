import chisel3._
import chisel3.util._
import AXILiteDefs._

class sim_sram extends BlackBox with HasBlackBoxPath{
    val io = IO(new Bundle{
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

class RAMU extends Module{
    val io = IO(new Bundle{
        val axi_IF  = Flipped(Decoupled(new AXILiteMasterIF(64, 32)))
        val axi_MEM = Flipped(Decoupled(new AXILiteMasterIF(64, 32)))  
    })

    val data_ram = Module(new sim_sram)
    val axi_sel  = Decoupled(new AXILiteMasterIF(64, 32))
    axi_sel      = Mux(0.U , Seq(
        (io.axi_MEM.valid, axi_MEM),
        (io.axi_IF.valid , axi_IF )
    ))

    data_ram.io.aclk                            := clock
    data_ram.io.aresetn                         := !reset.asBool
    //ar
    data_ram.io.araddr                          := axi_sel.bits.readAddr.bits.addr
    data_ram.io.arvalid                         := axi_sel.bits.readAddr.valid
    axi_sel.bits.readAddr.ready      := data_ram.io.arready
    //r
    axi_sel.bits.readData.bits.data  := data_ram.io.rdata
    axi_sel.bits.readData.bits.resp  := data_ram.io.rresp
    axi_sel.bits.readData.valid      := data_ram.io.rvalid
    data_ram.io.rready                          := axi_sel.bits.readData.ready
    //aw
    data_ram.io.awaddr                          := axi_sel.bits.writeAddr.bits.addr
    data_ram.io.awvalid                         := axi_sel.bits.writeAddr.valid
    axi_sel.bits.writeAddr.ready     := data_ram.io.awready
    //w
    data_ram.io.wdata                           := axi_sel.bits.writeData.bits.data
    data_ram.io.wstrb                           := axi_sel.bits.writeData.bits.strb
    data_ram.io.wvalid                          := axi_sel.bits.writeData.valid
    axi_sel.bits.writeData.ready     := data_ram.io.wready
    //b
    axi_sel.bits.writeResp.bits.resp := data_ram.io.bresp
    axi_sel.bits.writeResp.valid     := data_ram.io.bvalid
    data_ram.io.bready                          := axi_sel.bits.writeResp.ready
}