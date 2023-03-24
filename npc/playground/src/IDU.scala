import chisel3._
import chisel3.util._
import InstType._
import FuSource._
import java.awt.font.OpenType

class IDU extends Module{
    val io = IO(new Bundle{
        val IF_Inst = Input(UInt(32.W))
        val IF_pc = Input(UInt(64.W))
        val ID_npc = Output(UInt(64.W))
        
        val ID_ALU_Data1 = Output(UInt(64.W))
        val ID_ALU_Data2 = Output(UInt(64.W))
        val ID_FuType = Output(UInt(1.W))
        val ID_optype = Output(UInt(5.W))

        val ID_Rs1Data = Output(UInt(64.W))
        val ID_Rs2Data = Output(UInt(64.W))
        val ID_RegWriteID = Output(UInt(5.W))
        val ID_RegWriteEn = Output(UInt(1.W))
        val ID_MemWriteEn = Output(UInt(1.W))
        
        val EX_RegWriteData = Input(UInt(64.W))
        val EX_RegWriteID = Input(UInt(5.W))
        val EX_RegWriteEn = Input(UInt(1.W))
        
        //For NPCTRAP
        val ID_GPR =Output(Vec(32, UInt(64.W)))
        val ID_unknown_inst = Output(UInt(1.W))
    })

    //Decode
    val InstInfo = ListLookup(io.IF_Inst, List(0.U, 0.U, 0.U, 0.U, 0.U), RV64IInstr.table)
    val instType = Wire(UInt(3.W))
    val opType   = Wire(UInt(5.W))
    
    opType          := InstInfo(4)
    instType        := InstInfo(0)
    
    io.ID_optype    := opType
    io.ID_unknown_inst := InstInfo(0) === 0.U
    io.ID_FuType    := InstInfo(1)

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

    
    //GPR
    val GPR = RegInit(VecInit(Seq.fill(32)(0.U(64.W))))
    val rs1 = Wire(UInt(5.W))
    val rs2 = Wire(UInt(5.W))
    val rd  = Wire(UInt(5.W))
    
    val rs1_data = Wire(UInt(64.W))
    val rs2_data = Wire(UInt(64.W))
    
    rd := io.IF_Inst(11, 7)
    rs1 := io.IF_Inst(19, 15)
    rs2 := io.IF_Inst(24, 20)
    rs1_data := Mux(rs1 === 0.U, 0.U, GPR(rs1))
    rs2_data := Mux(rs2 === 0.U, 0.U, GPR(rs2))

    io.ID_Rs1Data := rs1_data
    io.ID_Rs2Data := rs2_data
    
    when(io.EX_RegWriteEn.asBool() && io.EX_RegWriteID =/= 0.U)
    {
        GPR(io.EX_RegWriteID) := io.EX_RegWriteData
    }

    io.ID_GPR := GPR
    
    //Analyse the operation
    val src1 = Wire(UInt(3.W))
    val src2 = Wire(UInt(3.W))
    val imm  = Wire(UInt(64.W))
    
    src1 := InstInfo(2)
    src2 := InstInfo(3)
    
    
    imm := MuxCase(0.U, Seq(
        (instType === TYPE_I, immI),
        (instType === TYPE_B, immB),
        (instType === TYPE_U, immU),
        (instType === TYPE_S, immS)
        ))
        
    io.ID_ALU_Data1 := MuxCase(0.U, Seq(
        (src1 === ZERO, 0.U     ),
        (src1 === PC  , io.IF_pc),
        (src1 === RS1 , rs1_data),
        (src1 === NPC , io.IF_pc+4.U)
    ))
            
    io.ID_ALU_Data2 := MuxCase(0.U, Seq(
        (src2 === ZERO  , 0.U      ),
        (src2 === PC    , io.IF_pc ),
        (src2 === RS2   , rs2_data ),
        (src2 === IMM   , imm      ),
        (src2 === SHAMT , shamt    )
        ))
                
        io.ID_RegWriteID := rd
        io.ID_RegWriteEn := (instType === TYPE_R) || (instType === TYPE_I) || (instType === TYPE_U) || (instType === TYPE_J)
        io.ID_MemWriteEn := (instType === TYPE_S)
        
    //NPC
    val BJ_flag = Wire(Bool())
    BJ_flag := 0.B
    switch(opType){
        is (BType.BEQ)  {BJ_flag := rs1_data === rs2_data                }
        is (BType.BNE)  {BJ_flag := rs1_data =/= rs2_data                }
        is (BType.BLT)  {BJ_flag := rs1_data.asSInt < rs2_data.asSInt    }
        is (BType.BGE)  {BJ_flag := rs1_data.asSInt >= rs2_data.asSInt   }
        is (BType.BLTU) {BJ_flag := rs1_data < rs2_data                  }
        is (BType.BGEU) {BJ_flag := rs1_data.asSInt >= rs2_data.asSInt   }
    }

