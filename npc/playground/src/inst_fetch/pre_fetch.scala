import chisel3._
import chisel3.util._
import AXILiteDefs._
import utils._


class IF_pre_fetch extends Module{
    val io = IO(new Bundle{
        val pre_fetch_pc = Input(UInt(64.W))
        val inst         = Output(UInt(32.W))
        val inst_valid   = Output(Bool())
        val PF_pc        = Output(UInt(64.W))
        val stall        = Input(Bool())
    })
    val axi_lite = IO(new AXILiteMasterIF(32, 64))

    regConnectWithResetAndStall(io.PF_pc, io.pre_fetch_pc, reset, 0x80000000L.U(64.W), io.stall)

    //IFU doesn't write mem
    axi_lite.writeAddr.valid        := 0.U
    axi_lite.writeAddr.bits.addr    := 0.U
    axi_lite.writeData.valid        := 0.U
    axi_lite.writeData.bits.data    := 0.U
    axi_lite.writeData.bits.strb    := 0.U
    axi_lite.writeResp.ready        := 0.U

    //Fetch inst from sram
    axi_lite.readAddr.valid         := !io.stall && !reset.asBool
    axi_lite.readAddr.bits.addr     := io.pre_fetch_pc(31, 0)
    axi_lite.readData.ready         := 1.U

    io.inst                         := axi_lite.readData.bits.data
    io.inst_valid                   := (axi_lite.readData.valid && axi_lite.readData.bits.resp === 0.U)
}