import chisel3._

object OpType{
    val OP_PLUS = 1.U
    val OP_SUB = 2.U
    val OP_JAL = 3.U
    val OP_AND = 4.U
    val OP_OR = 5.U
    val OP_XOR = 6.U
    val OP_SLL = 7.U
    val NONE = 12.U
}

object LSUOpType{
    val ld = 8.U
    val lw = 4.U
    val lwu = 4.U
    val sd = 8.U
    val sw = 4.U
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
    val SHAMT = 5.U
    val NPC  = 6.U
    val S_ADDR = 7.U
}