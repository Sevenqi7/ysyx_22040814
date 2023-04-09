import chisel3._
import chisel3.util._
import utils._
import OpType._
import InstType._

class EXU extends Module{
    val io = IO(new Bundle{
        val ID_ALU_Data1  =     Input(UInt(64.W))
        val ID_ALU_Data2  =     Input(UInt(64.W))
        val ID_Rs2Data    =     Input(UInt(64.W))
        val ID_Rs1Data    =     Input(UInt(64.W))
        val ID_optype     =     Input(UInt(5.W))
        val ID_FuType     =     Input(UInt(1.W))
        val ID_RegWriteEn =     Input(UInt(1.W))
        val ID_RegWriteID =     Input(UInt(5.W))
        val ID_MemWriteEn =     Input(UInt(1.W))
        val ID_MemReadEn  =     Input(UInt(1.W))
        
        val EX_ALUResult  =     Output(UInt(64.W))
        val EX_MemWriteData =   Output(UInt(64.W))
        val EX_MemWriteEn =     Output(UInt(1.W))
        val EX_MemReadEn  =     Output(UInt(1.W))
        val EX_LsuType    =     Output(UInt(5.W))
        val EX_RegWriteID =     Output(UInt(5.W))
        val EX_RegWriteEn =     Output(UInt(1.W))
    })


    //now it is only a single cycle cpu, so directy connect EX_Reg* to ID_Reg*
    io.EX_RegWriteEn := io.ID_RegWriteEn
    io.EX_RegWriteID := io.ID_RegWriteID
    io.EX_MemWriteData := io.ID_Rs2Data
    io.EX_MemWriteEn := io.ID_MemWriteEn
    io.EX_MemReadEn  := io.ID_MemReadEn
    io.EX_LsuType    := Mux(io.ID_FuType === FuType.lsu, io.ID_optype, 0.U)
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
        (io.ID_optype === OP_MUL , io.ID_ALU_Data1 * io.ID_ALU_Data2  ),
        (io.ID_optype === OP_DIV , (io.ID_ALU_Data1.asSInt / io.ID_ALU_Data2.asSInt).asUInt),
        (io.ID_optype === OP_DIVU, io.ID_ALU_Data1 / io.ID_ALU_Data2),
        (io.ID_optype === OP_REM , (io.ID_ALU_Data1.asSInt % io.ID_ALU_Data2.asSInt).asUInt),
        (io.ID_optype === OP_REMU , io.ID_ALU_Data1 % io.ID_ALU_Data2),
        (io.ID_optype === OP_ADDW, SEXT((io.ID_ALU_Data1 + io.ID_ALU_Data2 ), 32    )),
        (io.ID_optype === OP_SUBW, SEXT((io.ID_ALU_Data1 - io.ID_ALU_Data2 ), 32    )),
        (io.ID_optype === OP_SLLW, SEXT((io.ID_ALU_Data1(31, 0) << shamt(4, 0)), 32 )),
        (io.ID_optype === OP_SRLW, SEXT((io.ID_ALU_Data1(31, 0) >> shamt(4, 0)), 32 )),
        (io.ID_optype === OP_SRAW, SEXT(((io.ID_ALU_Data1(31, 0).asSInt >> shamt(4, 0)).asUInt), 32)),
        (io.ID_optype === OP_XORW, SEXT((io.ID_ALU_Data1 ^ io.ID_ALU_Data2 ), 32)),
        (io.ID_optype === OP_ORW , SEXT((io.ID_ALU_Data1 | io.ID_ALU_Data2 ), 32)),
        (io.ID_optype === OP_ANDW, SEXT((io.ID_ALU_Data1 & io.ID_ALU_Data2 ), 32)),
        (io.ID_optype === OP_MULW, SEXT((io.ID_ALU_Data1 * io.ID_ALU_Data2 ), 32)),
        (io.ID_optype === OP_DIVW, SEXT(((io.ID_ALU_Data1.asSInt / io.ID_ALU_Data2.asSInt).asUInt), 32)),
        (io.ID_optype === OP_DIVUW, SEXT((io.ID_ALU_Data1 / io.ID_ALU_Data2), 32)),
        (io.ID_optype === OP_REMW, SEXT(((io.ID_ALU_Data1.asSInt % io.ID_ALU_Data2.asSInt).asUInt), 32)),
        (io.ID_optype === OP_REMUW, SEXT((io.ID_ALU_Data1 % io.ID_ALU_Data2), 32))
    ))

    io.EX_ALUResult := ALU_Result
}