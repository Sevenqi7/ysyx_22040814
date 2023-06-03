import chisel3._
import chisel3.util._
import utils._


class CacheLineEX(tagWidth: Int, dataWidth: Int) extends CacheLine(tagWidth, dataWidth){
    val dirty = Bool()
}


class DCache (tagWidth: Int, nrSets: Int, nrLines: Int, offsetWidth: Int) extends Module{
    val io = IO(new Bundle{
        //cache-pipeline
        val valid       = Input(Bool())
        val op          = Input(UInt(1.W))
        val addr        = Input(UInt(64.W))
        val wstrb       = Input(UInt(8.W))  
        val wdata       = Input(UInt(64.W)) 
        val rdata       = Output(UInt(64.W))
        val data_ok     = Output(Bool())
        val addr_ok     = Output(Bool())

        //debug
        val hit         = Output(Bool())

        //cache-axi
        val axi_rreq    = Output(Bool())
        val axi_rtype   = Output(UInt(3.W))
        val axi_raddr   = Output(UInt(32.W))
        val axi_arready = Input(Bool())
        val axi_rvalid  = Input(Bool())
        val axi_rlast   = Input(Bool())
        val axi_rdata   = Input(UInt(32.W))

        val axi_wreq    = Output(Bool())
        val axi_wtype   = Output(UInt(3.W))
        val axi_waddr   = Output(UInt(32.W))
        val axi_wstrb   = Output(UInt(4.W))
        val axi_wdata   = Output(UInt(64.W))
        val axi_wlast   = Output(Bool())
        val axi_awready = Input(Bool())
        val axi_awvalid = Output(Bool())
        val axi_wready  = Input(Bool())
    })

    
    

    val cacheline = Wire(new CacheLineEX(tagWidth, 128))
    
    cacheline.tag       := 0.U
    cacheline.data      := 0.U
    cacheline.valid     := 0.U
    cacheline.dirty     := 0.U
    val cache = RegInit(VecInit.fill(nrSets, nrLines)(cacheline))
    
    val setWidth        = log2Ceil(nrSets)
    val lineWidth       = log2Ceil(nrLines)
    val dataWidth       = 128
    
    
    //pipeline request
    val req_addr        = RegInit(0.U(64.W))
    val req_valid       = RegInit(0.B)
    val req_op          = RegInit(0.B)
    
    val req_wdata       = RegInit(0.U(64.W))
    val req_wstrb       = RegInit(0.U(8.W))
    val req_woffset     = RegInit(0.U(4.W))
    val req_wset        = RegInit(0.U(setWidth.W))
    val req_wline       = RegInit(0.U(lineWidth.W))
    
    val offset          = req_addr(offsetWidth - 1, 0)
    val set             = req_addr(offsetWidth + setWidth - 1, offsetWidth)
    val tag             = req_addr(offsetWidth + setWidth + tagWidth -1 , offsetWidth + setWidth)
    val index           = 127.U - offset * 8.U
    
    val state           = RegInit(sIdle)
    val wstate          = RegInit(wsIdle)
    val lineBuf         = RegInit(0.U(dataWidth.W))
    
    //initialise
    io.rdata        := 0x7777.U
    io.data_ok      := 0.U
    io.addr_ok      := 0.U
    io.axi_rreq     := 0.U
    io.axi_raddr    := 0.U
    io.axi_wreq     := 0.U
    io.axi_wtype    := 0.U
    io.axi_waddr    := 0.U
    io.axi_wstrb    := 0.U
    io.axi_wdata    := 0x7777.U  
    
    /************************FSM************************/
    
    //cache-axi FIFO
   
    val qsIdle :: qsWrite1 :: qsWrite2 :: Nil = Enum(3)
    val dataQueue       = Module(new FIFO(UInt(128.W), 8))
    val addrQueue       = Module(new FIFO(UInt( 32.W), 8))
    val qstate          = RegInit(qsIdle)

    dataQueue.io.enqValid   := 0.U
    dataQueue.io.enqData    := 0.U
    dataQueue.io.deqValid   := 0.U
    addrQueue.io.enqValid   := 0.U
    addrQueue.io.enqData    := 0.U
    addrQueue.io.deqValid   := 0.U
    
    val wcnt            = RegInit(0.B)
    switch(qstate){
        is (qsIdle){
            when(io.axi_awready & !dataQueue.empty){
                qstate      := qsWrite1
            }
        }
        is (qsWrite1){
            io.axi_wdata    := dataQueue.io.deqData(127, 64)
            io.axi_wstrb    := 0xFF.U
            io.axi_wreq     := 1.U
            qstate          := qsWrite1
            when(io.axi_wready){
                qstate      := qsWrite2
            }
        }
        is (qsWrite2){
            io.axi_wdata    := dataQueue.io.deqData(63, 0)
            io.axi_wstrb    := 0xFF.U
            io.axi_wreq     := 1.U
            io.axi_wlast    := 1.U
            qstate          := qsWrite2
            when(io.axi_wready){
                qstate      := qsIdle
            }
        }
    }
    
    
    //cache main state machine
 
