import chisel3._
import chisel3.util._ 

class cpu_axi_interface extends Module{
    //inst axi
    val icache_rd_req       = IO(Input(Bool()))
    val icache_rd_addr      = IO(Input(UInt(32.W)))
    val icache_rd_type      = IO(Input(UInt(3.W)))
    val icache_rd_rdy       = IO(Output(Bool()))
    val icache_ret_valid    = IO(Output(Bool()))
    val icache_ret_last     = IO(Output(Bool()))
    val icache_ret_data     = IO(Output(UInt(32.W)))
    val icache_wr_req       = IO(Input(Bool()))
    val icache_wr_type      = IO(Input(UInt(3.W)))
    val icache_wr_addr      = IO(Input(UInt(32.W)))
    val icache_wr_data      = IO(Input(UInt(32.W)))
    val icache_wr_wstrb     = IO(Input(UInt(4.W)))
    val icache_wr_rdy       = IO(Output(Bool()))

    //data axi
    val dcache_rd_req       = IO(Input(Bool()))
    val dcache_rd_addr      = IO(Input(UInt(32.W)))
    val dcache_rd_type      = IO(Input(UInt(3.W)))
    val dcache_rd_rdy       = IO(Output(Bool()))
    val dcache_ret_valid    = IO(Output(Bool()))
    val dcache_ret_last     = IO(Output(Bool()))
    val dcache_ret_data     = IO(Output(UInt(32.W)))
    val dcache_wr_req       = IO(Input(Bool()))
    val dcache_wr_type      = IO(Input(UInt(3.W)))
    val dcache_wr_addr      = IO(Input(UInt(32.W)))
    val dcache_wr_data      = IO(Input(UInt(128.W)))
    val dcache_wr_wstrb     = IO(Input(UInt(4.W)))
    val dcache_wr_rdy       = IO(Output(Bool()))

    //ar
    val arid                = IO(Output(UInt(4.W)))
    val araddr              = IO(Output(UInt(32.W)))
    val arlen               = IO(Output(UInt(8.W)))
    val arsize              = IO(Output(UInt(3.W)))
    val arburst             = IO(Output(UInt(2.W)))
    val arlock              = IO(Output(UInt(2.W)))
    val arcache             = IO(Output(UInt(4.W)))
    val arprot              = IO(Output(UInt(3.W)))
    val arvalid             = IO(Output(Bool()))
    val arready             = IO(Input(Bool()))

    //r
    val rid                 = IO(Input(UInt(4.W)))
    val rdata               = IO(Input(UInt(32.W)))
    val rresp               = IO(Input(UInt(2.W)))
    val rlast               = IO(Input(Bool()))
    val rvalid              = IO(Input(Bool()))
    val rready              = IO(Output(Bool()))

    //aw
    val awid                = IO(Output(UInt(4.W)))
    val awaddr              = IO(Output(UInt(32.W)))
    val awlen               = IO(Output(UInt(8.W)))
    val awsize              = IO(Output(UInt(3.W)))
    val awburst             = IO(Output(UInt(2.W)))
    val awlock              = IO(Output(UInt(2.W)))
    val awcache             = IO(Output(UInt(4.W)))
    val awprot              = IO(Output(UInt(3.W)))
    val awvalid             = IO(Output(Bool()))
    val awready             = IO(Input(Bool()))

    //w
    val wid                 = IO(Output(UInt(4.W)))
    val wdata               = IO(Output(UInt(32.W)))
    val wstrb               = IO(Output(UInt(4.W)))
    val wlast               = IO(Output(Bool()))
    val wvalid              = IO(Output(Bool()))
    val wready              = IO(Input(Bool()))

    //b
    val bid                 = IO(Input(UInt(4.W)))
    val bresp               = IO(Input(UInt(2.W)))
    val bvalid              = IO(Input(Bool()))
    val bready              = IO(Output(Bool()))

    /****************Request Buffer****************/

    val rreq        = RegInit(0.U(2.W))
    val rtype       = RegInit(0.U(3.W)) 
    val raddr_r     = RegInit(0.U(32.W))

    val wreq        = RegInit(0.U(2.W))
    val wtype       = RegInit(0.U(3.W)) 
    val waddr_r     = RegInit(0.U(32.W))
    val wstrb_r     = RegInit(0.U(4.W))
    val wdata_r     = RegInit(VecInit.fill(4)(0.U(32.W)))

    val adventure   = Wire(Bool())
    adventure       := MuxCase(0.U, Seq(
        (dcache_rd_req && (wreq =/= 0.U && ((waddr_r(31, 4) ^ dcache_rd_addr(31, 4)) === 0.U)), 1.U),
        (icache_rd_req && (wreq =/= 0.U && ((waddr_r(31, 4) ^ icache_rd_addr(31, 4)) === 0.U)), 1.U)
    ))

    /***************** Initialise ******************/

