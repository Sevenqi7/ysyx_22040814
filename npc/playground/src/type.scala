import chisel3._

object OpType{
    val OP_PLUS = 1.U
    val OP_SUB = 2.U
    val LOAD = 3.U
    val AUIPC = 4.U
}

object FuType{
    val alu = 1.U(2.W)
    val slu = 2.U(2.W)
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