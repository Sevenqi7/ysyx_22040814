import chisel3._

object OpType{
    val OP_PLUS = 1.U
    val OP_SUB = 2.U
    val OP_JAL = 3.U
    val LOAD = 10.U
    val AUIPC = 11.U
    val NONE = 12.U
}

object FuType{
    val alu = 1.U(2.W)
    val slu = 2.U(2.W)
    val none = 3.U(2.W)
}

object InstType{
    val TYPE_I = 0.U(3.W)
    val TYPE_R = 1.U(3.W)
    val TYPE_U = 2.U(3.W)
    val TYPE_S = 3.U(3.W)
    val TYPE_J = 4.U(3.W)
    val TYPE_B = 5.U(3.W)
    val TYPE_N = 6.U(3.W)
}

object FuSource{
    val ZERO = 0.U
    val PC   = 1.U
    val RS1  = 2.U
    val RS2  = 3.U
    val IMM  = 4.U
    val NPC  = 5.U
}