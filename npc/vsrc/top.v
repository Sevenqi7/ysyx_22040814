module top(
    input clk,
    input in1,
    input in2,
    output reg out
);


always@(posedge  clk) begin
      out <= in1 | in2;
      //$finish;
      $display("output");
end

   initial begin
      if ($test$plusargs("trace") != 0) begin
         $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
         $dumpfile("logs/vlt_dump.vcd");
         $dumpvars();
      end
      $display("[%0t] Model running...\n", $time);
   end

endmodule
