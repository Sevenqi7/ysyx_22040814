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
    val tag  = UInt(16.W)
    val data = UInt(64.W)
    val valid = Bool()
}

class BPU_Cache(tagWidth: Int, nrSets: Int, nrLines: Int) extends Module{
    val io = IO(new Bundle{
        val raddr = Input(UInt(64.W))
        val waddr = Input(UInt(64.W))
        val writeData = Input(UInt(64.W))
        val writeEn   = Input(Bool())
        val readData = Output(UInt(64.W))
        val hit  = Output(Bool())
    })

    // val cache = RegInit(Vec(nrSets, VecInit(Seq.fill(nrLines)(0.U.asTypeOf(new CacheLine)))))
    val cache = RegInit(VecInit.fill(2, 3)(0.U.asTypeOf(new CacheLine)))

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

class BPU extends Module{
    val io = (new Bundle{
        val pc       = Input(UInt(64.W))
        val bp_stall = Output(Bool())
        val bp_flush = Output(Bool())

        val ID_to_BPU_bus = Flipped(Decoupled(new ID_BPU_Message))
        val bp_npc     = Output(UInt(64.W))
    })

    val ID_pc = io.ID_to_BPU_bus.bits.PC
    val ID_br_taken = io.ID_to_BPU_bus.bits.taken

    val bp_taken = Wire(Bool())

    def hash(x: UInt): UInt = {
        val ret = Wire(UInt(8.W))
        val x1 = x(31, 16) ^ x(15, 0)
        ret := x1(15, 8) ^ x1(7, 0)
        ret
    }

    val BHT = RegInit(VecInit(Seq.fill(256)(0.U(4.W))))
    val PHT = RegInit(VecInit(Seq.fill(256)("b01".U(2.W))))
    val BTB = Module(new BPU_Cache(16, 16, 2))

    //BTB
    BTB.io.raddr      := io.pc
    BTB.io.waddr      := ID_pc
    BTB.io.writeEn    := ID_br_taken
    BTB.io.writeData  := io.ID_to_BPU_bus.bits.br_target 
    io.bp_stall       := 0.U
    io.bp_npc         := Mux(bp_taken, BTB.io.readData, io.pc + 4.U)

    //BHT & PHT
    //1.prediction
    val bht_idx = hash(io.pc)
    val pht_idx = BHT(bht_idx) ^ io.pc(3, 0)

    bp_taken     := 0.U
    when(BTB.io.hit){
        bp_taken := PHT(pht_idx) & 1.U
    }

    
    //2.update
    val up_bht_idx = hash(ID_pc)
    val up_pht_idx = BHT(up_bht_idx) ^ ID_pc(3, 0)
    when(io.ID_to_BPU_bus.valid){
        BHT(up_bht_idx) := (BHT(up_bht_idx) << 1) + ID_br_taken

        PHT(up_pht_idx) := MuxCase(PHT(up_pht_idx), Seq(
            (PHT(up_pht_idx) === PH_State.ST  && !ID_br_taken, PH_State.WT ),
            (PHT(up_pht_idx) === PH_State.WT  && !ID_br_taken, PH_State.WNT),
            (PHT(up_pht_idx) === PH_State.WT  &&  ID_br_taken, PH_State.ST ),
            (PHT(up_pht_idx) === PH_State.WNT &&  ID_br_taken, PH_State.WT ),
            (PHT(up_pht_idx) === PH_State.WNT && !ID_br_taken, PH_State.SNT),
            (PHT(up_bht_idx) === PH_State.SNT &&  ID_br_taken, PH_State.SNT)
        ))
    }

}