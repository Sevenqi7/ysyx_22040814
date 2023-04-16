import chisel3._
import chisel3.util._
import utils._
import OpType._
import InstType._

class EX_MEM_Message extends Bundle{
    //for NPC to trace
    val Inst    =      Output(UInt(32.W))
    val PC      =      Output(UInt(64.W))    
    
    //Reg
    val ALU_result   =   (UInt(64.W))
    val memWriteData =   (UInt(64.W))
    val memWriteEn   =   (Bool())
    val memReadEn    =   (Bool())
    val lsutype      =   (UInt(5.W))
    val regWriteID   =   (UInt(5.W))
    val regWriteEn   =   (Bool())
}

class EXU extends Module{
    val io = IO(new Bundle{
        val ID_to_EX_bus  =     Flipped(Decoupled(new(ID_EX_Message)))

        val EX_to_MEM_bus =     Decoupled(new(EX_MEM_Message))
        //From MEMU and WBU to resolve store after load adventure
        val WB_to_EX_forward = Flipped(Decoupled(new WB_to_ID_Message))
        val MEM_regWriteData = Input(UInt(64.W))

        //to IDU.Bypass
        val EX_ALUResult_Pass = Output(UInt(64.W))

    })
    
    //unpack bus from IDU/WBU
    val pc     = io.ID_to_EX_bus.bits.PC
    val inst   = io.ID_to_EX_bus.bits.Inst
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

    val WB_regWriteData = io.WB_to_EX_forward.bits.regWriteData
    val WB_regWriteEn   = io.WB_to_EX_forward.bits.regWriteEn
    val WB_regWriteID   = io.WB_to_EX_forward.bits.regWriteID
    
    val shamt = Wire(UInt(6.W))
    val lsutype = Mux(futype === FuType.lsu, optype, 0.U)
    val ALU_result = Wire(UInt(64.W))
    val memWriteData = Wire(UInt(64.W))
    
    shamt := ALU_Data2(5, 0)
    memWriteData := MuxCase(rs2_data, Seq(
        ((io.EX_to_MEM_bus.bits.memReadEn | io.EX_to_MEM_bus.bits.regWriteEn) && (rs2_id === io.EX_to_MEM_bus.bits.regWriteID) && memWriteEn, io.MEM_regWriteData),
        (WB_regWriteEn && (WB_regWriteID === rs2_id && rs2_id > 0.U) && memWriteEn, WB_regWriteData)
    ))

    
    regConnect(io.EX_to_MEM_bus.bits.PC             ,                                      pc)
    regConnect(io.EX_to_MEM_bus.bits.Inst           ,                                    inst)
    regConnect(io.EX_to_MEM_bus.bits.regWriteEn     ,                              regWriteEn)
    regConnect(io.EX_to_MEM_bus.bits.regWriteID     ,                              regWriteID)
    regConnect(io.EX_to_MEM_bus.bits.memWriteEn     ,                              memWriteEn)
    regConnect(io.EX_to_MEM_bus.bits.memReadEn      ,                               memReadEn)
    regConnect(io.EX_to_MEM_bus.bits.memWriteData   ,                            memWriteData)
    regConnect(io.EX_to_MEM_bus.bits.ALU_result     ,                              ALU_result)
    regConnect(io.EX_to_MEM_bus.bits.lsutype        ,                                 lsutype)
    regConnect(io.EX_to_MEM_bus.valid               ,                   io.ID_to_EX_bus.valid)
    io.ID_to_EX_bus.ready := 1.U
    io.WB_to_EX_bus.ready := 1.U

    io.EX_ALUResult_Pass := ALU_result
    
    ALU_Data1 := Mux(io.EX_to_MEM_bus.bits.memReadEn && (io.EX_to_MEM_bus.bits.regWriteID === rs1_id) && (memWriteEn || memReadEn),
         io.MEM_regWriteData, io.ID_to_EX_bus.bits.ALU_Data1)
    // ALU_Data1 := io.ID_ALU_Data1
    ALU_Data2 := io.ID_to_EX_bus.bits.ALU_Data2 
    
    ALU_result := MuxCase(0.U, Seq(
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