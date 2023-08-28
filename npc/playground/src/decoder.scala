import chisel3._
import chisel3.utils._

class ThaliaDecodeUnit extends Module{

}

abstract trait DecodeConstants {
  // This X should be used only in 1-bit signal. Otherwise, use BitPat("b???") to align with the width of UInt.
  def X = BitPat("b?")
  def N = BitPat("b0")
  def Y = BitPat("b1")

  def decodeDefault: List[BitPat] = // illegal instruction
    //   srcType(0) srcType(1) srcType(2) fuType    fuOpType    rfWen
    //   |          |          |          |         |           |  fpWen
    //   |          |          |          |         |           |  |  isXSTrap
    //   |          |          |          |         |           |  |  |  noSpecExec
    //   |          |          |          |         |           |  |  |  |  blockBackward
    //   |          |          |          |         |           |  |  |  |  |  flushPipe
    //   |          |          |          |         |           |  |  |  |  |  |  selImm
    //   |          |          |          |         |           |  |  |  |  |  |  |
    List(SrcType.X, SrcType.X, SrcType.X, FuType.X, FuOpType.X, N, N, N, N, N, N, SelImm.INVALID_INSTR) // Use SelImm to indicate invalid instr

  val table: Array[(BitPat, List[BitPat])]
}