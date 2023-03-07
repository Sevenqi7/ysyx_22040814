module top(
  input clk,
  input rst,
  input [1:0] sw,
  output [15:0] ledr
);
  wire led_sw;

  switch switch1(
    .a(sw[0]),
    .b(sw[1]),
    .f(led_sw)
  );

  led led1(
    .clk(clk),
    .rst(rst),
    .sw(led_sw),
    .ledr(ledr)
  );



// initial begin
//     if ($test$plusargs("trace") != 0) begin
//         $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
//         $dumpfile("logs/vlt_dump.vcd");
//         $dumpvars();
//     end
//         $display("[%0t] Model running...\n", $time);
//    end
endmodule
