// import chisel3._
// import chisel3.util._

// class ICache(tagWidth: Int, nrSets: Int, nrLines: Int) extends Module{
//     val io = IO(new Bundle{
//         val raddr = Input(UInt(64.W))
//         val readData = Input(UInt(64.W))
//         val hit = OUtput(Bool())        
//     })

//     val cacheline = Wire(new CacheLine)
//     cacheline.tag   := 0.U
//     cacheline.data  := 0.U
//     cacheline.valid := 0.U
//     val cache = RegInit(VecInit.fill(nrSets, nrLines)(cacheline))

//     val setWidth = log2Ceil(nrSets)
//     val lineWidth = log2Ceil(nrLines)

    
// }