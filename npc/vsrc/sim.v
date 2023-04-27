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