    arid                := 0.U
    arlen               := 0.U
    arsize              := 0.U
    araddr              := 0.U
    arburst             := "b01".U
    arvalid             := 0.U
    arlock              := 0.U
    arcache             := 0.U
    rready              := 1.U
    arprot              := 0.U

    awid                := 0.U
    awlen               := 0.U
    awsize              := 0.U
    awaddr              := 0.U
    awburst             := "b01".U
    awvalid             := 0.U
    awlock              := 0.U
    awcache             := 0.U
    awprot              := 0.U
    
    wid                 := 0.U
    wdata               := 0.U
    wstrb               := 0.U
    wvalid              := 0.U
    wlast               := 0.U
    bready              := 1.U

    icache_ret_data     := 0.U
    icache_ret_last     := 0.U
    icache_ret_valid    := 0.U
    icache_rd_rdy       := 0.U

    dcache_ret_data     := 0.U
    dcache_ret_last     := 0.U
    dcache_ret_valid    := 0.U
    dcache_rd_rdy       := 0.U
    /***************** axi-read ******************/

    val rIdle::rSendReq::rRecvData::Nil = Enum(3)
    
    val rstate = RegInit(rIdle)
    
    switch(rstate){
        is (rIdle){
            rstate              := rIdle
            when(!adventure){
                when(dcache_rd_req){
                    rstate          := rSendReq
                    rreq            := "b10".U
                    raddr_r         := dcache_rd_addr
                    rtype           := dcache_rd_type
                    dcache_rd_rdy   := 1.U
                }.elsewhen(icache_rd_req){
                    rstate          := rSendReq
                    rreq            := "b01".U
                    raddr_r         := icache_rd_addr
                    rtype           := icache_rd_type
                    icache_rd_rdy   := 1.U
                }
            }
        }
        is (rSendReq){
            rstate              := rSendReq
            arid                := rreq
            arvalid             := 1.U
            araddr              := raddr_r
            arsize              := Mux(rtype(2), "b010".U, rtype)
            arlen               := Mux(rtype(2), 3.U, 0.U)
            when(arready){
                rstate          := rRecvData
            }
        }
        is (rRecvData){
            rstate              := rRecvData
            when(rvalid){
                when(rreq === "b01".U){
                    icache_ret_valid        := 1.U
                    icache_ret_data         := rdata
                    icache_ret_last         := rlast
                }
                .elsewhen(rreq === "b10".U){
                    dcache_ret_valid        := 1.U
                    dcache_ret_data         := rdata
                    dcache_ret_last         := rlast
                }
                
                when(rlast){
                    rreq                    := 0.U
                    rstate                  := rIdle
                }
            }
        }
    }


    /***************** axi-write ******************/
    

    val wIdle::wSendReq::wSendData::wWaitResp::Nil = Enum(4)
    val wstate          = RegInit(wIdle)
    val wr_cnt          = RegInit(0.U(4.W))
    val wlen_r          = RegInit(0.U(4.W))

    icache_wr_rdy       := 1.U
    dcache_wr_rdy       := 0.U

    //icache doesn't write
    switch(wstate){
        is (wIdle){
            wstate              := wIdle
            dcache_wr_rdy       := 1.U
            when(dcache_wr_req){
                wreq            := "b10".U
                wstate          := wSendReq
                wtype           := dcache_wr_type
                waddr_r         := dcache_wr_addr
                wstrb_r         := dcache_wr_wstrb
                wdata_r(0)      := dcache_wr_data(31, 0)
                wdata_r(1)      := dcache_wr_data(63, 32)
                wdata_r(2)      := dcache_wr_data(95, 64)
                wdata_r(3)      := dcache_wr_data(127, 96)
            }
        }   
        is (wSendReq){
            wstate              := wSendReq
            awid                := wreq + 4.U
            awvalid             := 1.U
            awaddr              := waddr_r
            awlen               := Mux(wtype(2), 3.U, 0.U)
            wlen_r              := Mux(wtype(2), 3.U, 0.U)
            awsize              := Mux(wtype(2), "b010".U, wtype)
            wr_cnt              := 0.U
            when(awready){
                wstate          := wSendData
            }
        }
        is (wSendData){
            wid                 := wreq + 4.U
            wvalid              := 1.U
            wdata               := wdata_r(wr_cnt)
            wstrb               := Mux(wtype(2), "b1111".U, wstrb_r)
            when(wready){
                when(wr_cnt < wlen_r){
                    wstate          := wSendData
                    wr_cnt          := wr_cnt + 1.U
                }
                .elsewhen(wr_cnt === wlen_r){
                    wstate          := wWaitResp
                    wlast           := 1.U      
                    wlen_r          := 0.U
                }
            }
        }
        is (wWaitResp){
            wstate      := wWaitResp
            when(bready && bvalid && bid === (wreq + 4.U)){
                wstate      := wIdle
                wreq        := 0.U
                wlen_r      := 0.U
            }
        }
    }
}