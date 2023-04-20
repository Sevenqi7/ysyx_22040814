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

class AXI_Arbiter extends Module{
    val io = IO(new Bundle{
        val axi_IF  = Flipped(Decoupled(new AXILiteMasterIF(64, 32)))
        val axi_MEM = Flipped(Decoupled(new AXILiteMasterIF(64, 32)))
        val axi_out = Decoupled(new AXILiteMasterIF(64, 32))
    })

    val data_ram = Module(new sim_sram)
    val axi_arbiter = Module(new Arbiter(new AXILiteMasterIF(64, 32), 2))
    axi_arbiter.io.in(0) <> io.axi_MEM
    axi_arbiter.io.in(1) <> io.axi_IF
    io.axi_out           <> axi_arbiter.io.out
}

class RAMU extends Module{
    val io = IO(new Bundle{
        val axi_IF  = Flipped(Decoupled(new AXILiteMasterIF(64, 32)))
        val axi_MEM = Flipped(Decoupled(new AXILiteMasterIF(64, 32)))
    })

    val arbiter = Module(new AXI_Arbiter)
    arbiter.io.axi_IF <> io.axi_IF
    arbiter.io.axi_MEM <> io.axi_MEM

    data_ram.io.aclk                            := clock
    data_ram.io.aresetn                         := !reset.asBool
    //ar
    data_ram.io.araddr                          := arbiter.io.axi_out.bits.readAddr.bits.addr
    data_ram.io.arvalid                         := arbiter.io.axi_out.bits.readAddr.valid
    arbiter.io.axi_out.bits.readAddr.ready      := data_ram.io.arready
    //r
    arbiter.io.axi_out.bits.readData.bits.data  := data_ram.io.rdata
    arbiter.io.axi_out.bits.readData.bits.resp  := data_ram.io.rresp
    arbiter.io.axi_out.bits.readData.valid      := data_ram.io.rvalid
    data_ram.io.rready                          := arbiter.io.axi_out.bits.readData.ready
    //aw
    data_ram.io.awaddr                          := arbiter.io.axi_out.bits.writeAddr.bits.addr
    data_ram.io.awvalid                         := arbiter.io.axi_out.bits.writeAddr.valid
    arbiter.io.axi_out.bits.writeAddr.ready     := data_ram.io.awready
    //w
    data_ram.io.wdata                           := arbiter.io.axi_out.bits.writeData.bits.data
    data_ram.io.wstrb                           := arbiter.io.axi_out.bits.writeData.bits.strb
    data_ram.io.wvalid                          := arbiter.io.axi_out.bits.writeData.valid
    arbiter.io.axi_out.bits.writeData.ready     := data_ram.io.wready
    //b
    arbiter.io.axi_out.bits.writeResp.bits.resp := data_ram.io.bresp
    arbiter.io.axi_out.bits.writeResp.valid     := data_ram.io.bvalid
    data_ram.io.bready                          := arbiter.io.axi_out.bits.writeResp.ready
}