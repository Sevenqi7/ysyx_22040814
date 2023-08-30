import chisel3._
import chisel3.utils._

class ThaliaDecodeUnit extends Module {}

abstract trait DecodeConstants {
  // This X should be used only in 1-bit signal. Otherwise, use BitPat("b???") to align with the width of UInt.
  def X = BitPat("b?")
  def N = BitPat("b0")
  def Y = BitPat("b1")

  def decodeDefault: List[BitPat] =
    List(
      FuType.X,   //    0: fuType
      SrcType.X,  //    1: srcType(0)
      SrcType.X,  //    2: srcTYpe(1)
      FuOpType.X, //    3: fuOpType
      N,          //    4: rfWen
      N,          //    5: flush pipeline
      N           //    6: selImm
    )             // Use SelImm to indicate invalid instr

  val table: Array[(BitPat, List[BitPat])]
}

object SrcType {
  def reg  = "b00".U
  def pc   = "b01".U
  def imm  = "b01".U
  def csr  = "b10".U
  def zero = "b00".U

  def DC = imm // Don't Care
  def N  = BitPat("b??")

  def isReg(srcType:      UInt) = srcType === reg
  def isPc(srcType:       UInt) = srcType === pc
  def isImm(srcType:      UInt) = srcType === imm
  def isCsr(srcType:      UInt) = srcType(1)
  def isPcOrImm(srcType:  UInt) = srcType(0)
  def isRegOrCsr(srcType: UInt) = !srcType(0)

  def apply() = UInt(2.W)
}

object FuType {
  def FuNum = 5

  def alu = "b0000".U
  def ldu = "b0001".U
  def stu = "b0010".U
  def csr = "b0011".U
  def INV = "b????".U

  def isLoad(fuType:   UInt) = fuType === ldu
  def isStore(fuType:  UInt) = fuType === stu
  def isMemExu(fuType: UInt) = fuType === isLoad(fuType) || isStore(fuType)

  def apply() = UInt((log2Ceil(FuNum)).W)
}

object OpType {
  def OpNum = 32

  val OP_PLUS  = 0.U
  val OP_SUB   = 1.U
  val OP_JAL   = 2.U
  val OP_AND   = 3.U
  val OP_OR    = 4.U
  val OP_XOR   = 5.U
  val OP_SLL   = 6.U
  val OP_SRL   = 7.U
  val OP_SRA   = 8.U
  val OP_SLT   = 9.U
  val OP_SLTU  = 10.U
  val OP_MUL   = 11.U
  val OP_DIV   = 12.U
  val OP_DIVU  = 13.U
  val OP_REM   = 14.U
  val OP_REMU  = 15.U
  val OP_ADDW  = 16.U
  val OP_SUBW  = 17.U
  val OP_SLLW  = 18.U
  val OP_SRAW  = 19.U
  val OP_SRLW  = 20.U
  val OP_XORW  = 21.U
  val OP_ORW   = 22.U
  val OP_ANDW  = 23.U
  val OP_MULW  = 24.U
  val OP_DIVW  = 25.U
  val OP_DIVUW = 26.U
  val OP_REMW  = 27.U
  val OP_REMUW = 28.U
  val OP_ECALL = 29.U
  val OP_MRET  = 30.U
  val OP_NONE  = 31.U
}

object LSUOpType {
  def lb  = "b0000".U
  def lh  = "b0001".U
  def lw  = "b0010".U
  def ld  = "b0011".U
  def lbu = "b0100".U
  def lhu = "b0101".U
  def lwu = "b0110".U

  def sb = "b1000".U
  def sh = "b1001".U
  def sw = "b1010".U
  def sd = "b1011".U

  def size(op: UInt) = op(1, 0)
}

object JumpOpType {
  def jal   = "b00".U
  def jalr  = "b01".U
  def auipc = "b10".U
  def isJalr(op:  UInt) = op(0)
  def isAuipc(op: UInt) = op(1)
}

object ImmSel {
  def IMM_U = "b000".U
  def IMM_S = "b001".U
  def IMM_I = "b010".U
  def IMM_J = "b011".U

  def INV     = BitPat("b???")
  def apply() = UInt(3.W)
}

object RV64IInstr {
  // Special insts
  def EBREAK = BitPat("b0000000 00001 00000 000 00000 11100 11")
  def ECALL  = BitPat("b0000000 00000 00000 000 00000 11100 11")
  def MRET   = BitPat("b0011000 00010 00000 000 00000 11100 11")
  def CSRRS  = BitPat("b??????? ????? ????? 010 ????? 11100 11")
  def CSRRW  = BitPat("b??????? ????? ????? 001 ????? 11100 11")

