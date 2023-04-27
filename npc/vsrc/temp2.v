  AXI_Arbiter arb (	// top.scala:153:21
    .in_0_writeAddr_valid     (_pre_mem_unit_axi_lite_writeAddr_valid),	// top.scala:68:30
    .in_0_writeAddr_bits_addr (_pre_mem_unit_axi_lite_writeAddr_bits_addr),	// top.scala:68:30
    .in_0_writeData_valid     (_pre_mem_unit_axi_lite_writeData_valid),	// top.scala:68:30
    .in_0_writeData_bits_data (_pre_mem_unit_axi_lite_writeData_bits_data),	// top.scala:68:30
    .in_0_writeData_bits_strb (_pre_mem_unit_axi_lite_writeData_bits_strb),	// top.scala:68:30
    .in_0_writeResp_ready     (_pre_mem_unit_axi_lite_writeResp_ready),	// top.scala:68:30
    .in_0_readAddr_valid      (_pre_mem_unit_axi_lite_readAddr_valid),	// top.scala:68:30
    .in_0_readAddr_bits_addr  (_pre_mem_unit_axi_lite_readAddr_bits_addr),	// top.scala:68:30
    .in_0_readData_ready      (_pre_mem_unit_axi_lite_readData_ready),	// top.scala:68:30
    .in_1_readAddr_valid      (_inst_fetch_unit_axi_lite_readAddr_valid),	// top.scala:65:33
    .in_1_readAddr_bits_addr  (_inst_fetch_unit_axi_lite_readAddr_bits_addr),	// top.scala:65:33
    .in_1_readData_ready      (_inst_fetch_unit_axi_lite_readData_ready),	// top.scala:65:33
    .req_0_valid              (_pre_mem_unit_axi_req_valid),	// top.scala:68:30
    .out_readData_valid       (_ram_unit_axi_lite_readData_valid),	// top.scala:152:26
    .out_readData_bits_data   (_ram_unit_axi_lite_readData_bits_data),	// top.scala:152:26
    .out_readData_bits_resp   (_ram_unit_axi_lite_readData_bits_resp),	// top.scala:152:26
    .in_0_readData_bits_data  (_arb_in_0_readData_bits_data),
    .in_1_readData_valid      (_arb_in_1_readData_valid),
    .in_1_readData_bits_data  (_arb_in_1_readData_bits_data),
    .in_1_readData_bits_resp  (_arb_in_1_readData_bits_resp),
    .req_0_ready              (io_MEM_AXIREQ),
    .req_1_ready              (_arb_req_1_ready),
    .out_writeAddr_valid      (_arb_out_writeAddr_valid),
    .out_writeAddr_bits_addr  (_arb_out_writeAddr_bits_addr),
    .out_writeData_valid      (_arb_out_writeData_valid),
    .out_writeData_bits_data  (_arb_out_writeData_bits_data),
    .out_writeData_bits_strb  (_arb_out_writeData_bits_strb),
    .out_writeResp_ready      (_arb_out_writeResp_ready),
    .out_readAddr_valid       (_arb_out_readAddr_valid),
    .out_readAddr_bits_addr   (_arb_out_readAddr_bits_addr),
    .out_readData_ready       (_arb_out_readData_ready)
  );
  assign io_ID_npc = _inst_decode_unit_io_ID_to_BPU_bus_bits_br_target;	// <stdin>:2400:10, top.scala:66:34
  assign io_PF_pc = _inst_fetch_unit_io_PF_pc;	// <stdin>:2400:10, top.scala:65:33
  assign io_PF_axidata = _inst_fetch_unit_io_axidata;	// <stdin>:2400:10, top.scala:65:33
  assign io_IF_pc = _inst_fetch_unit_io_IF_to_ID_bus_bits_PC;	// <stdin>:2400:10, top.scala:65:33
  assign io_ID_pc = _inst_decode_unit_io_ID_to_EX_bus_bits_PC;	// <stdin>:2400:10, top.scala:66:34
  assign io_EX_pc = _excute_unit_io_EX_to_MEM_bus_bits_PC;	// <stdin>:2400:10, top.scala:67:29
  assign io_PMEM_pc = _pre_mem_unit_io_PMEM_to_MEM_bus_bits_PC;	// <stdin>:2400:10, top.scala:68:30
  assign io_WB_Inst = _wb_unit_io_WB_Inst;	// <stdin>:2400:10, top.scala:70:25
  assign io_WB_RegWriteData = _wb_unit_io_WB_to_ID_forward_bits_regWriteData;	// <stdin>:2400:10, top.scala:70:25
  assign io_WB_RegWriteID = {59'h0, _wb_unit_io_WB_to_ID_forward_bits_regWriteID};	// <stdin>:2400:10, top.scala:70:25, :102:24
  assign io_MEM_RegWriteData = _arb_in_0_readData_bits_data;	// <stdin>:2400:10, top.scala:153:21
  assign io_bp_npc = _bp_unit_io_bp_npc;	// <stdin>:2400:10, top.scala:64:33
  assign io_bp_taken = _bp_unit_io_bp_taken;	// <stdin>:2400:10, top.scala:64:33
  assign io_bp_flush = _bp_unit_io_bp_flush;	// <stdin>:2400:10, top.scala:64:33
  assign io_IF_Inst = _inst_fetch_unit_io_IF_to_ID_bus_bits_Inst;	// <stdin>:2400:10, top.scala:65:33
  assign io_IF_valid = _inst_fetch_unit_io_IF_to_ID_bus_valid;	// <stdin>:2400:10, top.scala:65:33
  assign io_IF_AXIREQ = _arb_req_1_ready;	// <stdin>:2400:10, top.scala:153:21
  assign io_ID_ALU_Data1 = _inst_decode_unit_io_ID_to_EX_bus_bits_ALU_Data1;	// <stdin>:2400:10, top.scala:66:34
  assign io_ID_ALU_Data2 = _inst_decode_unit_io_ID_to_EX_bus_bits_ALU_Data2;	// <stdin>:2400:10, top.scala:66:34
  assign io_ID_Rs2Data = _inst_decode_unit_io_ID_to_EX_bus_bits_rs2_data;	// <stdin>:2400:10, top.scala:66:34
  assign io_ALUResult = _excute_unit_io_EX_to_MEM_bus_bits_ALU_result;	// <stdin>:2400:10, top.scala:67:29
endmodule


// ----- 8< ----- FILE "./build/sim_sram.v" ----- 8< -----

import "DPI-C" function void dci_pmem_write(input longint waddr, input longint wdata, input byte wmask);
import "DPI-C" function void dci_pmem_read(input longint raddr, output longint rdata, input byte rmask);

module sim_sram(
    input       [63:0]      pc          ,         //for debug
    input                   aresetn     ,
    input                   aclk        ,
    //ar
    input       [31:0]      araddr      ,
    input                   arvalid     ,
    output                  arready     ,
    //r
    output      [63:0]      rdata       ,
    output      [1: 0]      rresp       ,
    output                  rvalid      ,
    input                   rready      ,
    //aw
    input       [31:0]      awaddr      ,
    input                   awvalid     ,
    output                  awready     , 
    //w
    input       [63:0]      wdata       , 
    input       [7: 0]      wstrb       ,
    input                   wvalid      ,
    output                  wready      ,
    //b
    output      [1: 0]      bresp       ,
    output                  bvalid      ,
    input                   bready
);

    reg arready_r, rvalid_r, awready_r, wready_r, bvalid_r;
    reg [1:0] rresp_r, bresp_r;
    reg [63:0] rdata_r;
    reg [31:0] awaddr_r;
 
    assign arready = arready_r;
    assign rvalid = rvalid_r;
    assign awready = awready_r;
    assign wready = wready_r;
    assign bvalid = bvalid_r;
    assign rresp = rresp_r;
    assign bresp = bresp_r;
    assign rdata = rdata_r;

    //ar      
    always@(posedge aclk) begin
        if(!aresetn) begin
            arready_r <= 1'b1;
        end
        else if(arvalid) begin
            arready_r <= 1'b1;
        end
        else 
            arready_r <= 1'b1;
    end

    //rresp
    always@(posedge aclk) begin
        if(!aresetn) begin
            rvalid_r <= 1'b0;
            rresp_r  <= 2'b0;
        end
        else begin
            if(arready_r & arvalid) begin
                rvalid_r <= 1'b1;
                rresp_r  <= 2'b00;
            end
            else if(rvalid_r & rready) begin
                rvalid_r <= 1'b0;
            end
        end 
    end

    //r
    always@(posedge aclk) begin
        if(!aresetn) begin
            rdata_r = 64'b0;
        end
        else begin
            if(arready_r & arvalid) begin
                dci_pmem_read({32'H0000, araddr}, rdata_r, 8'HFF);
                // $display("raddr:0x%x rdata:0x%x", araddr, rdata);
            end
        end
        // $display("addr:0x%x, rdata:0x%x", araddr_r, rdata_r);
    end

    //aw
    always@(posedge aclk) begin
        if(!aresetn) begin
            awready_r <= 1'b1;
            awaddr_r <= 32'b0;
        end
        else begin
            if(awvalid) begin
                awaddr_r <= awaddr;
                awready_r <= 1'b1;
            end
        end
    end

    //w
    always@(posedge aclk) begin
        if(!aresetn) begin
            wready_r <= 1'b1;
        end
        else begin
            if(wvalid & awvalid)  begin
                dci_pmem_write({32'H0000, awaddr}, wdata, wstrb);
            end
        end
    end

    //b
    always@(posedge aclk) begin
        if(!aresetn) begin
            bvalid_r <= 1'b0;
            bresp_r  <= 2'b00;
        end
        else begin
            if(wready_r & wvalid & wready_r) begin
                bvalid_r <= 1'b1;
                bresp_r  <= 2'b00;
            end
            else if(bready & bvalid_r)
                bvalid_r <= 1'b0;
        end
    end

endmodule

// ----- 8< ----- FILE "./build/sim.v" ----- 8< -----

import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
import "DPI-C" function void unknown_inst();
import "DPI-C" function void ebreak(input longint halt_ret);

module sim(input[63:0] IF_pc, input [63:0] GPR [31:0], input unknown_inst_flag, input[31:0] WB_Inst);

   initial begin
      if ($test$plusargs("trace") != 0) begin
         $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
         $dumpfile("logs/vlt_dump.vcd");
         $dumpvars();
      end
      $display("[%0t] Model running...\n", $time);
   end

   initial set_gpr_ptr(GPR);    // rf为通用寄存器的二维数组变量

  always@(*) begin
      reg [63:0] i = GPR[10][63:0];
      if(unknown_inst_flag) unknown_inst();
      if(WB_Inst[31:0] == 32'h00100073) begin
        ebreak(i);
        $finish();
      end
  end

endmodule

// ----- 8< ----- FILE "firrtl_black_box_resource_files.f" ----- 8< -----

