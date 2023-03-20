import "DPI-C" function void ebreak(output unsigned halt_ret);

module sim(input [31:0] inst, input [63:0] R10);

   initial begin
      if ($test$plusargs("trace") != 0) begin
         $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
         $dumpfile("logs/vlt_dump.vcd");
         $dumpvars();
      end
      $display("[%0t] Model running...\n", $time);
   end

   always@(*) begin
      integer  i = R10[31:0];
      if(inst == 32'h00100073) begin
         ebreak(i);
         $finish();
      end
   end

endmodule
