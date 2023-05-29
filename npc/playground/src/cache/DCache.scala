class DCache (tagWidth: Int, nrSets: Int, nrLines: Int, offsetWidth: Int) extends Module{
    val io = IO(new Bundle{
        val valid       = Input(Bool())
        val op          = Input(UInt(1.W))
        val addr        = Input(UInt(64.W))
        val wstrb       = Input(UInt(4.W))  
        val wdata       = Input(UInt(64.W))
        val rdata       = Output(UInt(64.W))
        val addr_ok     = Output(Bool())
        val data_ok     = Output(Bool())

        val axi_rreq    = Output(Bool())
        val axi_rtype   = Output(UInt(3.W))
        val axi_raddr   = Output(UInt(32.W))
        val axi_rreay   = Input(Bool())
        val axi_rlast   = Input(Bool())
        val axi_rdata   = Input(UInt(32.W))

        val axi_wreq    = Output(Bool())
        val axi_wtype   = Output(UInt(3.W))
        val axi_waddr   = Output(UInt(32.W))
        val axi_wstrb   = Output(UInt(4.W))
        val axi_wdata   = Output(UInt(64.W))
        val axi_wready  = Input(Bool())
    })

    val sIdle :: sLookup :: sMiss :: sRefill :: sReplace :: Nil = Enum(5)

    val cacheline = Wire(new CacheLine(tagWidth, 128))

    cacheline.tag   := 0.U
    cacheline.data  := 0.U
    cacheline.valid := 0.U
    val cache = RegInit(VecInit.fill(nrSets, nrLines)(cacheline))

    val setWidth = log2Ceil(nrSets)
    val lineWidth = log2Ceil(nrLines)
    val dataWidth = 128
    
}
    