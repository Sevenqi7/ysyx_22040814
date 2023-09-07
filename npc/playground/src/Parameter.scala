import chisel3._
import chisel3.util._

trait ThaliaParameters(
    HasBPU: Boolean = false,
    HasICache: Boolean = true,
    HasDCache: Boolean = false,
    AddrBits: Int = 64,
    FetchNr: Int = 2
)

