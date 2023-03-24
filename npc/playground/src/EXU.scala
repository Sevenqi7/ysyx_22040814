import chisel3._
import chisel3.util._
import OpType._
import InstType._

class EXU extends Module{
    val io = IO(new Bundle{
        val ID_ALU_Data1 = Input(UInt(64.W))
        val ID_ALU_Data2 = Input(UInt(64.W))
        val ID_Rs1Data   = Input(UInt(64.W))
        val ID_Rs2Data   = Input(UInt(64.W))
        val ID_optype = Input(UInt(5.W))
        val ID_FuType = Input(UInt(1.W))
        val ID_RegWriteEn = Input(UInt(1.W))
        val ID_RegWriteID = Input(UInt(5.W))
        val ID_MemWriteEn = Input(UInt(1.W))
        
        val EX_ALUResult  = Output(UInt(64.W))
        val EX_MemWriteData = Output(UInt(64.W))
        val EX_MemWriteEn = Output(UInt(1.W))
        val EX_LsuType    = Output(UInt(5.W))
        val EX_RegWriteID = Output(UInt(5.W))
        val EX_RegWriteEn = Output(UInt(1.W))
    })

    def SEXT(x : UInt, len : Int) :UInt = {
        val ret = Wire(UInt(64.W))
        ret := Cat(Fill(64-len, x(len-1)), x)
        ret
    }

    //now it is only a single cycle cpu, so directy connect EX_Reg* to ID_Reg*
    io.EX_RegWriteEn := io.ID_RegWriteEn
    io.EX_RegWriteID := io.ID_RegWriteID
    io.EX_MemWriteData := io.ID_Rs2Data
    io.EX_MemWriteEn := io.ID_MemWriteEn
    io.EX_LsuType    := Mux(io.ID_FuType.asBool, io.ID_optype, 0.U)
    val shamt = Wire(UInt(6.W))
    shamt := io.ID_ALU_Data2(5, 0)

    val ALU_Result = Wire(UInt(64.W))
    ALU_Result := MuxCase(0.U, Seq(
        (io.ID_optype === OP_PLUS || io.ID_FuType === FuType.lsu, io.ID_ALU_Data1 + io.ID_ALU_Data2),
        (io.ID_optype === OP_SUB , io.ID_ALU_Data1  -  io.ID_ALU_Data2),
        (io.ID_optype === OP_AND , io.ID_ALU_Data1  &  io.ID_ALU_Data2),
        (io.ID_optype === OP_OR  , io.ID_ALU_Data1  |  io.ID_ALU_Data2),
        (io.ID_optype === OP_XOR , io.ID_ALU_Data1  ^  io.ID_ALU_Data2),
        (io.ID_optype === OP_SLL , io.ID_ALU_Data1 <<  shamt          ),
        (io.ID_optype === OP_SRL , io.ID_ALU_Data1 >>  shamt          ),
        (io.ID_optype === OP_SRA , (io.ID_ALU_Data1.asSInt >> shamt).asUInt),
        (io.ID_optype === OP_SLTU, io.ID_ALU_Data1  <  io.ID_ALU_Data2),
        (io.ID_optype === OP_SLT , io.ID_ALU_Data1.asSInt  <  io.ID_ALU_Data2.asSInt),
        (io.ID_optype === OP_ADDW, SEXT((io.ID_ALU_Data1 + io.ID_ALU_Data2 ), 32)),
        (io.ID_optype === OP_SUBW, SEXT((io.ID_ALU_Data1 - io.ID_ALU_Data2 ), 32)),
        (io.ID_optype === OP_SLLW, SEXT((io.ID_ALU_Data1 << shamt          ), 32)),
        (io.ID_optype === OP_SRLW, SEXT((io.ID_ALU_Data1 << shamt          ), 32)),
        (io.ID_optype === OP_SRAW, SEXT(((io.ID_ALU_Data1.asSInt >> shamt).asUInt), 32))
    ))

    io.EX_ALUResult := ALU_Result
}