import chisel3._
import chisel3.util._
import RV64IInstr._

import ThaliaUtils.util._
import ThaliaUtils.util.uintToBitPat

class ThaliaDecodeUnitIO extends ThaliaBundle {
  val instr = UInt(32.W)
  val pc = UInt(32.W)
}

class ThaliaDecodeUnit extends ThaliaModule {
  val io = IO {new Bundle{
    
  }}

  val decode_table = ALUOpDecoder.table ++ LSUOpDecoder.table
}

abstract trait DecodeConstants {
  // This X should be used only in 1-bit signal. Otherwise, use BitPat("b???") to align with the width of UInt.
  def X = BitPat("b?")
  def N = BitPat("b0")
  def Y = BitPat("b1")

  def decodeDefault: List[BitPat] =
    List(
      FuType.INV,   //    0: fuType
      SrcType.INV,  //    1: srcType(0)
      SrcType.INV,  //    2: srcTYpe(1)
      FuOpType.INV, //    3: fuOpType
      N,          //    4: rfWen
      N,          //    5: flush pipeline
      N           //    6: selImm
    ) // Use SelImm to indicate invalid instr

  val table: Array[(BitPat, List[BitPat])]
}

abstract class Imm(val len: Int) extends Bundle {
  def toImm32(minBits: UInt): UInt = do_toImm32(minBits(len - 1, 0))
  def do_toImm32(minBits: UInt): UInt
  def minBitsFromInstr(instr: UInt): UInt
}

case class Imm_I() extends Imm(12) {
  override def do_toImm32(minBits: UInt): UInt = SEXT(minBits(len - 1, 0), 32)

  override def minBitsFromInstr(instr: UInt): UInt =
    Cat(instr(31, 20))
}

case class Imm_S() extends Imm(12) {
  override def do_toImm32(minBits: UInt): UInt = SEXT(minBits, 32)

  override def minBitsFromInstr(instr: UInt): UInt =
    Cat(instr(31, 25), instr(11, 7))
}

case class Imm_B() extends Imm(12) {
  override def do_toImm32(minBits: UInt): UInt = SEXT(Cat(minBits, 0.U(1.W)), 32)

  override def minBitsFromInstr(instr: UInt): UInt =
    Cat(instr(31), instr(7), instr(30, 25), instr(11, 8))
}

case class Imm_U() extends Imm(20){
  override def do_toImm32(minBits: UInt): UInt = Cat(minBits(len - 1, 0), 0.U(12.W))

  override def minBitsFromInstr(instr: UInt): UInt = {
    instr(31, 12)
  }
}

case class Imm_J() extends Imm(20){
  override def do_toImm32(minBits: UInt): UInt = SEXT(Cat(minBits, 0.U(1.W)), 32)

  override def minBitsFromInstr(instr: UInt): UInt = {
    Cat(instr(31), instr(19, 12), instr(20), instr(30, 25), instr(24, 21))
  }
}

object ImmSel {
  def IMM_U  = "b000".U
  def IMM_S  = "b001".U
  def IMM_I  = "b010".U
  def IMM_J  = "b011".U
  def IMM_B  = "b101".U
  def DC     = BitPat("b???")
  
  def INV     = BitPat("b???")
  def apply() = UInt(3.W)
}

object ImmUnion {
  val I = Imm_I()
  val S = Imm_S()
  val B = Imm_B()
  val U = Imm_U()
  val J = Imm_J()
  val imms = Seq(I, S, B, U, J)
  val maxLen = imms.maxBy(_.len).len
  val immSelMap = Seq(
    ImmSel.IMM_I,
    ImmSel.IMM_S,
    ImmSel.IMM_B,
    ImmSel.IMM_U,
    ImmSel.IMM_J,
  ).zip(imms)
}


object SrcType {
  def reg  = "b00".U
  def pc   = "b01".U
  def imm  = "b01".U
  def csr  = "b10".U
  def zero = "b00".U

  def DC   = imm // Don't Care
  def INV  = BitPat("b??")

  def isReg(srcType: UInt)      = srcType === reg
  def isPc(srcType: UInt)       = srcType === pc
  def isImm(srcType: UInt)      = srcType === imm
  def isCsr(srcType: UInt)      = srcType(1)
  def isPcOrImm(srcType: UInt)  = srcType(0)
  def isRegOrCsr(srcType: UInt) = !srcType(0)

  def apply() = UInt(2.W)
}

object FuType {
  def FuNum = 6

  def alu = "b0000".U
  def ldu = "b0001".U
  def stu = "b0010".U
  def csr = "b0011".U
  def jmp = "b0100".U
  def INV = BitPat("b????")

