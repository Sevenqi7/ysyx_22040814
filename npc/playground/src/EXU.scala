import chisel3._
import chisel3.util._
import utils._
import OpType._
import InstType._

class EXU extends Module{
    val io = IO(new Bundle{
        val ID_to_EX_bus =      Flipped(Decoupled(new(ID_EX_Message)))

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
        val EX_Inst    =      Output(UInt(32.W))
        val EX_pc      =      Output(UInt(64.W))
    })
    
    //  pipeline register reset
    val pplrst = Wire(Bool())
    pplrst := reset.asBool | io.flush

    //unpack bus from IDU
    val futype = io.ID_to_EX_bus.bits.futype
    val optype = io.ID_to_EX_bus.bits.optype
    val regWriteEn = io.ID_to_EX_bus.bits.regWriteEn
    val regWriteID = io.ID_to_EX_bus.bits.regWriteID
    val memReadEn = io.ID_to_EX_bus.bits.memReadEn
    val memWriteEn = io.ID_to_EX_bus.bits.memWriteEn
    val rs1_id   = io.ID_to_EX_bus.bits.rs1_id
    val rs1_data = io.ID_to_EX_bus.bits.rs1_data
    val rs2_id   = io.ID_to_EX_bus.bits.rs2_id
    val rs2_data = io.ID_to_EX_bus.bits.rs2_data
    val ALU_Data1 = Wire(UInt(64.W))
    val ALU_Data2 = Wire(UInt(64.W))
    
    val shamt = Wire(UInt(6.W))
    val LsuType = Mux(futype === FuType.lsu, optype, 0.U)
    val ALU_Result = Wire(UInt(64.W))
    val MemWriteData = Wire(UInt(64.W))
    
    shamt := ALU_Data2(5, 0)
    MemWriteData := MuxCase(rs1_data, Seq(
        ((io.EX_MemReadEn.asBool | io.EX_RegWriteEn.asBool) && (rs2_id === io.EX_RegWriteID) && io.ID_to_EX_bus.bits.memWriteEn.asBool, io.MEM_RegWriteData),
        (io.WB_RegWriteEn.asBool && (io.WB_RegWriteID === rs2_id && rs2_id > 0.U) && io.ID_to_EX_bus.bits.memWriteEn.asBool, io.WB_RegWriteData)
    ))
    // MemWriteData := Mux(io.EX_MemReadEn.asBool && io.ID_Rs2ID === io.EX_RegWriteID && 
    //                  io.ID_MemWriteEn.asBool, io.MEM_RegWriteData, io.ID_Rs2Data)
    
    regConnect(io.EX_pc             ,                 io.ID_to_EX_bus.bits.PC)
    regConnect(io.EX_Inst           ,               io.ID_to_EX_bus.bits.Inst)
    regConnect(io.EX_RegWriteEn     ,                              regWriteEn)
    regConnect(io.EX_RegWriteID     ,                              regWriteID)
    regConnect(io.EX_MemWriteEn     ,                              memWriteEn)
    regConnect(io.EX_MemReadEn      ,                               memReadEn)
    regConnect(io.EX_MemWriteData   ,                            MemWriteData)
    regConnect(io.EX_ALUResult      ,                              ALU_Result)
    regConnect(io.EX_LsuType        ,                                 LsuType)
    io.ID_to_EX_bus.ready := 1.U
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
    
    ALU_Data1 := Mux(io.EX_MemReadEn.asBool && (io.EX_RegWriteID === rs1_data) && (memWriteEn.asBool || memReadEn.asBool),
         io.MEM_RegWriteData, io.ID_to_EX_bus.bits.ALU_Data1)
    // ALU_Data1 := io.ID_ALU_Data1
    ALU_Data2 := io.ID_to_EX_bus.bits.ALU_Data2 
    
    ALU_Result := MuxCase(0.U, Seq(
        ((optype === OP_PLUS) || (futype === FuType.lsu), ALU_Data1 + ALU_Data2),
        (optype === OP_SUB , ALU_Data1  -  ALU_Data2),
        (optype === OP_AND , ALU_Data1  &  ALU_Data2),
        (optype === OP_OR  , ALU_Data1  |  ALU_Data2),
        (optype === OP_XOR , ALU_Data1  ^  ALU_Data2),
        (optype === OP_SLL , ALU_Data1 <<  shamt          ),
        (optype === OP_SRL , ALU_Data1 >>  shamt          ),
        (optype === OP_SRA , (ALU_Data1.asSInt >> shamt).asUInt),
        (optype === OP_SLTU, ALU_Data1  <  ALU_Data2),
        (optype === OP_SLT , ALU_Data1.asSInt  <  ALU_Data2.asSInt),
        (optype === OP_MUL , ALU_Data1 * ALU_Data2  ),
        (optype === OP_DIV , (ALU_Data1.asSInt / ALU_Data2.asSInt).asUInt),
        (optype === OP_DIVU, ALU_Data1 / ALU_Data2),
        (optype === OP_REM , (ALU_Data1.asSInt % ALU_Data2.asSInt).asUInt),
        (optype === OP_REMU , ALU_Data1 % ALU_Data2),
        (optype === OP_ADDW, SEXT((ALU_Data1 + ALU_Data2 ), 32    )),
        (optype === OP_SUBW, SEXT((ALU_Data1 - ALU_Data2 ), 32    )),
        (optype === OP_SLLW, SEXT((ALU_Data1(31, 0) << shamt(4, 0)), 32 )),
        (optype === OP_SRLW, SEXT((ALU_Data1(31, 0) >> shamt(4, 0)), 32 )),
        (optype === OP_SRAW, SEXT(((ALU_Data1(31, 0).asSInt >> shamt(4, 0)).asUInt), 32)),
        (optype === OP_XORW, SEXT((ALU_Data1 ^ ALU_Data2 ), 32)),
        (optype === OP_ORW , SEXT((ALU_Data1 | ALU_Data2 ), 32)),
        (optype === OP_ANDW, SEXT((ALU_Data1 & ALU_Data2 ), 32)),
        (optype === OP_MULW, SEXT((ALU_Data1 * ALU_Data2 ), 32)),
        (optype === OP_DIVW, SEXT(((ALU_Data1.asSInt / ALU_Data2.asSInt).asUInt), 32)),
        (optype === OP_DIVUW, SEXT((ALU_Data1 / ALU_Data2), 32)),
        (optype === OP_REMW, SEXT(((ALU_Data1.asSInt % ALU_Data2.asSInt).asUInt), 32)),
        (optype === OP_REMUW, SEXT((ALU_Data1 % ALU_Data2), 32))
    ))
    
}