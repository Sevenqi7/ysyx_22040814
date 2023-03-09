module MyParameterizedMux(
  input  [1:0] io_in_0,
  input  [1:0] io_in_1,
  input  [1:0] io_in_2,
  input  [1:0] io_in_3,
  input  [1:0] io_select,
  output [1:0] io_out
);
  wire [1:0] _GEN_1 = 2'h1 == io_select ? io_in_1 : io_in_0; // @[MyParameterizedMux.scala 19:{12,12}]
  wire [1:0] _GEN_2 = 2'h2 == io_select ? io_in_2 : _GEN_1; // @[MyParameterizedMux.scala 19:{12,12}]
  assign io_out = 2'h3 == io_select ? io_in_3 : _GEN_2; // @[MyParameterizedMux.scala 19:{12,12}]
endmodule