  def isLoad(fuType: UInt)   = fuType === ldu
  def isStore(fuType: UInt)  = fuType === stu
  def isMemExu(fuType: UInt) = fuType === isLoad(fuType) || isStore(fuType)

  def apply() = UInt((log2Ceil(FuNum)).W)
}

object ALUOpType {
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
  val OP_BEQ   = 11.U
  val OP_BNE   = 12.U
  val OP_BLT   = 13.U
  val OP_BLTU  = 14.U
  val OP_BGE   = 15.U
  val OP_BGEU  = 16.U
  val OP_MUL   = 17.U
  val OP_DIV   = 18.U
  val OP_DIVU  = 19.U
  val OP_REM   = 20.U
  val OP_REMU  = 21.U
  val OP_ADDW  = 22.U
  val OP_SUBW  = 23.U
  val OP_SLLW  = 24.U
  val OP_SRAW  = 25.U
  val OP_SRLW  = 26.U
  val OP_XORW  = 27.U
  val OP_ORW   = 28.U
  val OP_ANDW  = 29.U
  val OP_MULW  = 30.U
  val OP_DIVW  = 31.U
  val OP_DIVUW = 32.U
  val OP_REMW  = 33.U
  val OP_REMUW = 34.U
  val OP_ECALL = 35.U
  val OP_MRET  = 36.U
  val OP_NONE  = 37.U

  def apply() = UInt(log2Ceil(OpNum).W)
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

object FuOpType {
  def INV = BitPat("b????")
}

object JumpOpType {
  def jal               = "b00".U
  def jalr              = "b01".U
  def auipc             = "b10".U
  def isJalr(op: UInt)  = op(0)
  def isAuipc(op: UInt) = op(1)
}

object CsrOpType {
  def jmp = "b000".U
}


object RV64IInstr {
  // Special insts
  def EBREAK = BitPat("b0000000 00001 00000 000 00000 11100 11")
  def ECALL  = BitPat("b0000000 00000 00000 000 00000 11100 11")
  def MRET   = BitPat("b0011000 00010 00000 000 00000 11100 11")
  def CSRRS  = BitPat("b??????? ????? ????? 010 ????? 11100 11")
  def CSRRW  = BitPat("b??????? ????? ????? 001 ????? 11100 11")

  // U Type
  def AUIPC = BitPat("b??????? ????? ????? ??? ????? 00101 11")
  def LUI   = BitPat("b??????? ????? ????? ??? ????? 01101 11")

  // I Type
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

  // R Type
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

  // S Type
  def SD = BitPat("b??????? ????? ????? 011 ????? 01000 11")
  def SW = BitPat("b??????? ????? ????? 010 ????? 01000 11")
  def SH = BitPat("b??????? ????? ????? 001 ????? 01000 11")
  def SB = BitPat("b??????? ????? ????? 000 ????? 01000 11")

