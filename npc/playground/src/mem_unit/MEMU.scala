import chisel3._
import chisel3.util._
import utils._
import OpType._
import InstType._
import java.util.Base64.Decoder

class LSU extends BlackBox with HasBlackBoxPath{
    val io = IO(new Bundle{
        val pc   = Input(UInt(64.W))
        val addr = Input(UInt(64.W))
        val LsuType = Input(UInt(5.W))
        val WriteEn = Input(UInt(1.W))
        val ReadEn  = Input(UInt(1.W))
        val WriteData = Input(UInt(64.W))
        val ReadData = Output(UInt(64.W))
    })
    addPath("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/npc/playground/verilog/LSU.v")
}

//bypass
class MEM_to_ID_Message extends Bundle{
    val regWriteData = UInt(64.W)
    val regWriteEn   = Bool()
    val regWriteID   = UInt(5.W)
}

class MEM_to_WB_Message extends Bundle{

    val regWriteData = UInt(64.W)
    val regWriteEn   = Bool()
    val regWriteID   = UInt(5.W)

    //for NPC to trace
    val PC           = UInt(64.W)
    val Inst         = UInt(32.W)
}


class MEMU extends Module{
    val io = IO(new Bundle{
        val PMEM_to_MEM_bus = Flipped(Decoupled(new PMEM_MEM_Message))
        val MEM_to_WB_bus = Decoupled(new MEM_to_WB_Message)
        val MEM_to_ID_forward = Decoupled(new MEM_to_ID_Message)
    })

    //unpack bus from PMEMU
    val PMEM_pc    = io.PMEM_to_MEM_bus.bits.PC
    val PMEM_Inst  = io.PMEM_to_MEM_bus.bits.Inst
    val ALU_result = io.PMEM_to_MEM_bus.bits.ALU_result
    val regWriteEn = io.PMEM_to_MEM_bus.bits.regWriteEn
    val regWriteID = io.PMEM_to_MEM_bus.bits.regWriteID
    val memReadEn  = io.PMEM_to_MEM_bus.bits.memReadEn
    val lsutype    = io.PMEM_to_MEM_bus.bits.lsutype

    val regWriteData = Wire(UInt(64.W))

    regWriteData := Mux(memReadEn, memReadData, ALU_result)
    
    regConnect(io.MEM_to_WB_bus.bits.PC                , PMEM_pc        )
    regConnect(io.MEM_to_WB_bus.bits.Inst              , PMEM_Inst      )
    regConnect(io.MEM_to_WB_bus.bits.regWriteEn        , regWriteEn     )
    regConnect(io.MEM_to_WB_bus.bits.regWriteID        , regWriteID     )
    regConnect(io.MEM_to_WB_bus.bits.regWriteData      , regWriteData   )
    regConnect(io.MEM_to_WB_bus.valid                  , io.PMEM_to_MEM_bus.valid)
    io.PMEM_to_MEM_bus.ready               := 1.U

    io.MEM_to_ID_forward.bits.regWriteData := regWriteData
    io.MEM_to_ID_forward.bits.regWriteEn   := regWriteEn
    io.MEM_to_ID_forward.bits.regWriteID   := regWriteID
    io.MEM_to_ID_forward.valid             := regWriteEn & (regWriteID > 0.U)
}  