    val pcplus4 = Wire(UInt(32.W))
    pcplus4 := io.IF_pc + 4.U
    io.ID_npc := MuxCase(pcplus4, Seq(
        (instType === TYPE_J, io.IF_pc + immJ * 2.U),
        (instType === TYPE_B  &&  BJ_flag     , io.IF_pc + immB * 2.U),
        (instType === TYPE_I  &&  src1 === NPC, rs1_data + immI)
    ))
}
            
            
object RV64IInstr{
                // Special insts
    def EBREAK  = BitPat("b0000000 00001 00000 000 00000 11100 11")

    //U Type
    def AUIPC   = BitPat("b??????? ????? ????? ??? ????? 00101 11")
    def LUI     = BitPat("b??????? ????? ????? ??? ????? 01101 11")

    //I Type
    def ADDI    = BitPat("b??????? ????? ????? 000 ????? 00100 11")
    def SLLI    = BitPat("b000000? ????? ????? 001 ????? 00100 11")
    def SRLI    = BitPat("b000000? ????? ????? 101 ????? 00100 11")
    def SRAI    = BitPat("b010000? ????? ????? 101 ????? 00100 11")
    def JALR    = BitPat("b??????? ????? ????? 000 ????? 11001 11")
    def ORI     = BitPat("b??????? ????? ????? 110 ????? 00100 11")
    def SLTI    = BitPat("b??????? ????? ????? 010 ????? 00100 11")
    def SLTIU   = BitPat("b??????? ????? ????? 011 ????? 00100 11")
    def LB      = BitPat("b??????? ????? ????? 000 ????? 00000 11")
    def LH      = BitPat("b??????? ????? ????? 001 ????? 00000 11")
    def LW      = BitPat("b??????? ????? ????? 010 ????? 00000 11")
    def LD      = BitPat("b??????? ????? ????? 011 ????? 00000 11")
    def LWU     = BitPat("b??????? ????? ????? 110 ????? 00000 11")
    def LHU     = BitPat("b??????? ????? ????? 101 ????? 00000 11")
    def LBU     = BitPat("b??????? ????? ????? 100 ????? 00000 11")

    def ADDIW   = BitPat("b??????? ????? ????? 000 ????? 00110 11")
    def SLLIW   = BitPat("b0000000 ????? ????? 001 ????? 00110 11")
    def SRLIW   = BitPat("b0000000 ????? ????? 101 ????? 00110 11")
    def SRAIW   = BitPat("b0100000 ????? ????? 101 ????? 00110 11")
    def JAL     = BitPat("b??????? ????? ????? ??? ????? 11011 11")
    
    //J Type

    //R Type
    def ADD       = BitPat("b0000000 ????? ????? 000 ????? 01100 11")
    def SLL       = BitPat("b0000000 ????? ????? 001 ????? 01100 11")
    def SUB       = BitPat("b0100000 ????? ????? 000 ????? 01100 11")
    def XOR       = BitPat("b0000000 ????? ????? 100 ????? 01100 11")
    def SLT       = BitPat("b0000000 ????? ????? 010 ????? 01100 11")
    def SLTU      = BitPat("b0000000 ????? ????? 011 ????? 01100 11")

    def OR        = BitPat("b0000000 ????? ????? 110 ????? 01100 11")
    def SLLW      = BitPat("b0000000 ????? ????? 001 ????? 01110 11")
    def SRLW      = BitPat("b0000000 ????? ????? 101 ????? 01110 11")
    def SRAW      = BitPat("b0100000 ????? ????? 101 ????? 01110 11")


    // def SRAW    = BitPat("b0100000_?????_?????_101_?????_0111011")
    def ADDW      = BitPat("b0000000 ????? ????? 000 ????? 0111011")
    def SUBW      = BitPat("b0100000 ????? ????? 000 ????? 0111011")
    //S Type
    def SD         = BitPat("b??????? ????? ????? 011 ????? 01000 11")
    def SW         = BitPat("b??????? ????? ????? 010 ????? 01000 11")
    def SH         = BitPat("b??????? ????? ????? 001 ????? 01000 11")
    def SB         = BitPat("b??????? ????? ????? 000 ????? 01000 11")

    //B Type
    def BEQ        = BitPat("b??????? ????? ????? 000 ????? 11000 11")
    def BNE        = BitPat("b??????? ????? ????? 001 ????? 11000 11")
    def BLT        = BitPat("b??????? ????? ????? 100 ????? 11000 11")
    def BLTU       = BitPat("b??????? ????? ????? 110 ????? 11000 11")
    def BGEU       = BitPat("b??????? ????? ????? 111 ????? 11000 11")
    def BGE        = BitPat("b??????? ????? ????? 101 ????? 11000 11")

