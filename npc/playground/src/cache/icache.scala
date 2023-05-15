import chisel3._
import chisel3.util._
import utils._


//read only
//axi return 64bits data within single read transaction
class ICache(tagWidth: Int, nrSets: Int, nrLines: Int, offsetWidth: Int) extends Module{
    val io = IO(new Bundle{
        //cache-pipeline
        val valid   = Input(Bool())
        // val uncache = Input(Bool())
        val addr    = Input(UInt(64.W))
        val rdata   = Output(UInt(32.W))
        val hit     = Output(Bool()) 
        val arvalid = Output(Bool())
        val rvalid  = Output(Bool())

        //cache-axi
        val axi_rreq        = Output(Bool())
        val axi_raddr       = Output(UInt(32.W))
        val axi_arready     = Input(Bool())
        val axi_rvalid      = Input(Bool())
        val axi_rlast       = Input(Bool())
        val axi_rdata       = Input(UInt(64.W))
    })

    val IDLE1 :: LOOKUP :: MISS :: REFILL = Enum(4)

    val cacheline = Wire(new CacheLine(tagWidth, (Math.pow(2, offsetWidth) * 8).toInt))
    cacheline.tag   := 0.U
    cacheline.data  := 0.U
    cacheline.valid := 0.U
    val cache = RegInit(VecInit.fill(nrSets, nrLines)(cacheline))

    val setWidth = log2Ceil(nrSets)
    val lineWidth = log2Ceil(nrLines)
    val dataWidth = (Math.pow(2, offsetWidth) * 8).toInt

    //buffer of req
    val req_addr  = RegInit(0.U(UInt(64.W)))
    val req_valid = RegInit(0.U(Bool()))

    val offset    = req_addr(offsetWidth - 1, 0)
    val set       = req_addr(offsetWidth + setWidth - 1, offsetWidth)
    val tag       = req_addr(offsetWidth + setWidth + tagWidth - 1, offsetWidth + setWidth)
    val rdata     = Wire(UInt(dataWidth.W))
    
    val state           = RegInit(IDLE)
    val lineBuf         = RegInit(0.U(dataWidth.W))
    last_req_valid      := io.valid

    //initialise
    io.hit      := 0.U
    io.arvalid  := 0.U
    io.rvalid   := 0.U
    
    //FSM
    val refillIDX       = Wire(UInt(lineWidth.W))
    val rcnt            = RegInit(0.U(3.W))
    refillIDX           := 0.U
    switch(state){
        is (IDLE){
            when(io.valid){
                state       := LOOKUP
                io.arvalid  := 1.U
                req_valid   := io.valid
                req_addr    := io.addr
            }
        }
        is (LOOKUP){
            for(i <- 0 until nrLines-1){
                    when(cache(set)(i).tag === tag && cache(set)(i).valid){
                    io.hit      := 1.U
                    io.rvalid   := 1.U
                    io.rdata    := cache(set)(i).data(dataWidth - 1 - offset * 8, dataWidth - 32 - offset * 8)
                }
            }    
            when(!io.hit){
                state           := MISS
                io.axi_req      := 1.U
                io.axi_raddr    := req_addr & (0xFFFFFFFFL.U << offsetWidth)
            }
            .elsewhen(io.valid){
                state           := LOOKUP
                io.arvalid      := 1.U
                req_valid       := io.valid
                req_addr        := io.addr
            }
            .otherwise{
                state           := IDLE
                io.arvalid      := 0.U
            }
        }
        is (MISS){
            when(!io.axi_arready){
                state           := MISS
            }       
            .otherwise{
                state           := REFILL
                lineBuf(63, 0)  := io.axi_rdata
                rcnt            := rcnt + 1.U
            }
        }
        is (REFILL){
            when(io.axi_rlast){
                state                       := IDLE
                refillIDX                   := random.LFSR(16)(lineWidth, 0)
                cache(set)(refillIDX).valid := 1.U
                cache(set)(refillIDX).tag   := tag
                cache(set)(refillIDX).data  := (lineBuf << 64) | io.axi_rdata
                io.axi_rreq                 := 0.U
            }
            .otherwise{
                lineBuf                         := (lineBuf << 64) | io.axi_rdata
            }
        }
    }

}