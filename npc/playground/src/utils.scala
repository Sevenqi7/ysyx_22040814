object utils {
    
    def SEXT(x : UInt, len : Int) :UInt = {
        val ret = Wire(UInt(64.W))
        ret := Cat(Fill(64-len, x(len-1)), x(len-1, 0))
        ret
    }

   def RegConnect(lhs: Data, rhs: Data): UInt = {
    val rhsReg = Reg(chiselTypeOf(rhs))
    rhsReg := rhs
    lhs := rhsReg
   } 
}
