module top(
  input  [8:0] io_sw,
  output [3:0] io_led,
  output [6:0] io_seg0,
  output [6:0] io_seg1,
  output [6:0] io_seg2,
  output [6:0] io_seg3,
  output [6:0] io_seg4,
  output [6:0] io_seg5,
  output [6:0] io_seg6,
  output [6:0] io_seg7
);
  wire [7:0] encoder_io_in; // @[top.scala 13:25]
  wire [2:0] encoder_io_out; // @[top.scala 13:25]
  wire  encoder_io_en; // @[top.scala 13:25]
  wire [2:0] DE10_io_in; // @[top.scala 14:22]
  wire [6:0] DE10_io_out; // @[top.scala 14:22]
  wire flag;
  My8_3Encoder encoder ( // @[top.scala 13:25]
    .io_in(encoder_io_in),
    .io_out(encoder_io_out),
    .io_en(encoder_io_en)
  );
  DE10Decoder DE10 ( // @[top.scala 14:22]
    .io_in(DE10_io_in),
    .io_out(DE10_io_out)
  );
  assign flag = encoder_io_out > 0;
  assign io_led = {flag,encoder_io_out}; // @[Cat.scala 33:92]
  assign io_seg0 = DE10_io_out; // @[top.scala 18:13]
  assign encoder_io_in = io_sw[7:0]; // @[top.scala 16:27]
  assign encoder_io_en = io_sw[8]; // @[top.scala 15:27]
  assign DE10_io_in = encoder_io_out; // @[top.scala 17:16]
  assign io_seg0 = 7'b1111111;
  assign io_seg1 = 7'b1111111;
  assign io_seg2 = 7'b1111111;
  assign io_seg3 = 7'b1111111;
  assign io_seg4 = 7'b1111111;
  assign io_seg5 = 7'b1111111;
  assign io_seg6 = 7'b1111111;
  assign io_seg7 = 7'b1111111;

endmodule
