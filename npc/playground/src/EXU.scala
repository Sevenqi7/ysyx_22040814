import chisel3._
import chisel3.util._
import utils._
import OpType._
import InstType._

class EXU extends Module{
    val io = IO(new Bundle{
        val ID_ALU_Data1  =     Input(UInt(64.W))
        val ID_ALU_Data2  =     Input(UInt(64.W))
        val ID_Rs1Data    =     Input(UInt(64.W))
        val ID_Rs1ID      =     Input(UInt(5.W))
        val ID_Rs2Data    =     Input(UInt(64.W))
        val ID_Rs2ID      =     Input(UInt(5.W))
        val ID_optype     =     Input(UInt(5.W))
        val ID_FuType     =     Input(UInt(1.W))
        val ID_RegWriteEn =     Input(UInt(1.W))
        val ID_RegWriteID =     Input(UInt(5.W))
        val ID_MemWriteEn =     Input(UInt(1.W))
        val ID_MemReadEn  =     Input(UInt(1.W))
        
        //Reg
        val EX_ALUResult  =     Output(UInt(64.W))
        val EX_MemWriteData =   Output(UInt(64.W))
        val EX_MemWriteEn =     Output(UInt(1.W))
        val EX_MemReadEn  =     Output(UInt(1.W))
        val EX_LsuType    =     Output(UInt(5.W))
        val EX_RegWriteID =     Output(UInt(5.W))
        val EX_RegWriteEn =     Output(UInt(1.W))

        //From MEMU and WBU to resolve store after load adventure
        val WB_RegWriteEn    = Input(UInt(1.W))
        val WB_RegWriteID    = Input(UInt(5.W))
        val WB_RegWriteData  = Input(UInt(64.W))
        val MEM_RegWriteData = Input(UInt(64.W))

        //to IDU.Bypass
        val EX_ALUResult_Pass = Output(UInt(64.W))

        //Flush
        //it is used when there is a load-to-use adventure
        //it is actually the ID_stall in IDU
        val flush      =      Input(Bool())

        //for NPC to trace
        val ID_pc      =      Input(UInt(64.W))
        val ID_Inst    =      Input(UInt(32.W))
        val EX_Inst    =      Output(UInt(32.W))
        val EX_pc      =      Output(UInt(64.W))
    })
    
    //  pipeline register reset
    val pplrst = Wire(Bool())
    pplrst := reset.asBool | io.flush


    val LsuType = Mux(io.ID_FuType === FuType.lsu, io.ID_optype, 0.U)
    val MemWriteData = Wire(UInt(64.W))
    val ALU_Data1 = Wire(UInt(64.W))
    val ALU_Data2 = Wire(UInt(64.W))
    val ALU_Result = Wire(UInt(64.W))
    val shamt = Wire(UInt(6.W))
    
    shamt := ALU_Data2(5, 0)
    MemWriteData := MuxCase(io.ID_Rs2Data, Seq(
        ((io.EX_MemReadEn.asBool | io.EX_RegWriteEn.asBool) && io.ID_Rs2ID === io.EX_RegWriteID && io.ID_MemWriteEn.asBool, io.MEM_RegWriteData),
        (io.WB_RegWriteEn.asBool && io.WB_RegWriteID === io.ID_Rs2ID && io.ID_MemWriteEn.asBool, io.WB_RegWriteData)
    ))
    // MemWriteData := Mux(io.EX_MemReadEn.asBool && io.ID_Rs2ID === io.EX_RegWriteID && 
    //                  io.ID_MemWriteEn.asBool, io.MEM_RegWriteData, io.ID_Rs2Data)
    
    regConnect(io.EX_pc             ,         io.ID_pc)
    regConnect(io.EX_Inst           ,       io.ID_Inst)
    regConnect(io.EX_RegWriteEn     , io.ID_RegWriteEn)
    regConnect(io.EX_RegWriteID     , io.ID_RegWriteID)
    regConnect(io.EX_MemWriteData   ,     MemWriteData)
    regConnect(io.EX_MemWriteEn     , io.ID_MemWriteEn)
    regConnect(io.EX_MemReadEn      ,  io.ID_MemReadEn)
    regConnect(io.EX_LsuType        ,          LsuType)
    regConnect(io.EX_ALUResult      ,       ALU_Result)
    // regConnectWithReset(io.EX_pc            , io.ID_pc          , pplrst)
    // regConnectWithReset(io.EX_Inst          , io.ID_Inst        , pplrst)
    // regConnectWithReset(io.EX_RegWriteEn    , io.ID_RegWriteEn  , pplrst)
    // regConnectWithReset(io.EX_RegWriteID    , io.ID_RegWriteID  , pplrst)
    // regConnectWithReset(io.EX_MemWriteData  , io.ID_Rs2Data     , pplrst)
    // regConnectWithReset(io.EX_MemWriteEn    , io.ID_MemWriteEn  , pplrst)
    // regConnectWithReset(io.EX_MemReadEn     , io.ID_MemReadEn   , pplrst)
    // regConnectWithReset(io.EX_LsuType       , LsuType           , pplrst)
    // regConnectWithReset(io.EX_ALUResult     , ALU_Result        , pplrst)


