import chisel3._
import chisel3.util._
import chisel3.experimental.dataview._
import AXILiteDefs._

class sim_sram extends BlackBox with HasBlackBoxPath{
    val io = IO(new AXIBundleIF)
    addPath("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/npc/playground/verilog/sim_sram.v")
}

class AXI_Arbiter extends Module{
    val io = IO(new Bundle{
        val axi_IF  = Flipped(Decoupled(new AXILiteMasterIF(32, 64)))
        val axi_MEM = Flipped(Decoupled(new AXILiteMasterIF(32, 64)))  
        val axi_out = Decoupled(new AXILiteMasterIF(32, 64))
    })

    val arbiter = Module(new Arbiter(AXILiteMasterIF(32, 64), 2))
    arbiter.io.in(0) <> io.axi_IF
    arbiter.io.in(1) <> io.axi_MEM
    io.axi_out       <> arbiter.io.out
}

class RAMU extends Module{
    val io = IO(new Bundle{
        val axi_IF  = Flipped(Decoupled(new AXILiteMasterIF(32, 64)))
        val axi_MEM = Flipped(Decoupled(new AXILiteMasterIF(32, 64)))  
    })
    val data_ram = Module(new sim_sram())
    val arb = Module(new AXI_Arbiter)
    val axi_sel = arb.io.axi_out
    arb.io.axi_IF                               := io.axi_IF
    arb.io.axi_MEM                              := io.axi_MEM

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