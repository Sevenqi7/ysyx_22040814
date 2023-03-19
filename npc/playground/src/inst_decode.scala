import chisel3._
import chisel3.util._
import OpType._
import InstType._

class InstDecoder extends RawModule{
    val io = IO(new Bundle{
        val inst = Input(UInt(31.W))
        val instType = Output(UInt(3.W))
        val opType = Output(UInt(3.W))
    })

    val funct7 = Wire(UInt(7.W))
    val funct3 = Wire(UInt(3.W))
    val opcode = Wire(UInt(6.W))

    funct7 := io.inst(31, 25)
    funct3 := io.inst(14, 11)
    opcode := io.inst(5, 0)

    io.instType := MuxCase(0.U, Seq(
        (opcode === "b0010011".U || opcode === "b0000011".U || opcode === "b1100111".U, TYPE_I),
        (opcode === "b0110011".U || opcode === "b0111011".U, TYPE_R),
        (opcode === "b0010111".U || opcode === "b0110111".U, TYPE_U),
        (opcode === "b0100011".U, TYPE_S),
        (opcode === "b1101111".U, TYPE_J),
        (opcode === "b1100011".U, TYPE_B)
    ))

    //R-TYPE
    val add = funct7 === "b0000000".U && opcode === "b0110011".U
    val sub = funct7 === "b0100000".U && opcode === "b0110011".U
    

    //I-TYPE
    val addi = opcode === "b0010011".U

    io.opType := MuxCase(0.U, Seq(
        (add || addi, OP_PLUS),
        (sub, OP_SUB)
    ))
}