  // B Type
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
    EBREAK -> List(FuType.alu, SrcType.INV, SrcType.INV, ALUOpType.OP_PLUS, N, Y, ImmSel.IMM_I),
    ECALL  -> List(FuType.alu, SrcType.pc,   SrcType.csr, ALUOpType.OP_ECALL, N, Y, ImmSel.IMM_I),
    CSRRS  -> List(FuType.alu, SrcType.reg,  SrcType.csr, ALUOpType.OP_OR   , Y, N, ImmSel.IMM_I),
    CSRRW  -> List(FuType.alu, SrcType.reg,  SrcType.csr, ALUOpType.OP_NONE , Y, N, ImmSel.IMM_I),
    MRET   -> List(FuType.alu, SrcType.zero, SrcType.csr, ALUOpType.OP_MRET , N, N, ImmSel.IMM_I),
    // U Type
    AUIPC  -> List(FuType.alu, SrcType.pc, SrcType.imm,   ALUOpType.OP_PLUS, N, N, ImmSel.IMM_U),
    LUI    -> List(FuType.alu, SrcType.zero, SrcType.imm, ALUOpType.OP_PLUS, Y, N, ImmSel.IMM_U),
    // I Type
    ADDI   -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_PLUS, Y, N, ImmSel.IMM_I),
    SLLI   -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_SLL , Y, N, ImmSel.IMM_I),
    SRLI   -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_SRL , Y, N, ImmSel.IMM_I),
    SRAI   -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_SRA , Y, N, ImmSel.IMM_I),
    JALR   -> List(FuType.alu, SrcType.pc, SrcType.zero, JumpOpType.jalr  , Y, N, ImmSel.IMM_I),
    XORI   -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_XOR , Y, N, ImmSel.IMM_I),
    ORI    -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_OR  , Y, N, ImmSel.IMM_I),
    ANDI   -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_AND , Y, N, ImmSel.IMM_I),
    SLTI   -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_SLT , Y, N, ImmSel.IMM_I),
    SLTIU  -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_SLTU, Y, N, ImmSel.IMM_I),
    ADDIW  -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_ADDW, Y, N, ImmSel.IMM_I),
    SLLIW  -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_SLLW, Y, N, ImmSel.IMM_I),
    SRLIW  -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_SRLW, Y, N, ImmSel.IMM_I),
    SRAIW  -> List(FuType.alu, SrcType.reg, SrcType.imm, ALUOpType.OP_SRAW, Y, N, ImmSel.IMM_I),
    // R Type
    ADD    -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_PLUS , Y, N, ImmSel.DC),
    SLL    -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_SLL  , Y, N, ImmSel.DC),
    SUB    -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_SUB  , Y, N, ImmSel.DC),
    XOR    -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_XOR  , Y, N, ImmSel.DC),
    OR     -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_OR   , Y, N, ImmSel.DC),
    AND    -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_AND  , Y, N, ImmSel.DC),
    SLT    -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_SLT  , Y, N, ImmSel.DC),
    SLTU   -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_SLTU , Y, N, ImmSel.DC),
    MUL    -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_MUL  , Y, N, ImmSel.DC),
    DIV    -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_DIV  , Y, N, ImmSel.DC),
    DIVU   -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_DIVU , Y, N, ImmSel.DC),
    REM    -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_REM  , Y, N, ImmSel.DC),
    REMU   -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_REMU , Y, N, ImmSel.DC),
    ADDW   -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_ADDW , Y, N, ImmSel.DC),
    SUBW   -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_SUBW , Y, N, ImmSel.DC),
    SLLW   -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_SLLW , Y, N, ImmSel.DC),
    SRLW   -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_SRLW , Y, N, ImmSel.DC),
    SRAW   -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_SRAW , Y, N, ImmSel.DC),
    MULW   -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_MULW , Y, N, ImmSel.DC),
    DIVW   -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_DIVW , Y, N, ImmSel.DC),
    DIVUW  -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_DIVUW, Y, N, ImmSel.DC),
    REMW   -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_REMW , Y, N, ImmSel.DC),
    REMUW  -> List(FuType.alu, SrcType.reg, SrcType.reg, ALUOpType.OP_REMUW, Y, N, ImmSel.DC),
    // J Type
    JAL    -> List(FuType.alu, SrcType.pc, SrcType.zero, JumpOpType.jal    , Y, N, ImmSel.IMM_J ),
    // B Type
    BEQ    -> List(FuType.alu, SrcType.pc, SrcType.imm, ALUOpType.OP_BEQ , N, N, ImmSel.IMM_B),
    BNE    -> List(FuType.alu, SrcType.pc, SrcType.imm, ALUOpType.OP_BNE , N, N, ImmSel.IMM_B),
    BLT    -> List(FuType.alu, SrcType.pc, SrcType.imm, ALUOpType.OP_BLT , N, N, ImmSel.IMM_B),
    BLTU   -> List(FuType.alu, SrcType.pc, SrcType.imm, ALUOpType.OP_BLTU, N, N, ImmSel.IMM_B),
    BGE    -> List(FuType.alu, SrcType.pc, SrcType.imm, ALUOpType.OP_BGE , N, N, ImmSel.IMM_B),
    BGEU   -> List(FuType.alu, SrcType.pc, SrcType.imm, ALUOpType.OP_BGEU, N, N, ImmSel.IMM_B)
  )
}

object LSUOpDecoder extends DecodeConstants {
  val table: Array[(BitPat, List[BitPat])] = Array(
    LB  -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lb , Y, N, ImmSel.IMM_S),
    LH  -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lh , Y, N, ImmSel.IMM_S),
    LW  -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lw , Y, N, ImmSel.IMM_S),
    LD  -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.ld , Y, N, ImmSel.IMM_S),
    LBU -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lbu, Y, N, ImmSel.IMM_S),
    LHU -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lhu, Y, N, ImmSel.IMM_S),
    LWU -> List(FuType.ldu, SrcType.reg, SrcType.imm, LSUOpType.lwu, Y, N, ImmSel.IMM_S),
    // S Type
    SD  -> List(FuType.stu, SrcType.reg, SrcType.imm, LSUOpType.sd, Y, N, ImmSel.IMM_S),
    SW  -> List(FuType.stu, SrcType.reg, SrcType.imm, LSUOpType.sw, Y, N, ImmSel.IMM_S),
    SH  -> List(FuType.stu, SrcType.reg, SrcType.imm, LSUOpType.sh, Y, N, ImmSel.IMM_S),
    SB  -> List(FuType.stu, SrcType.reg, SrcType.imm, LSUOpType.sb, Y, N, ImmSel.IMM_S)
  )
}
