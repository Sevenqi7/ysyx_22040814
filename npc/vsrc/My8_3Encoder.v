module My8_3Encoder(
  input  [7:0] io_in,
  output [2:0] io_out,
  input        io_en
);
  wire [1:0] _GEN_2 = io_in[2] ? 2'h2 : {{1'd0}, io_in[1]}; // @[My8_3Encoder.scala 28:34 29:18]
  wire [1:0] _GEN_3 = io_in[3] ? 2'h3 : _GEN_2; // @[My8_3Encoder.scala 25:34 26:18]
  wire [2:0] _GEN_4 = io_in[4] ? 3'h4 : {{1'd0}, _GEN_3}; // @[My8_3Encoder.scala 22:34 23:18]
  wire [2:0] _GEN_5 = io_in[5] ? 3'h5 : _GEN_4; // @[My8_3Encoder.scala 19:34 20:18]
  wire [2:0] _GEN_6 = io_in[6] ? 3'h6 : _GEN_5; // @[My8_3Encoder.scala 16:34 17:18]
  wire [2:0] _GEN_7 = io_in[7] ? 3'h7 : _GEN_6; // @[My8_3Encoder.scala 13:29 14:18]
  assign io_out = io_en ? _GEN_7 : 3'h0; // @[My8_3Encoder.scala 12:16 39:14]
endmodule