    // Main States
    val sIdle :: sLookup :: sMiss :: sRefill :: sReplace :: Nil = Enum(5)
    val refillIDX   = Wire(UInt(lineWidth.W))
    val refillHit   = Wire(Bool())
    refillIDX       := 0.U
    refillHit       := 0.U

    switch(state){
        is (sIdle){
            when(io.valid){
                state       := sLookup
                req_valid   := io.valid
                req_addr    := io.addr
            }
        }
        is (sLookup){
            for(i <- 0 until nrLines){
                when(cache(set)(i).tag === tag && cache(set)(i).valid){
                    io.hit  := 1.U
                    //read opereation
                    when(!req_op){
                        when((offset & "b1000".U) > 0.U){
                            io.rdata                := cache(set)(i).data(63, 0)
                        }
                        .otherwise{
                            io.rdata                := cache(set)(i).data(127, 64)
                        }
                    }
                    .otherwise{
                        req_wdata    := io.wdata
                        req_wstrb    := io.wstrb 
                        req_wset     := set
                        req_wline    := i.U
                    }
                    //write operation is in WriteBuffer FSM
                }               
            }
        }
        is (sMiss){
            when(!io.axi_arready){
                state                := sMiss
            }
            .otherwise{
                io.axi_rreq          := 1.U
                io.axi_raddr         := req_addr & (0xFFFFFFFFL.U << offsetWidth)
                state                := sRefill
            }
        }
        is (sRefill){
            state                    := sRefill
            io.axi_rreq              := 1.U
            io.axi_raddr             := req_addr & (0xFFFFFFFFL.U << offsetWidth)
            when(io.axi_rvalid){
                lineBuf              := (lineBuf << 64) | io.axi_rdata
            }
            when(io.axi_rlast){
                state                := sReplace
            }
        }
        is (sReplace){
            state                    := sIdle
            for(i <- 0 until nrLines-1){
                when(!cache(set)(i).valid){
                    refillHit        := 1.U
                    refillIDX        := i.U
                }
            }
            for(i <- 0 until nrLines-1){
                when(cache(set)(i).valid & tag === cache(set)(i).tag){
                    refillHit        := 1.U
                    refillIDX        := i.U
                }
            }
            when(!refillHit){
                refillIDX            := random.LFSR(16)(lineWidth-1, 0)
            }
            when(cache(set)(refillIDX).dirty & cache(set)(refillIDX).valid){
                cache(set)(refillIDX).dirty := 0.U
                addrQueue.io.enqValid       := 1.U
                addrQueue.io.enqData        := Cat(Seq(cache(set)(refillIDX).tag, set, refillIDX))
                dataQueue.io.enqValid      := 1.U
                dataQueue.io.enqData        := cache(set)(refillIDX).data
            }
            cache(set)(refillIDX).valid     := 1.U
            cache(set)(refillIDX).tag       := tag
            cache(set)(refillIDX).data      := lineBuf
            //TODO: Cache-AXI interaction when write miss
        }
    }

    //Write Buffer

    // WriteBuffer States
    val wsIdle :: wsWrite :: Nil = Enum(2) 

    val writeLowBit  = Wire(UInt(6.W))
    val writeHighBit = Wire(UInt(6.W))
    val writeData    = Wire(UInt(64.W))
    val dataMask     = Wire(UInt(64.W))
    writeLowBit     := req_woffset(2, 0) << 3.U
    writeHighBit    := writeLowBit + req_wstrb - 1.U
    writeData       := (req_wdata << writeLowBit) & (0xFFFFFFFFFFFFFFFFL.U >> (63.U - writeHighBit))
    dataMask        := 0xFFFFFFFFFFFFFFFFL.U

    switch(wstate){
        is (wsIdle){
            when(io.hit & req_op){
                wstate      := wsWrite
            }
        }
        is (wsWrite){
            dataMask                                    := (0xFFFFFFFFFFFFFFFFL.U << (writeHighBit + 1.U)) | (0xFFFFFFFFFFFFFFFFL.U >> (64.U - writeLowBit))
            cache(req_wset)(req_wdata).dirty            := 1.U
            when(req_wstrb === 0xFF.U){
                cache(req_wset)(req_wline).data         := Cat(req_wdata(63, 0), req_wdata(127, 64))
            }
            .elsewhen((req_woffset & "b1000".U) > 0.U){
                cache(req_wset)(req_wline).data         := Cat(cache(req_wset)(req_wline).data(127, 64), (cache(req_wset)(req_wline).data(63, 0) & dataMask) | writeData)
            }
            .otherwise{
                cache(req_wset)(req_wline).data         := Cat((cache(req_wset)(req_wline).data(127, 64) & dataMask) | writeData, cache(req_wset)(req_wline).data(63, 0))
            }

            when(io.hit & req_op){
                wstate      := wsWrite
            }
            .otherwise{
                wstate := wsIdle
            }
        }
    }
}
    