import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
import "DPI-C" function void unknown_inst();
import "DPI-C" function void ebreak(input longint halt_ret);


wire [63:0] GPR [31:0];
assign {GPR[31], GPR[30], GPR[29], GPR[28], GPR[27], GPR[26], GPR[25], GPR[24], GPR[23], GPR[22], GPR[21], GPR[20]
, GPR[19], GPR[18], GPR[17], GPR[16], GPR[15], GPR[14], GPR[13], GPR[12], GPR[11], GPR[10], GPR[9], GPR[8], GPR[7]
, GPR[6], GPR[5], GPR[4], GPR[3], GPR[2], GPR[1], GPR[0]} = 
{{_inst_decode_unit_io_ID_GPR_31}, {_inst_decode_unit_io_ID_GPR_30}, {_inst_decode_unit_io_ID_GPR_29}, 
{_inst_decode_unit_io_ID_GPR_28}, {_inst_decode_unit_io_ID_GPR_27}, {_inst_decode_unit_io_ID_GPR_26}, {_inst_decode_unit_io_ID_GPR_25}, 
{_inst_decode_unit_io_ID_GPR_24}, {_inst_decode_unit_io_ID_GPR_23}, {_inst_decode_unit_io_ID_GPR_22}, {_inst_decode_unit_io_ID_GPR_21}, 
{_inst_decode_unit_io_ID_GPR_20}, {_inst_decode_unit_io_ID_GPR_19}, {_inst_decode_unit_io_ID_GPR_18}, {_inst_decode_unit_io_ID_GPR_17}, 
{_inst_decode_unit_io_ID_GPR_16}, {_inst_decode_unit_io_ID_GPR_15}, {_inst_decode_unit_io_ID_GPR_14}, {_inst_decode_unit_io_ID_GPR_13}, 
{_inst_decode_unit_io_ID_GPR_12}, {_inst_decode_unit_io_ID_GPR_11}, {_inst_decode_unit_io_ID_GPR_10}, {_inst_decode_unit_io_ID_GPR_9 }, 
{_inst_decode_unit_io_ID_GPR_8 }, {_inst_decode_unit_io_ID_GPR_7 }, {_inst_decode_unit_io_ID_GPR_6 }, {_inst_decode_unit_io_ID_GPR_5 },
{_inst_decode_unit_io_ID_GPR_4 }, {_inst_decode_unit_io_ID_GPR_3 }, {_inst_decode_unit_io_ID_GPR_2 }, {_inst_decode_unit_io_ID_GPR_1 }, 
{_inst_decode_unit_io_ID_GPR_0}};	// IDU.scala:55:22, :66:20

sim simulate (	// top.scala:24:26
   .IF_pc             (_inst_fetch_unit_io_IF_to_ID_bus_PC),	// top.scala:24:33
   .WB_Inst           (io_WB_Inst),
   .GPR               (GPR),
   .unknown_inst_flag(_inst_decode_unit_io_ID_unknown_inst)
);

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
