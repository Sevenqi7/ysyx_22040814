import chisel3._
import chisel3.util._
import OpType._
import InstType._

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
    val InstInfo = ListLookup(io.IF_Inst, List(0.U, 0.U, 0.U), RV64IInstr.table)
    val instType = Wire(UInt(3.W))
    io.ID_optype    := InstInfo(2)
    instType        := InstInfo(0)
    

    //all kinds of imm
    val immI = Wire(UInt(64.W))
    val immU = Wire(UInt(64.W))
    val immJ = Wire(UInt(64.W))
    val immB = Wire(UInt(64.W))
    val immS = Wire(UInt(64.W))
    val shamt = Wire(UInt(6.W))

    immI := Cat(Fill(52, io.IF_Inst(31)), io.IF_Inst(31, 20))
    immU := Cat(Fill(44, io.IF_Inst(31)), io.IF_Inst(31, 12)) << 12
    immS := Cat(Fill(57, io.IF_Inst(31)), io.IF_Inst(31, 25)) << 5 | io.IF_Inst(11, 7)
    immB := Cat(Fill(52, io.IF_Inst(31)), ((io.IF_Inst(31) << 11) | (io.IF_Inst(30, 25) << 4) | io.IF_Inst(11, 8) | (io.IF_Inst(7) << 10)))
    immJ := Cat(Fill(44, io.IF_Inst(31)), (io.IF_Inst(30, 21) | (io.IF_Inst(20) << 10) | (io.IF_Inst(19, 12) << 11) | (io.IF_Inst(31, 31) << 19)))
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
    rs1_data := Mux(rs1 === 0.U, 0.U, GPR(rs1))
    rs2_data := Mux(rs2 === 0.U, 0.U, GPR(rs2))

    when(io.EX_RegWriteEn.asBool())
    {
        GPR(io.EX_RegWriteID) := io.EX_RegWriteData
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


object RV64IInstr{
    // Special insts
    def EBREAK  = BitPat("b0000000 00001 00000 000 00000 11100 11")

    //U Type
    // def AUIPC   = BitPat("??????? ????? ????? ??? ????? 00101 11")
    def ADDI    = BitPat("b??????? ????? ????? 000 ????? 00100 11")

    // def ADDIW   = BitPat("b???????_?????_?????_000_?????_0011011")
    // def SLLIW   = BitPat("b0000000_?????_?????_001_?????_0011011")
    // def SRLIW   = BitPat("b0000000_?????_?????_101_?????_0011011")
    // def SRAIW   = BitPat("b0100000_?????_?????_101_?????_0011011")
    // def SLLW    = BitPat("b0000000_?????_?????_001_?????_0111011")
    // def SRLW    = BitPat("b0000000_?????_?????_101_?????_0111011")
    // def SRAW    = BitPat("b0100000_?????_?????_101_?????_0111011")
    // def ADDW    = BitPat("b0000000_?????_?????_000_?????_0111011")
    // def SUBW    = BitPat("b0100000_?????_?????_000_?????_0111011")
    // def LWU     = BitPat("b???????_?????_?????_110_?????_0000011")
    // def LD      = BitPat("b???????_?????_?????_011_?????_0000011")
    // def SD      = BitPat("b???????_?????_?????_011_?????_0100011")
    val table = Array(

    // Special insts
    EBREAK         -> List(TYPE_N, FuType.slu, OpType.OP_PLUS),

    //U Type
    // AUIPC          -> List(TYPE_U, FuType.alu, OpType.auipc)

    //I Type
    ADDI           -> List(TYPE_I, FuType.alu, OpType.OP_PLUS)
    // ADDIW          -> List(TYPE_I, FuType.alu, OpType.addw),
    // SLLIW          -> List(TYPE_I, FuType.alu, OpType.sllw),
    // SRLIW          -> List(TYPE_I, FuType.alu, OpType.srlw),
    // SRAIW          -> List(TYPE_I, FuType.alu, OpType.sraw),
    // SLLW           -> List(TYPE_R, FuType.alu, OpType.sllw),
    // SRLW           -> List(TYPE_R, FuType.alu, OpType.srlw),
    // SRAW           -> List(TYPE_R, FuType.alu, OpType.sraw),
    // ADDW           -> List(TYPE_R, FuType.alu, OpType.addw),
    // SUBW           -> List(TYPE_R, FuType.alu, OpType.subw)
    // LWU            -> List(TYPE_I, FuType.lsu, LSUOpType.lwu),
    // LD             -> List(TYPE_I, FuType.lsu, LSUOpType.ld ),
    // SD             -> List(InstrS, FuType.lsu, LSUOpType.sd)
    )
}