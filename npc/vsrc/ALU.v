module MyALU(
  input  [3:0] io_A,
  input  [3:0] io_B,
  output [3:0] io_out,
  input  [2:0] io_op_type,
  output       io_zero_flag,
  output       io_carry_flag,
  output       io_overflow_flag
);
  wire [4:0] addResult = io_A + io_B; // @[ALU.scala 17:26]
  wire [4:0] subResult = io_A - io_B; // @[ALU.scala 18:26]
  wire [3:0] andResult = io_A & io_B; // @[ALU.scala 19:26]
  wire [3:0] orReuslt = io_A | io_B; // @[ALU.scala 20:25]
  wire [3:0] notResult = ~io_A; // @[ALU.scala 21:21]
  wire [3:0] xorResult = io_A ^ io_B; // @[ALU.scala 22:26]
  wire  cmpResult = $signed(io_A) < $signed(io_B); // @[ALU.scala 23:33]
  wire  equResult = io_A == io_B; // @[ALU.scala 24:26]
  wire  _io_out_T_7 = io_op_type == 3'h6 ? cmpResult : equResult; // @[ALU.scala 36:20]
  wire [3:0] _io_out_T_8 = io_op_type == 3'h5 ? xorResult : {{3'd0}, _io_out_T_7}; // @[ALU.scala 35:20]
  wire [3:0] _io_out_T_9 = io_op_type == 3'h4 ? orReuslt : _io_out_T_8; // @[ALU.scala 34:20]
  wire [3:0] _io_out_T_10 = io_op_type == 3'h3 ? andResult : _io_out_T_9; // @[ALU.scala 33:20]
  wire [3:0] _io_out_T_11 = io_op_type == 3'h2 ? notResult : _io_out_T_10; // @[ALU.scala 32:20]
  wire [4:0] _io_out_T_12 = io_op_type == 3'h1 ? subResult : {{1'd0}, _io_out_T_11}; // @[ALU.scala 31:20]
  wire [4:0] _io_out_T_13 = io_op_type == 3'h0 ? addResult : _io_out_T_12; // @[ALU.scala 30:18]
  assign io_out = _io_out_T_13[3:0]; // @[ALU.scala 30:12]
  assign io_zero_flag = io_out == 4'h0; // @[ALU.scala 28:28]
  assign io_carry_flag = addResult[4] | subResult[4]; // @[ALU.scala 27:35]
  assign io_overflow_flag = io_A[3] == io_B[3] & io_out[3] != io_A[3]; // @[ALU.scala 26:47]
endmodule