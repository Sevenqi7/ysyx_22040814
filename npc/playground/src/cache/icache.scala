// import chisel3._
// import chisel3.util._

// class ICache(tagWidth: Int, nrSets: Int, nrLines: Int, offsetWidth: Int) extends Module{
//     val io = IO(new Bundle{
//         //cache-pipeline
//         val valid   = Input(Bool())
//         val uncache = Input(Bool())
//         val op      = Input(Bool())       //0:read ,1:write
//         val addr    = Input(UInt(64.W))
//         val rdata   = Input(UInt(64.W))
//         val wdata   = Input(UInt(64.W))
//         val addr_ok = Output(Bool())
//         val data_ok = Output(Bool())
//         val hit     = OUtput(Bool()) 

//         //cache-axi
//         val rreq   = Output(Bool())
//         val rtype  = Output(UInt(3.W))
//         val raddr  = Output(UInt(32.W))
//         val rready = Input(Bool())
//         val rvalid = Input(Bool())
//         val rlast  = Input(Bool())
//         val rdata  = Input(UInt(64.W))
//     })


//     val cacheline = Wire(new CacheLine(tagWidth, (Math.pow(2, offsetWidth) * 8).asInt))
//     cacheline.tag   := 0.U
//     cacheline.data  := 0.U
//     cacheline.valid := 0.U
//     val cache = RegInit(VecInit.fill(nrSets, nrLines)(cacheline))

//     val setWidth = log2Ceil(nrSets)
//     val lineWidth = log2Ceil(nrLines)

//     val offset    = io.addr(offsetWidth-1, 0)
//     val set       = io.addr(offsetWidth + setWidth-1, 0)

//     io.rdata     := 0x7777.U
//     io.hit       := 0.U

//     when(io.valid & !io.uncache){
//         for(i <- 0 until nrLines-1){
//             when(tag === cache(set)(i).tag && cache(set)(i).valid){
//                 io.hit   := 1.U
//                 io.rdata := cache(rset)(i).data
//             }
//         }
        
//     }
// }