import chisel3._
import chisel3.util._

class ThaliaTop extends Module {
    val io = IO(new Bundle{
        val debug_pc = Output(UInt(64.W))
        val debug_inst = Output(UInt(32.W))
    })

    val prefetch_unit = Module(new PFU())
    // val 
}