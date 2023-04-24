import chisel3._
import chisel3.util._
import BType._

object PH_State{
    val ST  = 01.U          //strongly taken
    val WT  = 11.U          //weakly taken
    val WNT = 10.U          //weakly not taken
    val SNT = 00.U          //strongly not taken
}

class CacheLine extends Bundle{
    val tag  = UInt()
    val data = UInt(64.W)
    val valid = Bool()
}

class BTB extends RawModule{
    val io
}

class BPU extends RawModule{
    val io = (new Bundle{
        val pc   = Input(UInt(64.W))
        val inst = Input(UInt(32.W))
        val is_branch = Output(Bool())  
        val target_pc = Output(UInt(64.W))
        val bp_fail = Output(Bool())

        val EX_to_BPU_forward = Flipped(Decoupled(new EX_BPU_Message))
    })

    val EX_pc = io.EX_to_BPU_forward.bits.PC
    val EX_branch_taken = io.EX_to_BPU_forward.bits.taken


    def hash(x: UInt): UInt = {
        val ret = Wire(UInt(8.W))
        val x1 = x(31, 16) ^ x(15, 0)
        ret := x1(15, 8) ^ x1(7, 0)
        ret
    }

    val BHT = RegInit(VecInit(Seq.fill(256)(0.U(4.W))))
    val PHT = RegInit(VecInit(Seq.fill(256)(PH_State.WT(2.W))))

    val opcode = inst(6, 0)
    
}