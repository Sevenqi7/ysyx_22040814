import "DPI-C" function void ebreak();

`define EBREAK_INST 0x00100073

module sim(input [31:0] inst);

   initial begin
      if ($test$plusargs("trace") != 0) begin
         $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
         $dumpfile("logs/vlt_dump.vcd");
         $dumpvars();
      end
      $display("[%0t] Model running...\n", $time);
   end

   always@(INST == EBREAK_INST) begin
      if(flag) begin
         $display("EBREAK detected, ending simulate...\n");
         $finish();
      end
   end

endmodule