    val table = Array(

        // Special insts
        EBREAK         -> List(TYPE_N, FuType.alu, ZERO, ZERO, OpType.OP_PLUS),

        //U Type
        AUIPC          -> List(TYPE_U, FuType.alu, PC  , IMM , OpType.OP_PLUS),
        LUI            -> List(TYPE_U, FuType.alu, ZERO, IMM , OpType.OP_PLUS),

        //I Type
        ADDI           -> List(TYPE_I, FuType.alu, RS1 , IMM , OpType.OP_PLUS),
        SLLI           -> List(TYPE_I, FuType.alu, RS1 , IMM , OpType.OP_SLL ),
        SRLI           -> List(TYPE_I, FuType.alu, RS1 , IMM , OpType.OP_SRL ),
        SRAI           -> List(TYPE_I, FuType.alu, RS1 , IMM , OpType.OP_SRA ),

        JALR           -> List(TYPE_I, FuType.alu, NPC , ZERO, OpType.OP_PLUS),
        ORI            -> List(TYPE_I, FuType.alu, RS1 , IMM , OpType.OP_OR  ),
        SLTI           -> List(TYPE_I, FuType.alu, RS1 , IMM , OpType.OP_SLT ),
        SLTIU          -> List(TYPE_I, FuType.alu, RS1 , IMM , OpType.OP_SLTU),
        ADDIW          -> List(TYPE_I, FuType.alu, RS1 , IMM , OpType.OP_ADDW),
        SLLIW          -> List(TYPE_I, FuType.alu, RS1 , SHAMT,OpType.OP_SLLW),
        SRLIW          -> List(TYPE_I, FuType.alu, RS1 , SHAMT,OpType.OP_SRLW),
        SRAIW          -> List(TYPE_I, FuType.alu, RS1 , SHAMT,OpType.OP_SRAW),
        LB             -> List(TYPE_I, FuType.lsu, RS1 , IMM , LSUOpType.lb  ),
        LH             -> List(TYPE_I, FuType.lsu, RS1 , IMM , LSUOpType.lh  ),
        LW             -> List(TYPE_I, FuType.lsu, RS1 , IMM , LSUOpType.lw  ),
        LD             -> List(TYPE_I, FuType.lsu, RS1 , IMM , LSUOpType.ld  ),
        LBU            -> List(TYPE_I, FuType.lsu, RS1 , IMM , LSUOpType.lbu ),
        LHU            -> List(TYPE_I, FuType.lsu, RS1 , IMM , LSUOpType.lhu ),
        LWU            -> List(TYPE_I, FuType.lsu, RS1 , IMM , LSUOpType.lwu ),

        //S Type
        SD             -> List(TYPE_S, FuType.lsu, RS1 , IMM , LSUOpType.sd  ),
        SW             -> List(TYPE_S, FuType.lsu, RS1 , IMM , LSUOpType.sw  ),
        SH             -> List(TYPE_S, FuType.lsu, RS1 , IMM , LSUOpType.sh  ),
        SB             -> List(TYPE_S, FuType.lsu, RS1 , IMM , LSUOpType.sb  ),
        
        //R Type
        ADD            -> List(TYPE_R, FuType.alu, RS1 , RS2 , OpType.OP_PLUS),
        SLL            -> List(TYPE_R, FuType.alu, RS1 , SHAMT,OpType.OP_SLL ),
        SUB            -> List(TYPE_R, FuType.alu, RS1 , RS2 , OpType.OP_SUB ),
        OR             -> List(TYPE_R, FuType.alu, RS1 , RS2 , OpType.OP_OR  ),
        SLT            -> List(TYPE_R, FuType.alu, RS1 , RS2 , OpType.OP_SLT ),
        SLTU           -> List(TYPE_R, FuType.alu, RS1 , RS2 , OpType.OP_SLTU),
        ADDW           -> List(TYPE_R, FuType.alu, RS1 , RS2 , OpType.OP_ADDW),
        SUBW           -> List(TYPE_R, FuType.alu, RS1 , RS2 , OpType.OP_SUBW),
        SLLW           -> List(TYPE_R, FuType.alu, RS1 , RS2 , OpType.OP_SLLW),
        SRLW           -> List(TYPE_R, FuType.alu, RS1 , RS2 , OpType.OP_SRLW),
        SRAW           -> List(TYPE_R, FuType.alu, RS1 , RS2 , OpType.OP_SRAW),
        
        //J Type
        JAL            -> List(TYPE_J, FuType.alu, NPC, ZERO , OpType.OP_PLUS),
        
        //B Type
        BEQ            -> List(TYPE_B, FuType.alu, ZERO , ZERO , BType.BEQ   ),
        BNE            -> List(TYPE_B, FuType.alu, ZERO , ZERO , BType.BNE   ),
        BLT            -> List(TYPE_B, FuType.alu, ZERO , ZERO , BType.BLT   ),
        BLTU           -> List(TYPE_B, FuType.alu, ZERO , ZERO , BType.BLTU  ),
        BGE            -> List(TYPE_B, FuType.alu, ZERO , ZERO , BType.BGE   ),
        BGEU           -> List(TYPE_B, FuType.alu, ZERO , ZERO , BType.BGEU  )
        )
    }