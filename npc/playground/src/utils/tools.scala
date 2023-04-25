import chisel3._
import chisel3.util._
import chisel3.util.experimental

object utils {
    
    def SEXT(x : UInt, len : Int) :UInt = {
        val ret = Wire(UInt(64.W))
        ret := Cat(Fill(64-len, x(len-1)), x(len-1, 0))
        ret
    }

    //connect lhs to rhs through registers with implict reset in Module
    def regConnect(lhs: Data, rhs: Data, resetVal: UInt =0.U): Unit = {
        val rhsReg = RegInit(chiselTypeOf(rhs), resetVal)
        rhsReg := rhs
        lhs := rhsReg
    }

    //connect lhs to rhs through registers with a given reset in Module    
    def regConnectWithReset(lhs: Data, rhs: Data, reset: Reset, resetVal: UInt =0.U): Unit = {
        withReset(reset){
            val rhsReg = RegInit(chiselTypeOf(rhs), resetVal)
            rhsReg := rhs
            lhs := rhsReg
        }
    }

    //connect lhs to rhs through registers with a given reset and stall in Module
    def regConnectWithResetAndStall(lhs :Data, rhs: Data, reset: Reset, resetVal: UInt=0.U, stall: Bool): Unit = {
        withReset(reset){
            val rhsReg = RegInit(chiselTypeOf(rhs), resetVal)
            when(!stall)
            {
                rhsReg := rhs
            }
            lhs := rhsReg
        }
    }
}

class MyReadyValidIO extends Bundle{
    val ready = Input(Bool())
    val valid = Output(Bool())
}