    io.EX_ALUResult_Pass := ALU_Result
    
    ALU_Data1 := Mux(io.EX_MemReadEn.asBool && (io.EX_RegWriteID === io.ID_Rs1ID) && io.ID_MemWriteEn.asBool,
         io.MEM_RegWriteData, io.ID_ALU_Data1)
    ALU_Data1 := io.ID_ALU_Data1
    ALU_Data2 := io.ID_ALU_Data2 
    
    ALU_Result := MuxCase(0.U, Seq(
        ((io.ID_optype === OP_PLUS) || (io.ID_FuType === FuType.lsu), ALU_Data1 + ALU_Data2),
        (io.ID_optype === OP_SUB , ALU_Data1  -  ALU_Data2),
        (io.ID_optype === OP_AND , ALU_Data1  &  ALU_Data2),
        (io.ID_optype === OP_OR  , ALU_Data1  |  ALU_Data2),
        (io.ID_optype === OP_XOR , ALU_Data1  ^  ALU_Data2),
        (io.ID_optype === OP_SLL , ALU_Data1 <<  shamt          ),
        (io.ID_optype === OP_SRL , ALU_Data1 >>  shamt          ),
        (io.ID_optype === OP_SRA , (ALU_Data1.asSInt >> shamt).asUInt),
        (io.ID_optype === OP_SLTU, ALU_Data1  <  ALU_Data2),
        (io.ID_optype === OP_SLT , ALU_Data1.asSInt  <  ALU_Data2.asSInt),
        (io.ID_optype === OP_MUL , ALU_Data1 * ALU_Data2  ),
        (io.ID_optype === OP_DIV , (ALU_Data1.asSInt / ALU_Data2.asSInt).asUInt),
        (io.ID_optype === OP_DIVU, ALU_Data1 / ALU_Data2),
        (io.ID_optype === OP_REM , (ALU_Data1.asSInt % ALU_Data2.asSInt).asUInt),
        (io.ID_optype === OP_REMU , ALU_Data1 % ALU_Data2),
        (io.ID_optype === OP_ADDW, SEXT((ALU_Data1 + ALU_Data2 ), 32    )),
        (io.ID_optype === OP_SUBW, SEXT((ALU_Data1 - ALU_Data2 ), 32    )),
        (io.ID_optype === OP_SLLW, SEXT((ALU_Data1(31, 0) << shamt(4, 0)), 32 )),
        (io.ID_optype === OP_SRLW, SEXT((ALU_Data1(31, 0) >> shamt(4, 0)), 32 )),
        (io.ID_optype === OP_SRAW, SEXT(((ALU_Data1(31, 0).asSInt >> shamt(4, 0)).asUInt), 32)),
        (io.ID_optype === OP_XORW, SEXT((ALU_Data1 ^ ALU_Data2 ), 32)),
        (io.ID_optype === OP_ORW , SEXT((ALU_Data1 | ALU_Data2 ), 32)),
        (io.ID_optype === OP_ANDW, SEXT((ALU_Data1 & ALU_Data2 ), 32)),
        (io.ID_optype === OP_MULW, SEXT((ALU_Data1 * ALU_Data2 ), 32)),
        (io.ID_optype === OP_DIVW, SEXT(((ALU_Data1.asSInt / ALU_Data2.asSInt).asUInt), 32)),
        (io.ID_optype === OP_DIVUW, SEXT((ALU_Data1 / ALU_Data2), 32)),
        (io.ID_optype === OP_REMW, SEXT(((ALU_Data1.asSInt % ALU_Data2.asSInt).asUInt), 32)),
        (io.ID_optype === OP_REMUW, SEXT((ALU_Data1 % ALU_Data2), 32))
    ))
    
}