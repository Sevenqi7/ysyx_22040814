import chisel3._
import chisel3.util._
import chisel3.experimental._
import AXILiteDefs._

class sim extends BlackBox with HasBlackBoxPath{
    val io = IO(new Bundle{
        val clock = Input(Clock())
        val reset = Input(UInt(1.W))
        val IF_pc = Input(UInt(64.W))
        val GPR  = Input(Vec(32, UInt(64.W)))
        val unknown_inst_flag = Input(UInt(1.W))
        val WB_Inst = Input(UInt(32.W))
        val inst = Output(UInt(64.W))
    })
    addPath("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/npc/playground/verilog/sim.v")
}

class top extends Module{
    val io = IO(new Bundle{
        val ID_npc = Output(UInt(64.W))
        val PF_npc = Output(UInt(64.W))
        val PF_pc = Output(UInt(64.W))
        val PF_axidata =Output(UInt(64.W))
        val IF_pc = Output(UInt(64.W))
        val ID_pc = Output(UInt(64.W))
        val EX_pc = Output(UInt(64.W))
        val PMEM_pc = Output(UInt(64.W))
        val WB_pc = Output(UInt(64.W))
        val WB_Inst = Output(UInt(32.W))
        val WB_RegWriteData = Output(UInt(64.W))
        val WB_RegWriteID = Output(UInt(64.W))
        val WB_valid = Output(Bool())
        // val MEM_pc = Output(UInt(64.W))
        val MEM_RegWriteData = Output(UInt(64.W))
        val stall   = Output(Bool())

        val IF_Inst = Output(UInt(32.W))
        val IF_valid = Output(Bool())

        val ID_ALU_Data1 = Output(UInt(64.W))
        val ID_ALU_Data2 = Output(UInt(64.W))
        val ID_Rs1Data = Output(UInt(64.W))
        val ID_Rs2Data = Output(UInt(64.W))
        val ALUResult = Output(UInt(64.W))
    })

    val inst_fetch_unit = Module(new IFU)
    val inst_decode_unit = Module(new IDU)
    val excute_unit = Module(new EXU)
    val pre_mem_unit = Module(new MEM_pre_stage)
    val mem_unit = Module(new MEMU)
    val wb_unit = Module(new WBU)

    val inst_ram     = Module(new sim_sram)

    io.IF_Inst  := inst_fetch_unit.io.IF_to_ID_bus.bits.Inst
    io.IF_valid := inst_fetch_unit.io.IF_to_ID_bus.valid
    io.PF_axidata := inst_fetch_unit.io.axidata
    io.ID_npc   := inst_decode_unit.io.ID_npc
    io.PF_npc   := inst_fetch_unit.io.PF_npc
    io.PF_pc := inst_fetch_unit.io.PF_pc
    io.IF_pc := inst_fetch_unit.io.IF_to_ID_bus.bits.PC
    io.ID_pc := inst_decode_unit.io.ID_to_EX_bus.bits.PC
    io.EX_pc := excute_unit.io.EX_to_MEM_bus.bits.PC
    io.PMEM_pc := pre_mem_unit.io.PMEM_to_MEM_bus.bits.PC
    io.WB_pc := wb_unit.io.WB_pc
    io.WB_Inst := wb_unit.io.WB_Inst
    io.WB_RegWriteData := wb_unit.io.WB_to_ID_forward.bits.regWriteData
    io.WB_RegWriteID   := wb_unit.io.WB_to_ID_forward.bits.regWriteID
    io.WB_valid     := wb_unit.io.WB_to_ID_forward.valid
    io.MEM_RegWriteData := pre_mem_unit.axi_lite.readData.bits.data
    
    io.ID_ALU_Data1 := inst_decode_unit.io.ID_to_EX_bus.bits.ALU_Data1
    io.ID_ALU_Data2 := inst_decode_unit.io.ID_to_EX_bus.bits.ALU_Data2
    io.ID_Rs1Data := inst_decode_unit.io.ID_to_EX_bus.bits.rs1_data
    io.ID_Rs2Data := inst_decode_unit.io.ID_to_EX_bus.bits.rs2_data
    io.ALUResult  := excute_unit.io.EX_to_MEM_bus.bits.ALU_result
    io.stall := inst_decode_unit.io.ID_stall
    
    val simulate = Module(new sim)
    
    simulate.io.IF_pc                       := inst_fetch_unit.io.IF_to_ID_bus.bits.PC
    simulate.io.GPR                         := inst_decode_unit.io.ID_GPR
    simulate.io.WB_Inst                     := wb_unit.io.WB_Inst
    simulate.io.unknown_inst_flag           := inst_decode_unit.io.ID_unknown_inst

