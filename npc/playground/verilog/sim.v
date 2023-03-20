import "DPI-C" function int is_ebreak(input unsigned int inst);

module sim(input [31:0] inst);

   initial begin
      if ($test$plusargs("trace") != 0) begin
         $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
         $dumpfile("logs/vlt_dump.vcd");
         $dumpvars();
      end
      $display("[%0t] Model running...\n", $time);
   end

   reg flag
   always@(*) begin
      flag = is_ebreak(inst);
      if(flag)
      {
         $display("EBREAK detected, ending simulate...\n");
         $finish();
      }
   end

endmodule
