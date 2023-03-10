module top(
  input  [10:0] io_sw,
  output [2:0]  io_led,
  output [6:0]  io_seg_0,
  output [6:0]  io_seg_1,
  output [6:0]  io_seg_2,
  output [6:0]  io_seg_3,
  output [6:0]  io_seg_4,
  output [6:0]  io_seg_5,
  output [6:0]  io_seg_6,
  output [6:0]  io_seg_7
);
  wire [3:0] myalu_io_A; // @[top.scala 13:23]
  wire [3:0] myalu_io_B; // @[top.scala 13:23]
  wire [3:0] myalu_io_out; // @[top.scala 13:23]
  wire [2:0] myalu_io_op_type; // @[top.scala 13:23]
  wire  myalu_io_zero_flag; // @[top.scala 13:23]
  wire  myalu_io_carry_flag; // @[top.scala 13:23]
  wire  myalu_io_overflow_flag; // @[top.scala 13:23]
  wire [2:0] seg0decoder_io_in; // @[top.scala 19:29]
  wire [6:0] seg0decoder_io_out; // @[top.scala 19:29]
  wire [2:0] seg1decoder_io_in; // @[top.scala 20:29]
  wire [6:0] seg1decoder_io_out; // @[top.scala 20:29]
  wire [3:0] _seg0decoder_io_in_T = myalu_io_out % 4'ha; // @[top.scala 21:39]
  wire [3:0] _seg1decoder_io_in_T = myalu_io_out / 4'ha; // @[top.scala 22:39]
  wire [1:0] _io_led_T = {myalu_io_overflow_flag,myalu_io_carry_flag}; // @[Cat.scala 33:92]
  MyALU myalu ( // @[top.scala 13:23]
    .io_A(myalu_io_A),
    .io_B(myalu_io_B),
    .io_out(myalu_io_out),
    .io_op_type(myalu_io_op_type),
    .io_zero_flag(myalu_io_zero_flag),
    .io_carry_flag(myalu_io_carry_flag),
    .io_overflow_flag(myalu_io_overflow_flag)
  );
  DE10Decoder seg0decoder ( // @[top.scala 19:29]
    .io_in(seg0decoder_io_in),
    .io_out(seg0decoder_io_out)
  );
  DE10Decoder seg1decoder ( // @[top.scala 20:29]
    .io_in(seg1decoder_io_in),
    .io_out(seg1decoder_io_out)
  );
  assign io_led = {_io_led_T,myalu_io_zero_flag}; // @[Cat.scala 33:92]
  assign io_seg_0 = seg0decoder_io_out; // @[top.scala 24:15]
  assign io_seg_1 = seg1decoder_io_out; // @[top.scala 25:15]
  assign myalu_io_A = io_sw[3:0]; // @[top.scala 14:24]
  assign myalu_io_B = io_sw[7:4]; // @[top.scala 15:24]
  assign myalu_io_op_type = io_sw[10:8]; // @[top.scala 16:30]
  assign seg0decoder_io_in = _seg0decoder_io_in_T[2:0]; // @[top.scala 21:23]
  assign seg1decoder_io_in = _seg1decoder_io_in_T[2:0]; // @[top.scala 22:23]

  assign io_seg_2 = 7'b1111111; // @[top.scala 25:15]
  assign io_seg_3 = 7'b1111111; // @[top.scala 25:15]
  assign io_seg_4 = 7'b1111111; // @[top.scala 25:15]
  assign io_seg_5 = 7'b1111111; // @[top.scala 25:15]
  assign io_seg_6 = 7'b1111111; // @[top.scala 25:15]
  assign io_seg_7 = 7'b1111111; // @[top.scala 25:15]

endmodule
