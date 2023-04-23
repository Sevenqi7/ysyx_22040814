import chisel3._
import chisel3.util._
import BType._

class BPU extends RawModule{
    val io = (new Bundle{
        val pc   = Input(UInt(64.W))
        val inst = Input(UInt(32.W))
        val is_branch = Output(Bool())  
        val target_pc = Output(UInt(64.W))
    })

    val opcode = inst(6, 0)
    val immB = Wire(UInt(64.W)) 
    val immJ = Wire(UInt(64.W))
    val immI = Wire(UInt(64.W))

    immJ := SEXT(inst(30, 21) | (inst(20) << 10) | (inst(19, 12) << 11) | (inst(31) << 19), 20)
    immB := SEXT((inst(31) << 11) | (inst(30, 25) << 4) | inst(11, 8) | (inst(7 ,7) << 10), 12)
    immI := SEXT(inst(31, 20), 12)

    val B_Type = (opcode === "b1100011".U)
    val J_Type = (opcode === "b1101111".U)
    io.is_branch := B_Type | J_Type | JALR

    io.target_pc := MuxCase(io.pc+4.U, Seq(
        (B_Type, pc + immB * 2.U),
        (J_Type, pc + immJ * 2.U)
    ))
}