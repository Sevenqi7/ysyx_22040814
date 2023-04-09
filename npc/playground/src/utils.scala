import chisel3._
import chisel3.util._

object utils {
    
    def SEXT(x : UInt, len : Int) :UInt = {
        val ret = Wire(UInt(64.W))
        ret := Cat(Fill(64-len, x(len-1)), x(len-1, 0))
        ret
    }

    

    def regConnect(lhs: Data, rhs: Data): Unit = {
        val rhsReg = RegInit(chiselTypeOf(rhs), 0.U)
        // val rhsReg = resetVal match {
        //     case Some(rv) => RegInit(rv, chiselTypeOf(rhs))
        //     case None => Reg(Wire(chiselTypeOf(rhs)))
        // }
        rhsReg := rhs
        lhs := rhsReg
    }

}
