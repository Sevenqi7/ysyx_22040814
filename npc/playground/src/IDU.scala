import chisel3._
import chisel3.util._
import OpType._
import InstType._

object OpType{
    val OP_PLUS = 1.U
    val OP_SUB = 2.U
    val LOAD = 3.U
}

object InstType{
    val TYPE_I = 0.U(3.W)
    val TYPE_R = 1.U(3.W)
    val TYPE_U = 2.U(3.W)
    val TYPE_S = 3.U(3.W)
    val TYPE_J = 4.U(3.W)
    val TYPE_B = 5.U(3.W)
}

class IDU extends Module{
    val io = IO(new Bundle{
        val IF_Inst = Input(UInt(32.W))
        val IF_pc = Input(UInt(64.W))
        val ID_npc = Output(UInt(64.W))
        
        val ID_ALU_Data1 = Output(UInt(64.W))
        val ID_ALU_Data2 = Output(UInt(64.W))
        val ID_optype = Output(UInt(4.W))
        
        val ID_RegWriteID = Output(UInt(5.W))
        val ID_RegWriteEn = Output(UInt(1.W))
        
        val EX_RegWriteData = Input(UInt(64.W))
        val EX_RegWriteID = Input(UInt(5.W))
        val EX_RegWriteEn = Input(UInt(1.W))
        
    })

    //Decode
    val opType = Wire(UInt(3.W))
    val instType = Wire(UInt(3.W))

    val inst_decoder = Module(new InstDecoder)
    inst_decoder.io.inst := io.IF_Inst
    opType := inst_decoder.io.opType
    instType := inst_decoder.io.instType
    io.ID_optype := opType

    //all kinds of imm
    val immI = Wire(UInt(32.W))
    val immU = Wire(UInt(32.W))
    val immJ = Wire(UInt(32.W))
    val immB = Wire(UInt(32.W))
    val immS = Wire(UInt(32.W))
    val shamt = Wire(UInt(6.W))

    immI := Cat(Fill(20, io.IF_Inst(31)), io.IF_Inst(31, 20))
    immU := Cat(Fill(12, io.IF_Inst(31)), io.IF_Inst(31, 12)) << 12
    immS := Cat(Fill(25, io.IF_Inst(31)), io.IF_Inst(31, 25)) << 5 | io.IF_Inst(11, 7)
    immB := Cat(Fill(20, io.IF_Inst(31)), ((io.IF_Inst(31) << 11) | (io.IF_Inst(30, 25) << 4) | io.IF_Inst(11, 8) | (io.IF_Inst(7) << 10)))
    immJ := Cat(Fill(12, io.IF_Inst(31)), (io.IF_Inst(30, 21) | (io.IF_Inst(20) << 10) | (io.IF_Inst(19, 12) << 11) | (io.IF_Inst(31, 31) << 19)))
    shamt := io.IF_Inst(25, 20)

    //NPC
    val pcplus4 = Wire(UInt(32.W))
    pcplus4 := io.IF_pc + 4.U
    io.ID_npc := MuxCase(pcplus4, Seq(
        (instType === TYPE_J, io.IF_pc + immJ * 2.U),
        (instType === TYPE_B, io.IF_pc + immB * 2.U)
    ))

    //GPR
    val GPR = RegInit(VecInit(Seq.fill(32)(0.U(64.W))))
    val rs1 = Wire(UInt(5.W))
    val rs2 = Wire(UInt(5.W))
    val rd = Wire(UInt(5.W))

    val rs1_data = Wire(UInt(64.W))
    val rs2_data = Wire(UInt(64.W))

    rd := io.IF_Inst(11, 7)
    rs1 := io.IF_Inst(19, 15)
    rs2 := io.IF_Inst(24, 20)
    rs1_data := Mux(rs1 === 0, 0, GPR(rs1))
    rs2_data := Mux(rs2 === 0, 0, GPR(rs2))

    when(io.EX_RegWriteEn.asBool())
    {
        GPR(io.EX_RegWriteID) := RegNext(io.EX_RegWriteData)
    }

    //Analyse the operation


    io.ID_ALU_Data1 := MuxCase(0.U, Seq(
        (instType === TYPE_R || instType === TYPE_I || instType === TYPE_S, rs1_data)
    ))

    io.ID_ALU_Data2 := MuxCase(0.U, Seq(
        (instType === TYPE_R || instType === TYPE_S, rs2_data),
        (instType === TYPE_I, immI)
    ))

    io.ID_RegWriteID := rd
    io.ID_RegWriteEn := (instType === TYPE_R) || (instType === TYPE_I) || (instType === TYPE_U) || (instType === TYPE_J)

}