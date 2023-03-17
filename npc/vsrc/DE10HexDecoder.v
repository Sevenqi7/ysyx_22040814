module DE10HexDecoder(
  input  [7:0] io_in,
  output [6:0] io_out
);
  wire [6:0] offlight = 7'b1111111;
  wire [6:0] _GEN_0 = io_in == 8'hf ? 7'he : offlight; // @[DE10Decoder.scala 11:12 27:{30,39}]
  wire [6:0] _GEN_1 = io_in == 8'he ? 7'h6 : _GEN_0; // @[DE10Decoder.scala 26:{30,39}]
  wire [6:0] _GEN_2 = io_in == 8'hd ? 7'h21 : _GEN_1; // @[DE10Decoder.scala 25:{30,39}]
  wire [6:0] _GEN_3 = io_in == 8'hc ? 7'h46 : _GEN_2; // @[DE10Decoder.scala 24:{30,39}]
  wire [6:0] _GEN_4 = io_in == 8'hb ? 7'h3 : _GEN_3; // @[DE10Decoder.scala 23:{30,39}]
  wire [6:0] _GEN_5 = io_in == 8'ha ? 7'h8 : _GEN_4; // @[DE10Decoder.scala 22:{30,39}]
  wire [6:0] _GEN_6 = io_in == 8'h9 ? 7'h10 : _GEN_5; // @[DE10Decoder.scala 21:{30,39}]
  wire [6:0] _GEN_7 = io_in == 8'h8 ? 7'h0 : _GEN_6; // @[DE10Decoder.scala 20:{30,39}]
  wire [6:0] _GEN_8 = io_in == 8'h7 ? 7'h78 : _GEN_7; // @[DE10Decoder.scala 19:{30,39}]
  wire [6:0] _GEN_9 = io_in == 8'h6 ? 7'h2 : _GEN_8; // @[DE10Decoder.scala 18:{30,39}]
  wire [6:0] _GEN_10 = io_in == 8'h5 ? 7'h12 : _GEN_9; // @[DE10Decoder.scala 17:{30,39}]
  wire [6:0] _GEN_11 = io_in == 8'h4 ? 7'h19 : _GEN_10; // @[DE10Decoder.scala 16:{30,39}]
  wire [6:0] _GEN_12 = io_in == 8'h3 ? 7'h30 : _GEN_11; // @[DE10Decoder.scala 15:{30,39}]
  wire [6:0] _GEN_13 = io_in == 8'h2 ? 7'h24 : _GEN_12; // @[DE10Decoder.scala 14:{30,39}]
  wire [6:0] _GEN_14 = io_in == 8'h1 ? 7'h79 : _GEN_13; // @[DE10Decoder.scala 13:{30,39}]
  assign io_out = io_in == 8'h0 ? 7'h40 : _GEN_14; // @[DE10Decoder.scala 12:{25,34}]
endmodule
