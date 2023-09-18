import chisel3._
import chisel3.util._

trait ThaliaParameters{
    val HasBPU = false
    val HasICache = true
    val HasDCache = false
    val AddrBits = 64
    val FetchNr = 3
    
    val DecodeWidth = 3
    val IssueWidth = 3
}