  //U Type
  def AUIPC = BitPat("b??????? ????? ????? ??? ????? 00101 11")
  def LUI   = BitPat("b??????? ????? ????? ??? ????? 01101 11")

  //I Type
  def ADDI  = BitPat("b??????? ????? ????? 000 ????? 00100 11")
  def SLLI  = BitPat("b000000? ????? ????? 001 ????? 00100 11")
  def SRLI  = BitPat("b000000? ????? ????? 101 ????? 00100 11")
  def SRAI  = BitPat("b010000? ????? ????? 101 ????? 00100 11")
  def JALR  = BitPat("b??????? ????? ????? 000 ????? 11001 11")
  def XORI  = BitPat("b??????? ????? ????? 100 ????? 00100 11")
  def ORI   = BitPat("b??????? ????? ????? 110 ????? 00100 11")
  def ANDI  = BitPat("b??????? ????? ????? 111 ????? 00100 11")
  def SLTI  = BitPat("b??????? ????? ????? 010 ????? 00100 11")
  def SLTIU = BitPat("b??????? ????? ????? 011 ????? 00100 11")
  def LB    = BitPat("b??????? ????? ????? 000 ????? 00000 11")
  def LH    = BitPat("b??????? ????? ????? 001 ????? 00000 11")
  def LW    = BitPat("b??????? ????? ????? 010 ????? 00000 11")
  def LD    = BitPat("b??????? ????? ????? 011 ????? 00000 11")
  def LWU   = BitPat("b??????? ????? ????? 110 ????? 00000 11")
  def LHU   = BitPat("b??????? ????? ????? 101 ????? 00000 11")
  def LBU   = BitPat("b??????? ????? ????? 100 ????? 00000 11")

  def ADDIW = BitPat("b??????? ????? ????? 000 ????? 00110 11")
  def SLLIW = BitPat("b0000000 ????? ????? 001 ????? 00110 11")
  def SRLIW = BitPat("b0000000 ????? ????? 101 ????? 00110 11")
  def SRAIW = BitPat("b0100000 ????? ????? 101 ????? 00110 11")
  def JAL   = BitPat("b??????? ????? ????? ??? ????? 11011 11")

  //R Type
  def ADD  = BitPat("b0000000 ????? ????? 000 ????? 01100 11")
  def SLL  = BitPat("b0000000 ????? ????? 001 ????? 01100 11")
  def XOR  = BitPat("b0000000 ????? ????? 100 ????? 01100 11")
  def OR   = BitPat("b0000000 ????? ????? 110 ????? 01100 11")
  def AND  = BitPat("b0000000 ????? ????? 111 ????? 01100 11")
  def SUB  = BitPat("b0100000 ????? ????? 000 ????? 01100 11")
  def SLT  = BitPat("b0000000 ????? ????? 010 ????? 01100 11")
  def SLTU = BitPat("b0000000 ????? ????? 011 ????? 01100 11")
  def MUL  = BitPat("b0000001 ????? ????? 000 ????? 01100 11")
  def DIV  = BitPat("b0000001 ????? ????? 100 ????? 01100 11")
  def DIVU = BitPat("b0000001 ????? ????? 101 ????? 01100 11")
  def REM  = BitPat("b0000001 ????? ????? 110 ????? 01100 11")
  def REMU = BitPat("b0000001 ????? ????? 111 ????? 01100 11")
  def ADDW = BitPat("b0000000 ????? ????? 000 ????? 01110 11")
  def SUBW = BitPat("b0100000 ????? ????? 000 ????? 01110 11")

  def SLLW  = BitPat("b0000000 ????? ????? 001 ????? 01110 11")
  def SRLW  = BitPat("b0000000 ????? ????? 101 ????? 01110 11")
  def SRAW  = BitPat("b0100000 ????? ????? 101 ????? 01110 11")
  def MULW  = BitPat("b0000001 ????? ????? 000 ????? 01110 11")
  def DIVW  = BitPat("b0000001 ????? ????? 100 ????? 01110 11")
  def DIVUW = BitPat("b0000001 ????? ????? 101 ????? 01110 11")
  def REMW  = BitPat("b0000001 ????? ????? 110 ????? 01110 11")
  def REMUW = BitPat("b0000001 ????? ????? 111 ????? 01110 11")

  //S Type
  def SD = BitPat("b??????? ????? ????? 011 ????? 01000 11")
  def SW = BitPat("b??????? ????? ????? 010 ????? 01000 11")
  def SH = BitPat("b??????? ????? ????? 001 ????? 01000 11")
  def SB = BitPat("b??????? ????? ????? 000 ????? 01000 11")

