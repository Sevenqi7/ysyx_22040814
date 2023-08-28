import chisel3._
import chisel3.util._

    /******************** IP FROM VIVADO ********************/ 

class data_ram extends BlackBox {
    val io = IO{new Bundle{
        val addra = Input(UInt(8.W))
        val clka  = Input(Clock())
        val dina  = Input(UInt(32.W))
        val douta = Output(UInt(32.W))
        val wea   = Input(UInt(4.W))
    }}
}

class tagv_ram extends BlackBox {
    val io = IO{new Bundle{
        val addra = Input(UInt(8.W))
        val clka  = Input(Clock())
        val dina  = Input(UInt(21.W))
        val douta = Output(UInt(21.W))
        val wea   = Input(Bool())
    }}
}

    /******************** IP FROM VIVADO ********************/ 

class icache(tagWidth: Int, nrSets: Int, nrLines: Int, offsetWidth: Int) extends Module{
    /***************************IO INTERFACES***************************/

    //cache-pipeline
    val valid       = IO(Input(Bool()))
    val op          = IO(Input(Bool()))
    val index       = IO(Input(UInt(8.W)))      //VIPT
    val tag         = IO(Input(UInt(20.W)))
    val offset      = IO(Input(UInt(4.W)))
    val addr_ok     = IO(Output(Bool()))
    val data_ok     = IO(Output(Bool()))
    val rdata       = IO(Output(UInt(32.W)))
    val uncached    = IO(Input(Bool()))

    //cache-axi
    val rd_req      = IO(Output(Bool()))
    val rd_type     = IO(Output(UInt(3.W)))
    val rd_addr     = IO(Output(UInt(32.W)))
    val rd_rdy      = IO(Input(Bool()))
    val ret_valid   = IO(Input(Bool()))
    val ret_last    = IO(Input(Bool()))
    val ret_data    = IO(Input(UInt(32.W)))

    //debug
    val hit         = IO(Output(Bool()))

    /***************************IO INTERFACES***************************/

    val sIdle :: sLookup :: sMiss :: sReplace :: sRefill :: Nil = Enum(5)

    val setWidth  = log2Ceil(nrSets)
    val lineWidth = log2Ceil(nrLines)
    val dataWidth = 128

    //cache
    val tagv      = VecInit.fill(nrLines)(Module(new tagv_ram()).io)
    val data      = VecInit.fill(nrLines, dataWidth / 32)(Module(new data_ram()).io)

//    val dirty     = RegInit(VecInit.fill(2, 256)(0.B))

    //buffer of req
    val req_valid       = RegInit(0.B)
    val req_op          = RegInit(0.B)
    val req_uncached    = RegInit(0.B)
    val req_offset      = RegInit(0.U(offsetWidth.W))
    val req_set         = RegInit(0.U(setWidth.W))
    val req_tag         = RegInit(0.U(tagWidth.W))
    
    val req_rline       = Wire(UInt(lineWidth.W))
    

    //initialise
    for(i <- 0 until nrLines){
        tagv(i).addra   := req_set
        tagv(i).clka    := clock
        tagv(i).dina    := 0.U
        tagv(i).wea     := 0.U

        for(j <- 0 until (dataWidth / 32)){
            data(i)(j).addra    := req_set
            data(i)(j).clka     := clock
            data(i)(j).dina     := 0.U
            data(i)(j).wea      := 0.U
        }
    }

    hit                 := 0.U
    rdata               := 0x7777.U //MAGIC NUMBER
    addr_ok             := 0.U
    data_ok             := 0.U
    rd_req              := 0.U
    rd_type             := 0.U
    rd_addr             := 0.U

    req_rline           := 0.U
    /**********************FSM**********************/

    //主状态机
    val state           = RegInit(sIdle)
    val lineBuf         = RegInit(0.U(dataWidth.W))


    val refillIDX_r     = RegInit(0.U(lineWidth.W))
    val refillIDX       = Wire(UInt(lineWidth.W))
    val refillHit       = Wire(Bool())
    val LFSR_result     = RegNext(random.LFSR(16))
    val wr_cnt          = RegInit(0.U(2.W))
    
    refillHit           := 0.U
    refillIDX           := 0.U
    
    switch(state){
        is (sIdle){
            when(valid) {
                state := Mux(uncached, sMiss, sLookup)

                addr_ok := 1.U
                req_op := op
                req_valid := valid
                req_tag := tag
                req_set := index
                req_offset := offset
                req_uncached := uncached
                for (i <- 0 until nrLines) {
                    tagv(i).addra := index
                    for (j <- 0 until (dataWidth / 32)) {
                        data(i)(j).addra := index
                    }
                }
            }
        }
        is (sLookup){
            for(i <- 0 until nrLines){
                when((tagv(i).douta(19, 0) === req_tag) && tagv(i).douta(20)){
                    hit         := !req_uncached
                    rdata       := data(i)(req_offset(3, 2)).douta
                    when(!req_op)
                    {
                        req_rline   := i.U
                    }
                    data_ok     := 1.U
                }

            }
            when(!hit){
                state           := sMiss
            }
            .elsewhen(valid)
            {
                state           := Mux(uncached, sMiss, sLookup)
                addr_ok         := 1.U
                req_valid       := valid
                req_uncached    := uncached
                req_op          := op
                req_tag         := tag
                req_set         := index
                req_offset      := offset
                for (i <- 0 until nrLines) {
                    tagv(i).addra := index
                    for (j <- 0 until (dataWidth / 32)) {
                        data(i)(j).addra := index
                    }
            }
            }.otherwise{
                req_valid := 0.U
                state := sIdle
            }
        }
        is (sMiss){
            state                   := sReplace
            for(i <- 0 until nrLines){
                when(!tagv(i).douta(20)){
                    refillHit           := 1.U
                    refillIDX           := i.U
                }
            }
            for(i  <- 0 until nrLines){
                when(tagv(i).douta(19, 0) === req_tag && tagv(i).douta(20)){
                    refillHit           := 1.U
                    refillIDX           := i.U
                }
            }
            when(!refillHit){
                refillIDX               := LFSR_result(lineWidth-1, 0)
            }
            refillIDX_r             := refillIDX
            req_rline               := refillIDX
        }
        is (sReplace){
            state           := sReplace
            rd_req          := Mux(req_op && req_uncached, 0.U,  1.U)
            rd_type         := Mux(req_uncached, "b010".U, "b100".U)
            rd_addr         := Mux(req_uncached, Cat(Seq(req_tag, req_set, req_offset)), Cat(Seq(req_tag, req_set, 0.U(4.W))))
            when(rd_rdy){
                state       := sRefill   
            }
        }   
        is (sRefill){
            state                       := sRefill
            when(!req_uncached)
            {
                when(ret_valid)
                {
                    wr_cnt                                  := wr_cnt + 1.U
                    data(refillIDX_r)(wr_cnt).dina          := ret_data
                    data(refillIDX_r)(wr_cnt).wea           := 0xF.U
                    when(ret_last)
                    {
                        state                               := sLookup
//                        dirty(refillIDX_r)(req_set)         := 0.U
                        tagv(refillIDX_r).wea               := 1.U
                        tagv(refillIDX_r).dina              := Cat(1.B, req_tag)
                    }
                }
            }
            .otherwise{
                when(ret_valid & ret_last)
                {
                    data_ok                                 := 1.U
                    rdata                                   := ret_data
                    state                                   := sIdle
                    req_valid                               := 0.U
                }
              }
        }
    }

}



