import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
import "DPI-C" function void ebreak(input int halt_ret);

module sim(input [31:0] inst, input [63:0] GPR [31:0]);

   initial begin
      if ($test$plusargs("trace") != 0) begin
         $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
         $dumpfile("logs/vlt_dump.vcd");
         $dumpvars();
      end
      $display("[%0t] Model running...\n", $time);
   end

   initial set_gpr_ptr(rf);    // rf为通用寄存器的二维数组变量

   always@(*) begin
      integer  i = GPR[10][31:0];
      if(inst == 32'h00100073) begin
         ebreak(i);
         $finish();
      end
   end

endmodule
