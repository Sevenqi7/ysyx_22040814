module top(
  input        clock,
  input        reset,
  input  [7:0] io_sw,
  output [6:0] io_seg_0,
  output [6:0] io_seg_1,
  output [6:0] io_seg_2,
  output [6:0] io_seg_3,
  output [6:0] io_seg_4,
  output [6:0] io_seg_5,
  output [6:0] io_seg_6,
  output [6:0] io_seg_7,
  input        io_sw_ctrl
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] seg0decoder_io_in; // @[top.scala 14:29]
  wire [6:0] seg0decoder_io_out; // @[top.scala 14:29]
  wire [7:0] seg1decoder_io_in; // @[top.scala 15:29]
  wire [6:0] seg1decoder_io_out; // @[top.scala 15:29]
  reg [7:0] shiftReg; // @[top.scala 13:27]
  wire  newVal = shiftReg[0] ^ shiftReg[2] ^ shiftReg[3] ^ shiftReg[4]; // @[top.scala 16:58]
  wire [7:0] _shiftReg_T_1 = {newVal,shiftReg[7:1]}; // @[Cat.scala 33:92]
  DE10HexDecoder seg0decoder ( // @[top.scala 14:29]
    .io_in(seg0decoder_io_in),
    .io_out(seg0decoder_io_out)
  );
  DE10HexDecoder seg1decoder ( // @[top.scala 15:29]
    .io_in(seg1decoder_io_in),
    .io_out(seg1decoder_io_out)
  );
  assign io_seg_0 = seg0decoder_io_out; // @[top.scala 26:15]
  assign io_seg_1 = seg1decoder_io_out; // @[top.scala 27:15]
  assign io_seg_2 = 7'h7f; // @[top.scala 29:19]
  assign io_seg_3 = 7'h7f; // @[top.scala 29:19]
  assign io_seg_4 = 7'h7f; // @[top.scala 29:19]
  assign io_seg_5 = 7'h7f; // @[top.scala 29:19]
  assign io_seg_6 = 7'h7f; // @[top.scala 29:19]
  assign io_seg_7 = 7'h7f; // @[top.scala 29:19]
  assign seg0decoder_io_in = {{4'd0}, shiftReg[3:0]}; // @[top.scala 24:23]
  assign seg1decoder_io_in = {{4'd0}, shiftReg[7:4]}; // @[top.scala 25:23]
  always @(posedge clock) begin
    if (reset) begin // @[top.scala 13:27]
      shiftReg <= 8'h0; // @[top.scala 13:27]
    end else if (~io_sw_ctrl) begin // @[top.scala 17:29]
      shiftReg <= _shiftReg_T_1; // @[top.scala 18:18]
    end else begin
      shiftReg <= io_sw; // @[top.scala 21:18]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  shiftReg = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
