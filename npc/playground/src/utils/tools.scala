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


    //connect lhs to rhs through registers with a given reset and stall in Module
    def regConnectWithStall(lhs :Data, rhs: Data, stall: Bool): Unit = {
        val rhsReg = RegInit(chiselTypeOf(rhs), resetVal)
            when(!stall){
                rhsReg := rhs
            }
            lhs := rhsReg        
    }

}

class CacheLine(tagWidth: Int, dataWidth: Int) extends Bundle{
    val tag  = UInt(tagWidth.W)
    val data = UInt(dataWidth.W)
    val valid = Bool()
}

class MyReadyValidIO extends Bundle{
    val ready = Input(Bool())
    val valid = Output(Bool())
}

class LIFO[T <: Data](gen: T, depth: Int) extends Module{
    val io = IO(new Bundle{
        val push = Input(gen)
        val pushEn = Input(Bool())
        val pop = Output(gen)
        val popEn = Input(Bool())
    })

    val foo   = Wire(gen)
    foo := 0.U.asTypeOf(gen)
    val stack = RegInit(VecInit.fill(depth)(foo))
    val sptr  = RegInit(0.U(log2Ceil(depth).W))
    val sb    = RegInit(0.U(log2Ceil(depth).W))

    when(io.pushEn & !io.popEn){
        stack(sptr) := io.push
        sptr        := Mux(sptr === (depth-1).U, 0.U, sptr+1.U)
        sb          := sptr
    }.elsewhen(!io.pushEn && io.popEn){
        sptr        := Mux(sptr === 0.U, (depth-1).U, sptr-1.U)
        sb          := sptr
    }      

    io.pop := Mux(io.popEn, stack(sb), 0.U)
}