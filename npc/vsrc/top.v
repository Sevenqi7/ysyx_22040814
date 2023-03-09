module top(
  input  [9:0] io_sw,
  output [1:0] io_led
);
  wire [1:0] twobitsmux4_1_io_in_0; // @[top.scala 12:31]
  wire [1:0] twobitsmux4_1_io_in_1; // @[top.scala 12:31]
  wire [1:0] twobitsmux4_1_io_in_2; // @[top.scala 12:31]
  wire [1:0] twobitsmux4_1_io_in_3; // @[top.scala 12:31]
  wire [1:0] twobitsmux4_1_io_select; // @[top.scala 12:31]
  wire [1:0] twobitsmux4_1_io_out; // @[top.scala 12:31]
  MyParameterizedMux twobitsmux4_1 ( // @[top.scala 12:31]
    .io_in_0(twobitsmux4_1_io_in_0),
    .io_in_1(twobitsmux4_1_io_in_1),
    .io_in_2(twobitsmux4_1_io_in_2),
    .io_in_3(twobitsmux4_1_io_in_3),
    .io_select(twobitsmux4_1_io_select),
    .io_out(twobitsmux4_1_io_out)
  );
  assign io_led = twobitsmux4_1_io_out; // @[top.scala 17:12]
  assign twobitsmux4_1_io_in_0 = io_sw[3:2]; // @[top.scala 15:40]
  assign twobitsmux4_1_io_in_1 = io_sw[5:4]; // @[top.scala 15:40]
  assign twobitsmux4_1_io_in_2 = io_sw[7:6]; // @[top.scala 15:40]
  assign twobitsmux4_1_io_in_3 = io_sw[9:8]; // @[top.scala 15:40]
  assign twobitsmux4_1_io_select = io_sw[1:0]; // @[top.scala 13:37]
endmodule

