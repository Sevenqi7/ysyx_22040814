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
        val ID_optype = Input(UInt(4.W))
        val ID_FuType = Input(UInt(1.W))
        val ID_RegWriteEn = Input(UInt(1.W))
        val ID_RegWriteID = Input(UInt(5.W))
        val ID_MemWriteEn = Input(UInt(1.W))
        
        val EX_ALUResult  = Output(UInt(64.W))
        val EX_MemWriteData = Output(UInt(64.W))
        val EX_MemWriteEn = Output(UInt(1.W))
        val EX_LsuType    = Output(UInt(4.W))
        val EX_RegWriteID = Output(UInt(5.W))
        val EX_RegWriteEn = Output(UInt(1.W))
    })

    //now it is only a single cycle cpu, so directy connect EX_Reg* to ID_Reg*
    io.EX_RegWriteEn := io.ID_RegWriteEn
    io.EX_RegWriteID := io.ID_RegWriteID
    io.EX_MemWriteData := io.ID_Rs1Data
    io.EX_MemWriteEn := io.ID_MemWriteEn
    io.EX_LsuType    := Mux(io.ID_FuType === FuType.lsu, io.ID_optype, 0.U)

    val ALU_Result = Wire(UInt(64.W))
    ALU_Result := MuxCase(0.U, Seq(
        (io.ID_optype === OP_PLUS || io.ID_FuType === FuType.lsu, io.ID_ALU_Data1 + io.ID_ALU_Data2),
        (io.ID_optype === OP_SUB , io.ID_ALU_Data1 - io.ID_ALU_Data2)
    ))

    io.EX_ALUResult := ALU_Result
}