import chisel3._
import chisel3.util._
import BType._

object PH_State{
    val ST  = "b11".U          //strongly taken
    val WT  = "b01".U          //weakly taken
    val WNT = "b00".U          //weakly not taken
    val SNT = "b10".U          //strongly not taken
}

class CacheLine extends Bundle{
    val tag  = UInt()
    val data = UInt(64.W)
    val valid = Bool()
}

class BPU_Cache(tagWidth: Int, nrSets: Int, nrLines: Int) extends RawModule{
    val io = IO(new Bundle{
        val raddr = Input(UInt(64.W))
        val waddr = Input(UInt(64.W))
        val writeData = Input(UInt(64.W))
        val writeEn   = Input(Bool())
        val readData = Output(UInt(64.W))
        val hit  = Output(Bool())
    })

    val cache = RegInit(Vec(nrSets, VecInit(Seq.fill(nrLines)(0.U.asTypeOf(new CacheLine)))))
    val setWidth = log2Ceil(nrSets)

    val rtag = io.raddr(tagWidth + setWidth - 1, setWidth)
    val rset = io.raddr(setWidth - 1, 0)

    //read
    io.readData := 7777.U       //Magic number, for debug
    io.hit := 0.U
    for(i <- 0 until nrLines){
        when((rtag === cache(rset)(i).tag) & cache(rset)(i).valid){
            io.hit := 1.U
            io.readData := cache(rset)(i).data
        }
    }

    //write
    val wtag = io.waddr(tagWidth + setWidth - 1, setWidth)
    val wset = io.waddr(setWidth - 1, 0)
    val writeIDX = Wire(UInt((setWidth+1).W))
    writeIDX := "b100".U        //the 2nd bit is used as writeHit
    for(i <- 0 until nrLines){
        when(wtag === cache(wset)(i).tag){
            writeIDX := i.U
        }
    }
    when(io.writeEn){
        when(writeIDX(2).asBool){
            writeIDX := random.LFSR(16)(1, 0)
        }
        cache(wset)(writeIDX).valid := 1.U
        cache(wset)(writeIDX).tag   := wtag
        cache(wset)(writeIDX).data  := io.writeData
    }
    
}

class BPU extends RawModule{
    val io = (new Bundle{
        val pc      = Input(UInt(64.W))
        val inst    = Input(UInt(32.W))
        val bp_stall =   Output(Bool())
        
        val EX_to_BPU_forward = Flipped(Decoupled(new EX_BPU_Message))
        val npc     = Output(UInt(64.W))
    })

    val EX_pc = io.EX_to_BPU_forward.bits.PC
    val EX_br_taken = io.EX_to_BPU_forward.bits.taken

    val bp_taken = Wire(Bool())

    def hash(x: UInt): UInt = {
        val ret = Wire(UInt(8.W))
        val x1 = x(31, 16) ^ x(15, 0)
        ret := x1(15, 8) ^ x1(7, 0)
        ret
    }

    val BHT = RegInit(VecInit(Seq.fill(256)(0.U(4.W))))
    val PHT = RegInit(VecInit(Seq.fill(256)("b01".U(2.W))))
    val BTB = Module(new BPU_Cache(16, 2, 2))

    val opcode = io.inst(6, 0)
    val Br_type = (opcode === "b1100011".U)
    val J_type  = (opcode === "b110?111".U)

    //BTB
    BTB.io.raddr      := io.pc
    BTB.io.waddr      := EX_pc
    BTB.io.writeEn    := EX_br_taken
    BTB.io.writeData  := io.EX_to_BPU_forward.bits.br_target 
    io.npc            := Mux(bp_taken, io.pc+4.U, BTB.io.readData)
    io.bp_stall       := (BTB.io.hit & Br_type) | J_type    

    //BHT & PHT
    //1.prediction
    val bht_idx = hash(io.pc)
    val pht_idx = BHT(bht_idx) ^ io.pc(3, 0)

    when(Br_type){
        bp_taken := PHT(pht_idx) & 1.U
    }
    
    //2.update
    val up_bht_idx = hash(EX_pc)
    val up_pht_idx = BHT(up_bht_idx) ^ EX_pc(3, 0)
    when(io.EX_to_BPU_forward.valid){
        BHT(up_bht_idx) := (BHT(up_bht_idx) << 1) + EX_br_taken

        PHT(up_pht_idx) := MuxCase(PHT(up_pht_idx), Seq(
            (PHT(up_pht_idx) === PH_State.ST  && !EX_br_taken, PH_State.WT ),
            (PHT(up_pht_idx) === PH_State.WT  && !EX_br_taken, PH_State.WNT),
            (PHT(up_pht_idx) === PH_State.WT  &&  EX_br_taken, PH_State.ST ),
            (PHT(up_pht_idx) === PH_State.WNT &&  EX_br_taken, PH_State.WT ),
            (PHT(up_pht_idx) === PH_State.WNT && !EX_br_taken, PH_State.SNT),
            (PHT(up_bht_idx) === PH_State.SNT &&  EX_br_taken, PH_State.SNT)
        ))
    }

}