  //B Type
  def BEQ  = BitPat("b??????? ????? ????? 000 ????? 11000 11")
  def BNE  = BitPat("b??????? ????? ????? 001 ????? 11000 11")
  def BLT  = BitPat("b??????? ????? ????? 100 ????? 11000 11")
  def BLTU = BitPat("b??????? ????? ????? 110 ????? 11000 11")
  def BGEU = BitPat("b??????? ????? ????? 111 ????? 11000 11")
  def BGE  = BitPat("b??????? ????? ????? 101 ????? 11000 11")

}

object ALUOpDecoder extends DecodeConstants {

  val table: Array[(BitPat, List[BitPat])] = Array(
    // Special insts
    EBREAK -> List(FuType.alu, SrcType.X, SrcType.X, OpType.OP_PLUS),
    ECALL  -> List(FuType.alu, SrcType.pc, SrcType.csr, OpType.OP_ECALL),
    CSRRS  -> List(FuType.alu, SrcType.reg, SrcType.csr, OpType.OP_OR),
    CSRRW  -> List(FuType.alu, SrcType.reg, SrcType.csr, OpType.OP_NONE),
    MRET   -> List(FuType.alu, SrcType.zero, SrcType.csr, OpType.OP_MRET),
    //U Type
    AUIPC  -> List(FuType.alu, SrcType.pc, SrcType.imm, OpType.OP_PLUS),
    LUI    -> List(FuType.alu, SrcType.zero, SrcType.imm, OpType.OP_PLUS),
    //I Type
    ADDI   -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_PLUS),
    SLLI   -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_SLL),
    SRLI   -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_SRL),
    SRAI   -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_SRA),
    JALR   -> List(FuType.alu, SrcType.pc, SrcType.zero, JumpOpType.jalr),
    XORI   -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_XOR),
    ORI    -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_OR),
    ANDI   -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_AND),
    SLTI   -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_SLT),
    SLTIU  -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_SLTU),
    ADDIW  -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_ADDW),
    SLLIW  -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_SLLW),
    SRLIW  -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_SRLW),
    SRAIW  -> List(FuType.alu, SrcType.reg, SrcType.imm, OpType.OP_SRAW),
    //R Type
    ADD    -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_PLUS),
    SLL    -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_SLL),
    SUB    -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_SUB),
    XOR    -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_XOR),
    OR     -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_OR),
    AND    -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_AND),
    SLT    -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_SLT),
    SLTU   -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_SLTU),
    MUL    -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_MUL),
    DIV    -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_DIV),
    DIVU   -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_DIVU),
    REM    -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_REM),
    REMU   -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_REMU),
    ADDW   -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_ADDW),
    SUBW   -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_SUBW),
    SLLW   -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_SLLW),
    SRLW   -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_SRLW),
    SRAW   -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_SRAW),
    MULW   -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_MULW),
    DIVW   -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_DIVW),
    DIVUW  -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_DIVUW),
    REMW   -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_REMW),
    REMUW  -> List(FuType.alu, SrcType.reg, SrcType.reg, OpType.OP_REMUW),
    //J Type
    JAL    -> List(FuType.alu, SrcType.pc, SrcType.zero, JumpOpType.jal),
    //B Type
    BEQ    -> List(FuType.alu, SrcType.pc, SrcType.imm, BType.BEQ),
    BNE    -> List(FuType.alu, SrcType.pc, SrcType.imm, BType.BNE),
    BLT    -> List(FuType.alu, SrcType.pc, SrcType.imm, BType.BLT),
    BLTU   -> List(FuType.alu, SrcType.pc, SrcType.imm, BType.BLTU),
    BGE    -> List(FuType.alu, SrcType.pc, SrcType.imm, BType.BGE),
    BGEU   -> List(FuType.alu, SrcType.pc, SrcType.imm, BType.BGEU)
  )
}

object LSUOpType extends DecodeConstants {
  val table: Array[(BitPat, List[BitPat])] = Array(
    LB  -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lb),
    LH  -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lh),
    LW  -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lw),
    LD  -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.ld),
    LBU -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lbu),
    LHU -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lhu),
    LWU -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lwu),
    //S Type
    SD  -> List(FuType.stu, SrcType.reg, SrcType.imm, LSUOpType.sd),
    SW  -> List(FuType.stu, SrcType.reg, SrcType.imm, LSUOpType.sw),
    SH  -> List(FuType.stu, SrcType.reg, SrcType.imm, LSUOpType.sh),
    SB  -> List(FuType.stu, SrcType.reg, SrcType.imm, LSUOpType.sb)
  )
}
