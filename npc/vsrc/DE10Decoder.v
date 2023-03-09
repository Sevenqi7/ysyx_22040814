
module DE10Decoder(
  input  [2:0] io_in,
  output [6:0] io_out
);
  wire [3:0] _GEN_10 = {{1'd0}, io_in}; // @[DE10Decoder.scala 20:21]
  wire [4:0] _GEN_0 = _GEN_10 == 4'h9 ? 5'h10 : 5'h0; // @[DE10Decoder.scala 10:12 21:{30,39}]
  wire [4:0] _GEN_1 = _GEN_10 == 4'h8 ? 5'h0 : _GEN_0; // @[DE10Decoder.scala 20:{30,39}]
  wire [6:0] _GEN_2 = io_in == 3'h7 ? 7'h78 : {{2'd0}, _GEN_1}; // @[DE10Decoder.scala 19:{30,39}]
  wire [6:0] _GEN_3 = io_in == 3'h6 ? 7'h2 : _GEN_2; // @[DE10Decoder.scala 18:{30,39}]
  wire [6:0] _GEN_4 = io_in == 3'h5 ? 7'h12 : _GEN_3; // @[DE10Decoder.scala 17:{30,39}]
  wire [6:0] _GEN_5 = io_in == 3'h4 ? 7'h19 : _GEN_4; // @[DE10Decoder.scala 16:{30,39}]
  wire [6:0] _GEN_6 = io_in == 3'h3 ? 7'h30 : _GEN_5; // @[DE10Decoder.scala 15:{30,39}]
  wire [6:0] _GEN_7 = io_in == 3'h2 ? 7'h24 : _GEN_6; // @[DE10Decoder.scala 14:{30,39}]
  wire [6:0] _GEN_8 = io_in == 3'h1 ? 7'h79 : _GEN_7; // @[DE10Decoder.scala 13:{30,39}]
  assign io_out = io_in == 3'h0 ? 7'h40 : _GEN_8; // @[DE10Decoder.scala 12:{25,34}]
endmodule
