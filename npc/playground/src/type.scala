import chisel3._

object OpType{
    val OP_PLUS = 1.U
    val OP_SUB = 2.U
    val OP_JAL = 3.U
    val AUIPC = 4.U
    val NONE = 5.U
}

object LSUOpType{
    val ld = 4.U
    val lw = 2.U
    val lwu = 2.U
    val sd = 4.U
    val sw = 2.U
}

object FuType{
    val alu = 0.U
    val lsu = 1.U
}

object InstType{
    val TYPE_I = 1.U(3.W)
    val TYPE_R = 2.U(3.W)
    val TYPE_U = 3.U(3.W)
    val TYPE_S = 4.U(3.W)
    val TYPE_J = 5.U(3.W)
    val TYPE_B = 6.U(3.W)
    val TYPE_N = 7.U(3.W)
}

object FuSource{
    val ZERO = 0.U
    val PC   = 1.U
    val RS1  = 2.U
    val RS2  = 3.U
    val IMM  = 4.U
    val NPC  = 5.U
    val S_ADDR = 6.U
}