    inst_fetch_unit.io.ID_npc               := inst_decode_unit.io.ID_npc
    
    inst_decode_unit.io.IF_to_ID_bus        <> inst_fetch_unit.io.IF_to_ID_bus
    inst_decode_unit.io.WB_to_ID_forward    <> wb_unit.io.WB_to_ID_forward
    inst_decode_unit.io.PMEM_to_ID_forward  <> pre_mem_unit.io.PMEM_to_ID_forward
    inst_decode_unit.io.MEM_to_ID_forward   <> mem_unit.io.MEM_to_ID_forward
    inst_decode_unit.io.EX_ALUResult        := excute_unit.io.EX_ALUResult_Pass

    excute_unit.io.ID_to_EX_bus             <> inst_decode_unit.io.ID_to_EX_bus
    excute_unit.io.MEM_regWriteData         := mem_unit.io.MEM_to_ID_forward.bits.regWriteData
    excute_unit.io.WB_to_EX_forward         <> wb_unit.io.WB_to_ID_forward

    //PMEM
    pre_mem_unit.io.EX_to_MEM_bus           <> excute_unit.io.EX_to_MEM_bus

    //PMEM END

    mem_unit.io.PMEM_to_MEM_bus             <> pre_mem_unit.io.PMEM_to_MEM_bus
    mem_unit.io.memReadData                 := pre_mem_unit.io.memReadData

    wb_unit.io.MEM_to_WB_bus                <> mem_unit.io.MEM_to_WB_bus


    val ram_unit = Module(new RAMU)
    val arb = Module(new AXI_Arbiter(2))
    ram_unit.axi_lite <> arb.out
    arb.in(0) <> pre_mem_unit.axi_lite
    arb.req(0) <> pre_mem_unit.axi_req
    arb.in(1) <> inst_fetch_unit.axi_lite
    arb.req(1) <> inst_fetch_unit.axi_req
}

class AXI_Arbiter(val n: Int) extends Module{
    val in = IO(Flipped(Vec(n, new AXILiteMasterIF(32, 64))))
    val req = IO(Flipped(Vec(n, new MyReadyValidIO)))
    val out = IO(new AXILiteMasterIF(32, 64))

    out <> in(n-1)
    for(i <- n - 1 to 0 by -1){
        req(i).ready                := 0.U
        in(i).readAddr.ready        := 0.U
        in(i).readData.valid        := 0.U
        in(i).readData.bits.data    := 0.U 
        in(i).readData.bits.resp    := 0.U
        in(i).writeAddr.ready       := 0.U
        in(i).writeData.ready       := 0.U
        in(i).writeResp.valid       := 0.U
        in(i).writeResp.bits.resp   := 0.U
        when(req(i).valid){
            out <> in(i)
            req(i).ready := 1.U
            for(j <- i+1 to n-1){
                req(j).ready := 0.U
            }
        }
    }
}

class RAMU extends Module{
    val axi_lite = IO(Flipped(new AXILiteMasterIF(32, 64)))
    val data_ram = Module(new sim_sram)

    //data ram
    data_ram.io.pc                          := 0.U

    data_ram.io.aclk                        := clock
    data_ram.io.aresetn                     := !reset.asBool
    //ar
    data_ram.io.araddr                      := axi_lite.readAddr.bits.addr
    data_ram.io.arvalid                     := axi_lite.readAddr.valid
    axi_lite.readAddr.ready                 := data_ram.io.arready
    //r
    axi_lite.readData.bits.data             := data_ram.io.rdata
    axi_lite.readData.bits.resp             := data_ram.io.rresp
    axi_lite.readData.valid                 := data_ram.io.rvalid
    data_ram.io.rready                      := axi_lite.readData.ready
    //aw
    data_ram.io.awaddr                      := axi_lite.writeAddr.bits.addr
    data_ram.io.awvalid                     := axi_lite.writeAddr.valid
    axi_lite.writeAddr.ready                := data_ram.io.awready
    //w
    data_ram.io.wdata                       := axi_lite.writeData.bits.data
    data_ram.io.wstrb                       := axi_lite.writeData.bits.strb
    data_ram.io.wvalid                      := axi_lite.writeData.valid
    axi_lite.writeData.ready                := data_ram.io.wready
    //b
    axi_lite.writeResp.bits.resp            := data_ram.io.bresp
    axi_lite.writeResp.valid                := data_ram.io.bvalid
    data_ram.io.bready                      := axi_lite.writeResp.ready

}