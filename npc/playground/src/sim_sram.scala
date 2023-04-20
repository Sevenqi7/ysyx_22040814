import chisel3._
import chisel3.util._
import chisel3.experimental.dataview._
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
        val axi_IF  = Flipped(Decoupled(new AXILiteMasterIF(32, 64)))
        val axi_MEM = Flipped(Decoupled(new AXILiteMasterIF(32, 64)))  
    })
    val data_ram = Module(new sim_sram())
    data_ram.io.aclk                            := clock
    data_ram.io.aresetn                         := !reset.asBool

    when(io.axi_MEM.valid)
    {
        //ar
        data_ram.io.araddr                          := io.axi_MEM.bits.readAddr.bits.addr
        data_ram.io.arvalid                         := io.axi_MEM.bits.readAddr.valid
        io.axi_MEM.bits.readAddr.ready              := data_ram.io.arready
        //r
        io.axi_MEM.bits.readData.bits.data          := data_ram.io.rdata
        io.axi_MEM.bits.readData.bits.resp          := data_ram.io.rresp
        io.axi_MEM.bits.readData.valid              := data_ram.io.rvalid
        data_ram.io.rready                          := io.axi_MEM.bits.readData.ready
        //aw
        data_ram.io.awaddr                          := io.axi_MEM.bits.writeAddr.bits.addr
        data_ram.io.awvalid                         := io.axi_MEM.bits.writeAddr.valid
        io.axi_MEM.bits.writeAddr.ready             := data_ram.io.awready
        //w
        data_ram.io.wdata                           := io.axi_MEM.bits.writeData.bits.data
        data_ram.io.wstrb                           := io.axi_MEM.bits.writeData.bits.strb
        data_ram.io.wvalid                          := io.axi_MEM.bits.writeData.valid
        io.axi_MEM.bits.writeData.ready             := data_ram.io.wready  
        //b
        io.axi_MEM.bits.writeResp.bits.resp         := data_ram.io.bresp
        io.axi_MEM.bits.writeResp.valid             := data_ram.io.bvalid
        data_ram.io.bready                          := io.axi_MEM.bits.writeResp.ready
    }
    .otherwise{
        //ar
        data_ram.io.araddr                          := io.axi_IF.bits.readAddr.bits.addr
        data_ram.io.arvalid                         := io.axi_IF.bits.readAddr.valid
        io.axi_IF.bits.readAddr.ready              := data_ram.io.arready
        //r
        io.axi_IF.bits.readData.bits.data          := data_ram.io.rdata
        io.axi_IF.bits.readData.bits.resp          := data_ram.io.rresp
        io.axi_IF.bits.readData.valid              := data_ram.io.rvalid
        data_ram.io.rready                          := io.axi_IF.bits.readData.ready
        //aw
        data_ram.io.awaddr                          := io.axi_IF.bits.writeAddr.bits.addr
        data_ram.io.awvalid                         := io.axi_IF.bits.writeAddr.valid
        io.axi_IF.bits.writeAddr.ready             := data_ram.io.awready
        //w
        data_ram.io.wdata                           := io.axi_IF.bits.writeData.bits.data
        data_ram.io.wstrb                           := io.axi_IF.bits.writeData.bits.strb
        data_ram.io.wvalid                          := io.axi_IF.bits.writeData.valid
        io.axi_IF.bits.writeData.ready             := data_ram.io.wready  
        //b
        io.axi_IF.bits.writeResp.bits.resp         := data_ram.io.bresp
        io.axi_IF.bits.writeResp.valid             := data_ram.io.bvalid
        data_ram.io.bready                          := io.axi_IF.bits.writeResp.ready
    }

}