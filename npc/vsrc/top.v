// Generated by CIRCT unknown git version
// Standard header to adapt well known macros to our needs.
`ifdef RANDOMIZE_REG_INIT
  `define RANDOMIZE
`endif // RANDOMIZE_REG_INIT

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifdef RANDOMIZE
  `ifdef VERILATOR
    `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
  `else  // VERILATOR
    `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
  `endif // VERILATOR
`else  // RANDOMIZE
  `define INIT_RANDOM_PROLOG_
`endif // RANDOMIZE

// external module sim

module IFU(	// <stdin>:6:10
  input         clock,
                reset,
  input  [63:0] io_IF_npc,
  output [63:0] io_IF_pc);

  reg [63:0] pcReg;	// IFU.scala:9:24
  always @(posedge clock) begin
    if (reset)
      pcReg <= 64'h80000000;	// IFU.scala:9:24
    else
      pcReg <= io_IF_npc;	// IFU.scala:9:24
  end // always @(posedge)
  `ifndef SYNTHESIS	// <stdin>:6:10
    `ifdef FIRRTL_BEFORE_INITIAL	// <stdin>:6:10
      `FIRRTL_BEFORE_INITIAL	// <stdin>:6:10
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// <stdin>:6:10
      automatic logic [31:0] _RANDOM_0;	// <stdin>:6:10
      automatic logic [31:0] _RANDOM_1;	// <stdin>:6:10
      `ifdef INIT_RANDOM_PROLOG_	// <stdin>:6:10
        `INIT_RANDOM_PROLOG_	// <stdin>:6:10
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// <stdin>:6:10
        _RANDOM_0 = `RANDOM;	// <stdin>:6:10
        _RANDOM_1 = `RANDOM;	// <stdin>:6:10
        pcReg = {_RANDOM_0, _RANDOM_1};	// IFU.scala:9:24
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// <stdin>:6:10
      `FIRRTL_AFTER_INITIAL	// <stdin>:6:10
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_IF_pc = pcReg;	// <stdin>:6:10, IFU.scala:9:24
endmodule

module IDU(	// <stdin>:16:10
  input         clock,
                reset,
  input  [31:0] io_IF_Inst,
  input  [63:0] io_IF_pc,
                io_EX_RegWriteData,
  input  [4:0]  io_EX_RegWriteID,
  input         io_EX_RegWriteEn,
  output [63:0] io_ID_npc,
                io_ID_ALU_Data1,
                io_ID_ALU_Data2,
  output [3:0]  io_ID_optype,
  output [4:0]  io_ID_RegWriteID,
  output        io_ID_RegWriteEn);

  wire              _InstInfo_T_1 = io_IF_Inst == 32'h100073;	// Lookup.scala:31:38
  wire              _InstInfo_T_3 = io_IF_Inst[6:0] == 7'h17;	// Lookup.scala:31:38
  wire [9:0]        _GEN = {io_IF_Inst[14:12], io_IF_Inst[6:0]};	// Lookup.scala:31:38
  wire              _InstInfo_T_5 = _GEN == 10'h13;	// Lookup.scala:31:38
  wire              _InstInfo_T_7 = _GEN == 10'h67;	// Lookup.scala:31:38
  wire              _InstInfo_T_26 = io_IF_Inst[6:0] == 7'h6F;	// Lookup.scala:31:38
  wire [1:0]        _GEN_0 = _InstInfo_T_1 ? 2'h3 : _InstInfo_T_3 ? 2'h1 : _InstInfo_T_5 | _InstInfo_T_7 ? 2'h0 :
                {_InstInfo_T_26, 1'h0};	// IDU.scala:31:21, :34:21, Lookup.scala:31:38, :34:39
  wire [2:0]        InstInfo_2 = _InstInfo_T_1 ? 3'h0 : _InstInfo_T_3 ? 3'h1 : _InstInfo_T_5 ? 3'h2 : _InstInfo_T_7 |
                _InstInfo_T_26 ? 3'h5 : 3'h0;	// IDU.scala:110:35, Lookup.scala:31:38, :34:39
  wire [63:0]       _io_ID_ALU_Data1_T_5 = io_IF_pc + 64'h4;	// IDU.scala:53:25
  wire              _io_ID_RegWriteEn_T_5 = _GEN_0 == 2'h2;	// IDU.scala:55:19, Lookup.scala:34:39
  reg  [63:0]       GPR_0;	// IDU.scala:60:22
  reg  [63:0]       GPR_1;	// IDU.scala:60:22
  reg  [63:0]       GPR_2;	// IDU.scala:60:22
  reg  [63:0]       GPR_3;	// IDU.scala:60:22
  reg  [63:0]       GPR_4;	// IDU.scala:60:22
  reg  [63:0]       GPR_5;	// IDU.scala:60:22
  reg  [63:0]       GPR_6;	// IDU.scala:60:22
  reg  [63:0]       GPR_7;	// IDU.scala:60:22
  reg  [63:0]       GPR_8;	// IDU.scala:60:22
  reg  [63:0]       GPR_9;	// IDU.scala:60:22
  reg  [63:0]       GPR_10;	// IDU.scala:60:22
  reg  [63:0]       GPR_11;	// IDU.scala:60:22
  reg  [63:0]       GPR_12;	// IDU.scala:60:22
  reg  [63:0]       GPR_13;	// IDU.scala:60:22
  reg  [63:0]       GPR_14;	// IDU.scala:60:22
  reg  [63:0]       GPR_15;	// IDU.scala:60:22
  reg  [63:0]       GPR_16;	// IDU.scala:60:22
  reg  [63:0]       GPR_17;	// IDU.scala:60:22
  reg  [63:0]       GPR_18;	// IDU.scala:60:22
  reg  [63:0]       GPR_19;	// IDU.scala:60:22
  reg  [63:0]       GPR_20;	// IDU.scala:60:22
  reg  [63:0]       GPR_21;	// IDU.scala:60:22
  reg  [63:0]       GPR_22;	// IDU.scala:60:22
  reg  [63:0]       GPR_23;	// IDU.scala:60:22
  reg  [63:0]       GPR_24;	// IDU.scala:60:22
  reg  [63:0]       GPR_25;	// IDU.scala:60:22
  reg  [63:0]       GPR_26;	// IDU.scala:60:22
  reg  [63:0]       GPR_27;	// IDU.scala:60:22
  reg  [63:0]       GPR_28;	// IDU.scala:60:22
  reg  [63:0]       GPR_29;	// IDU.scala:60:22
  reg  [63:0]       GPR_30;	// IDU.scala:60:22
  reg  [63:0]       GPR_31;	// IDU.scala:60:22
  wire [31:0][63:0] _GEN_1 = {{GPR_31}, {GPR_30}, {GPR_29}, {GPR_28}, {GPR_27}, {GPR_26}, {GPR_25}, {GPR_24}, {GPR_23},
                {GPR_22}, {GPR_21}, {GPR_20}, {GPR_19}, {GPR_18}, {GPR_17}, {GPR_16}, {GPR_15}, {GPR_14},
                {GPR_13}, {GPR_12}, {GPR_11}, {GPR_10}, {GPR_9}, {GPR_8}, {GPR_7}, {GPR_6}, {GPR_5},
                {GPR_4}, {GPR_3}, {GPR_2}, {GPR_1}, {GPR_0}};	// IDU.scala:60:22, :71:20
  wire [63:0]       _GEN_2;	// IDU.scala:71:20
  /* synopsys infer_mux_override */
  assign _GEN_2 = _GEN_1[io_IF_Inst[19:15]] /* cadence map_to_mux */;	// IDU.scala:69:22, :71:20
  wire              _io_ID_RegWriteEn_T_1 = _GEN_0 == 2'h0;	// IDU.scala:31:21, :89:19, Lookup.scala:34:39
  wire              _io_ID_RegWriteEn_T_3 = _GEN_0 == 2'h1;	// IDU.scala:91:19, Lookup.scala:34:39
  always @(posedge clock) begin
    if (reset) begin
      GPR_0 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_1 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_2 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_3 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_4 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_5 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_6 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_7 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_8 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_9 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_10 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_11 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_12 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_13 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_14 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_15 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_16 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_17 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_18 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_19 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_20 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_21 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_22 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_23 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_24 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_25 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_26 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_27 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_28 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_29 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_30 <= 64'h0;	// IDU.scala:60:{22,30}
      GPR_31 <= 64'h0;	// IDU.scala:60:{22,30}
    end
    else begin
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h0)	// IDU.scala:46:63, :60:22, :75:5, :76:31
        GPR_0 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h1)	// IDU.scala:60:22, :75:5, :76:31
        GPR_1 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h2)	// IDU.scala:60:22, :75:5, :76:31
        GPR_2 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h3)	// IDU.scala:60:22, :75:5, :76:31
        GPR_3 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h4)	// IDU.scala:60:22, :75:5, :76:31
        GPR_4 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h5)	// IDU.scala:60:22, :75:5, :76:31
        GPR_5 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h6)	// IDU.scala:60:22, :75:5, :76:31
        GPR_6 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h7)	// IDU.scala:60:22, :75:5, :76:31
        GPR_7 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h8)	// IDU.scala:60:22, :75:5, :76:31
        GPR_8 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h9)	// IDU.scala:60:22, :75:5, :76:31
        GPR_9 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'hA)	// IDU.scala:60:22, :75:5, :76:31
        GPR_10 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'hB)	// IDU.scala:60:22, :75:5, :76:31
        GPR_11 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'hC)	// IDU.scala:60:22, :75:5, :76:31
        GPR_12 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'hD)	// IDU.scala:60:22, :75:5, :76:31
        GPR_13 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'hE)	// IDU.scala:60:22, :75:5, :76:31
        GPR_14 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'hF)	// IDU.scala:60:22, :75:5, :76:31
        GPR_15 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h10)	// IDU.scala:60:22, :75:5, :76:31
        GPR_16 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h11)	// IDU.scala:60:22, :75:5, :76:31
        GPR_17 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h12)	// IDU.scala:60:22, :75:5, :76:31
        GPR_18 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h13)	// IDU.scala:60:22, :75:5, :76:31, Lookup.scala:31:38
        GPR_19 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h14)	// IDU.scala:60:22, :75:5, :76:31
        GPR_20 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h15)	// IDU.scala:60:22, :75:5, :76:31
        GPR_21 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h16)	// IDU.scala:60:22, :75:5, :76:31
        GPR_22 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h17)	// IDU.scala:60:22, :75:5, :76:31, Lookup.scala:31:38
        GPR_23 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h18)	// IDU.scala:60:22, :75:5, :76:31
        GPR_24 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h19)	// IDU.scala:60:22, :75:5, :76:31
        GPR_25 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h1A)	// IDU.scala:60:22, :75:5, :76:31
        GPR_26 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h1B)	// IDU.scala:60:22, :75:5, :76:31
        GPR_27 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h1C)	// IDU.scala:60:22, :75:5, :76:31
        GPR_28 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h1D)	// IDU.scala:60:22, :75:5, :76:31
        GPR_29 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & io_EX_RegWriteID == 5'h1E)	// IDU.scala:60:22, :75:5, :76:31
        GPR_30 <= io_EX_RegWriteData;	// IDU.scala:60:22
      if (io_EX_RegWriteEn & (&io_EX_RegWriteID))	// IDU.scala:60:22, :75:5, :76:31
        GPR_31 <= io_EX_RegWriteData;	// IDU.scala:60:22
    end
  end // always @(posedge)
  `ifndef SYNTHESIS	// <stdin>:16:10
    `ifdef FIRRTL_BEFORE_INITIAL	// <stdin>:16:10
      `FIRRTL_BEFORE_INITIAL	// <stdin>:16:10
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_0;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_1;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_2;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_3;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_4;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_5;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_6;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_7;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_8;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_9;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_10;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_11;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_12;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_13;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_14;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_15;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_16;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_17;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_18;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_19;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_20;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_21;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_22;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_23;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_24;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_25;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_26;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_27;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_28;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_29;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_30;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_31;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_32;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_33;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_34;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_35;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_36;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_37;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_38;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_39;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_40;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_41;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_42;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_43;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_44;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_45;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_46;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_47;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_48;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_49;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_50;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_51;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_52;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_53;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_54;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_55;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_56;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_57;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_58;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_59;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_60;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_61;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_62;	// <stdin>:16:10
      automatic logic [31:0] _RANDOM_63;	// <stdin>:16:10
      `ifdef INIT_RANDOM_PROLOG_	// <stdin>:16:10
        `INIT_RANDOM_PROLOG_	// <stdin>:16:10
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// <stdin>:16:10
        _RANDOM_0 = `RANDOM;	// <stdin>:16:10
        _RANDOM_1 = `RANDOM;	// <stdin>:16:10
        _RANDOM_2 = `RANDOM;	// <stdin>:16:10
        _RANDOM_3 = `RANDOM;	// <stdin>:16:10
        _RANDOM_4 = `RANDOM;	// <stdin>:16:10
        _RANDOM_5 = `RANDOM;	// <stdin>:16:10
        _RANDOM_6 = `RANDOM;	// <stdin>:16:10
        _RANDOM_7 = `RANDOM;	// <stdin>:16:10
        _RANDOM_8 = `RANDOM;	// <stdin>:16:10
        _RANDOM_9 = `RANDOM;	// <stdin>:16:10
        _RANDOM_10 = `RANDOM;	// <stdin>:16:10
        _RANDOM_11 = `RANDOM;	// <stdin>:16:10
        _RANDOM_12 = `RANDOM;	// <stdin>:16:10
        _RANDOM_13 = `RANDOM;	// <stdin>:16:10
        _RANDOM_14 = `RANDOM;	// <stdin>:16:10
        _RANDOM_15 = `RANDOM;	// <stdin>:16:10
        _RANDOM_16 = `RANDOM;	// <stdin>:16:10
        _RANDOM_17 = `RANDOM;	// <stdin>:16:10
        _RANDOM_18 = `RANDOM;	// <stdin>:16:10
        _RANDOM_19 = `RANDOM;	// <stdin>:16:10
        _RANDOM_20 = `RANDOM;	// <stdin>:16:10
        _RANDOM_21 = `RANDOM;	// <stdin>:16:10
        _RANDOM_22 = `RANDOM;	// <stdin>:16:10
        _RANDOM_23 = `RANDOM;	// <stdin>:16:10
        _RANDOM_24 = `RANDOM;	// <stdin>:16:10
        _RANDOM_25 = `RANDOM;	// <stdin>:16:10
        _RANDOM_26 = `RANDOM;	// <stdin>:16:10
        _RANDOM_27 = `RANDOM;	// <stdin>:16:10
        _RANDOM_28 = `RANDOM;	// <stdin>:16:10
        _RANDOM_29 = `RANDOM;	// <stdin>:16:10
        _RANDOM_30 = `RANDOM;	// <stdin>:16:10
        _RANDOM_31 = `RANDOM;	// <stdin>:16:10
        _RANDOM_32 = `RANDOM;	// <stdin>:16:10
        _RANDOM_33 = `RANDOM;	// <stdin>:16:10
        _RANDOM_34 = `RANDOM;	// <stdin>:16:10
        _RANDOM_35 = `RANDOM;	// <stdin>:16:10
        _RANDOM_36 = `RANDOM;	// <stdin>:16:10
        _RANDOM_37 = `RANDOM;	// <stdin>:16:10
        _RANDOM_38 = `RANDOM;	// <stdin>:16:10
        _RANDOM_39 = `RANDOM;	// <stdin>:16:10
        _RANDOM_40 = `RANDOM;	// <stdin>:16:10
        _RANDOM_41 = `RANDOM;	// <stdin>:16:10
        _RANDOM_42 = `RANDOM;	// <stdin>:16:10
        _RANDOM_43 = `RANDOM;	// <stdin>:16:10
        _RANDOM_44 = `RANDOM;	// <stdin>:16:10
        _RANDOM_45 = `RANDOM;	// <stdin>:16:10
        _RANDOM_46 = `RANDOM;	// <stdin>:16:10
        _RANDOM_47 = `RANDOM;	// <stdin>:16:10
        _RANDOM_48 = `RANDOM;	// <stdin>:16:10
        _RANDOM_49 = `RANDOM;	// <stdin>:16:10
        _RANDOM_50 = `RANDOM;	// <stdin>:16:10
        _RANDOM_51 = `RANDOM;	// <stdin>:16:10
        _RANDOM_52 = `RANDOM;	// <stdin>:16:10
        _RANDOM_53 = `RANDOM;	// <stdin>:16:10
        _RANDOM_54 = `RANDOM;	// <stdin>:16:10
        _RANDOM_55 = `RANDOM;	// <stdin>:16:10
        _RANDOM_56 = `RANDOM;	// <stdin>:16:10
        _RANDOM_57 = `RANDOM;	// <stdin>:16:10
        _RANDOM_58 = `RANDOM;	// <stdin>:16:10
        _RANDOM_59 = `RANDOM;	// <stdin>:16:10
        _RANDOM_60 = `RANDOM;	// <stdin>:16:10
        _RANDOM_61 = `RANDOM;	// <stdin>:16:10
        _RANDOM_62 = `RANDOM;	// <stdin>:16:10
        _RANDOM_63 = `RANDOM;	// <stdin>:16:10
        GPR_0 = {_RANDOM_0, _RANDOM_1};	// IDU.scala:60:22
        GPR_1 = {_RANDOM_2, _RANDOM_3};	// IDU.scala:60:22
        GPR_2 = {_RANDOM_4, _RANDOM_5};	// IDU.scala:60:22
        GPR_3 = {_RANDOM_6, _RANDOM_7};	// IDU.scala:60:22
        GPR_4 = {_RANDOM_8, _RANDOM_9};	// IDU.scala:60:22
        GPR_5 = {_RANDOM_10, _RANDOM_11};	// IDU.scala:60:22
        GPR_6 = {_RANDOM_12, _RANDOM_13};	// IDU.scala:60:22
        GPR_7 = {_RANDOM_14, _RANDOM_15};	// IDU.scala:60:22
        GPR_8 = {_RANDOM_16, _RANDOM_17};	// IDU.scala:60:22
        GPR_9 = {_RANDOM_18, _RANDOM_19};	// IDU.scala:60:22
        GPR_10 = {_RANDOM_20, _RANDOM_21};	// IDU.scala:60:22
        GPR_11 = {_RANDOM_22, _RANDOM_23};	// IDU.scala:60:22
        GPR_12 = {_RANDOM_24, _RANDOM_25};	// IDU.scala:60:22
        GPR_13 = {_RANDOM_26, _RANDOM_27};	// IDU.scala:60:22
        GPR_14 = {_RANDOM_28, _RANDOM_29};	// IDU.scala:60:22
        GPR_15 = {_RANDOM_30, _RANDOM_31};	// IDU.scala:60:22
        GPR_16 = {_RANDOM_32, _RANDOM_33};	// IDU.scala:60:22
        GPR_17 = {_RANDOM_34, _RANDOM_35};	// IDU.scala:60:22
        GPR_18 = {_RANDOM_36, _RANDOM_37};	// IDU.scala:60:22
        GPR_19 = {_RANDOM_38, _RANDOM_39};	// IDU.scala:60:22
        GPR_20 = {_RANDOM_40, _RANDOM_41};	// IDU.scala:60:22
        GPR_21 = {_RANDOM_42, _RANDOM_43};	// IDU.scala:60:22
        GPR_22 = {_RANDOM_44, _RANDOM_45};	// IDU.scala:60:22
        GPR_23 = {_RANDOM_46, _RANDOM_47};	// IDU.scala:60:22
        GPR_24 = {_RANDOM_48, _RANDOM_49};	// IDU.scala:60:22
        GPR_25 = {_RANDOM_50, _RANDOM_51};	// IDU.scala:60:22
        GPR_26 = {_RANDOM_52, _RANDOM_53};	// IDU.scala:60:22
        GPR_27 = {_RANDOM_54, _RANDOM_55};	// IDU.scala:60:22
        GPR_28 = {_RANDOM_56, _RANDOM_57};	// IDU.scala:60:22
        GPR_29 = {_RANDOM_58, _RANDOM_59};	// IDU.scala:60:22
        GPR_30 = {_RANDOM_60, _RANDOM_61};	// IDU.scala:60:22
        GPR_31 = {_RANDOM_62, _RANDOM_63};	// IDU.scala:60:22
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// <stdin>:16:10
      `FIRRTL_AFTER_INITIAL	// <stdin>:16:10
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_ID_npc = _io_ID_RegWriteEn_T_5 ? io_IF_pc + {{44{io_IF_Inst[31]}}, io_IF_Inst[19:12],
                io_IF_Inst[20], io_IF_Inst[30:21], 1'h0} : {32'h0, _io_ID_ALU_Data1_T_5[31:0]};	// <stdin>:16:10, IDU.scala:34:21, :44:36, :48:{54,76,101}, :53:{13,25}, :55:{19,40}, Mux.scala:101:16
  assign io_ID_ALU_Data1 = InstInfo_2 == 3'h0 ? 64'h0 : InstInfo_2 == 3'h1 ? io_IF_pc : InstInfo_2 == 3'h2 ?
                (io_IF_Inst[19:15] == 5'h0 ? 64'h0 : _GEN_2) : InstInfo_2 == 3'h5 ? _io_ID_ALU_Data1_T_5 :
                64'h0;	// <stdin>:16:10, IDU.scala:46:63, :53:25, :60:30, :69:22, :71:{20,25}, :96:15, :97:15, :98:15, :99:15, :110:35, Lookup.scala:34:39, Mux.scala:101:16
  assign io_ID_ALU_Data2 = ~_InstInfo_T_1 & (_InstInfo_T_3 | _InstInfo_T_5) ? (_io_ID_RegWriteEn_T_1 ?
                {{52{io_IF_Inst[31]}}, io_IF_Inst[31:20]} : _io_ID_RegWriteEn_T_3 ? {{32{io_IF_Inst[31]}},
                io_IF_Inst[31:12], 12'h0} : 64'h0) : 64'h0;	// <stdin>:16:10, Bitwise.scala:77:12, Cat.scala:33:92, IDU.scala:44:{36,53}, :45:{10,53,63}, :60:30, :89:19, :91:19, Lookup.scala:31:38, :34:39, Mux.scala:101:16
  assign io_ID_optype = {3'h0, _InstInfo_T_1 | _InstInfo_T_3 | _InstInfo_T_5 | _InstInfo_T_7 | _InstInfo_T_26};	// <stdin>:16:10, IDU.scala:34:21, Lookup.scala:31:38, :34:39
  assign io_ID_RegWriteID = io_IF_Inst[11:7];	// <stdin>:16:10, IDU.scala:46:80
  assign io_ID_RegWriteEn = _io_ID_RegWriteEn_T_1 | _io_ID_RegWriteEn_T_3 | _io_ID_RegWriteEn_T_5;	// <stdin>:16:10, IDU.scala:55:19, :89:19, :91:19, :110:97
endmodule

module EXU(	// <stdin>:235:10
  input  [63:0] io_ID_ALU_Data1,
                io_ID_ALU_Data2,
  input  [3:0]  io_ID_optype,
  input         io_ID_RegWriteEn,
  input  [4:0]  io_ID_RegWriteID,
  output [63:0] io_EX_RegWriteData,
  output [4:0]  io_EX_RegWriteID,
  output        io_EX_RegWriteEn);

  assign io_EX_RegWriteData = io_ID_optype == 4'h1 ? io_ID_ALU_Data1 + io_ID_ALU_Data2 : io_ID_optype == 4'h2 ?
                io_ID_ALU_Data1 - io_ID_ALU_Data2 : 64'h0;	// <stdin>:235:10, EXU.scala:25:{23,52}, :26:{23,52}, Mux.scala:101:16
  assign io_EX_RegWriteID = io_ID_RegWriteID;	// <stdin>:235:10
  assign io_EX_RegWriteEn = io_ID_RegWriteEn;	// <stdin>:235:10
endmodule

module top(	// <stdin>:254:10
  input         clock,
                reset,
  input  [31:0] io_inst,
  output [63:0] io_IF_pc,
                io_ALUResult);

  wire [63:0] _excute_unit_io_EX_RegWriteData;	// top.scala:24:29
  wire [4:0]  _excute_unit_io_EX_RegWriteID;	// top.scala:24:29
  wire        _excute_unit_io_EX_RegWriteEn;	// top.scala:24:29
  wire [63:0] _inst_decode_unit_io_ID_npc;	// top.scala:23:34
  wire [63:0] _inst_decode_unit_io_ID_ALU_Data1;	// top.scala:23:34
  wire [63:0] _inst_decode_unit_io_ID_ALU_Data2;	// top.scala:23:34
  wire [3:0]  _inst_decode_unit_io_ID_optype;	// top.scala:23:34
  wire [4:0]  _inst_decode_unit_io_ID_RegWriteID;	// top.scala:23:34
  wire        _inst_decode_unit_io_ID_RegWriteEn;	// top.scala:23:34
  wire [63:0] _inst_fetch_unit_io_IF_pc;	// top.scala:22:33
  sim simulate (	// top.scala:19:26
    .inst (io_inst)
  );
  IFU inst_fetch_unit (	// top.scala:22:33
    .clock     (clock),
    .reset     (reset),
    .io_IF_npc (_inst_decode_unit_io_ID_npc),	// top.scala:23:34
    .io_IF_pc  (_inst_fetch_unit_io_IF_pc)
  );
  IDU inst_decode_unit (	// top.scala:23:34
    .clock              (clock),
    .reset              (reset),
    .io_IF_Inst         (io_inst),
    .io_IF_pc           (_inst_fetch_unit_io_IF_pc),	// top.scala:22:33
    .io_EX_RegWriteData (_excute_unit_io_EX_RegWriteData),	// top.scala:24:29
    .io_EX_RegWriteID   (_excute_unit_io_EX_RegWriteID),	// top.scala:24:29
    .io_EX_RegWriteEn   (_excute_unit_io_EX_RegWriteEn),	// top.scala:24:29
    .io_ID_npc          (_inst_decode_unit_io_ID_npc),
    .io_ID_ALU_Data1    (_inst_decode_unit_io_ID_ALU_Data1),
    .io_ID_ALU_Data2    (_inst_decode_unit_io_ID_ALU_Data2),
    .io_ID_optype       (_inst_decode_unit_io_ID_optype),
    .io_ID_RegWriteID   (_inst_decode_unit_io_ID_RegWriteID),
    .io_ID_RegWriteEn   (_inst_decode_unit_io_ID_RegWriteEn)
  );
  EXU excute_unit (	// top.scala:24:29
    .io_ID_ALU_Data1    (_inst_decode_unit_io_ID_ALU_Data1),	// top.scala:23:34
    .io_ID_ALU_Data2    (_inst_decode_unit_io_ID_ALU_Data2),	// top.scala:23:34
    .io_ID_optype       (_inst_decode_unit_io_ID_optype),	// top.scala:23:34
    .io_ID_RegWriteEn   (_inst_decode_unit_io_ID_RegWriteEn),	// top.scala:23:34
    .io_ID_RegWriteID   (_inst_decode_unit_io_ID_RegWriteID),	// top.scala:23:34
    .io_EX_RegWriteData (_excute_unit_io_EX_RegWriteData),
    .io_EX_RegWriteID   (_excute_unit_io_EX_RegWriteID),
    .io_EX_RegWriteEn   (_excute_unit_io_EX_RegWriteEn)
  );
  assign io_IF_pc = _inst_fetch_unit_io_IF_pc;	// <stdin>:254:10, top.scala:22:33
  assign io_ALUResult = _excute_unit_io_EX_RegWriteData;	// <stdin>:254:10, top.scala:24:29
endmodule


// ----- 8< ----- FILE "./build/sim.v" ----- 8< -----

import "DPI-C" function void ebreak();

module sim(input [31:0] inst);

   initial begin
      if ($test$plusargs("trace") != 0) begin
         $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
         $dumpfile("logs/vlt_dump.vcd");
         $dumpvars();
      end
      $display("[%0t] Model running...\n", $time);
   end

   always@(*) begin
      if(inst == 32'h00100073) begin
         $display("EBREAK detected, ending simulate...\n");
         $finish();
      end
   end

endmodule

// ----- 8< ----- FILE "firrtl_black_box_resource_files.f" ----- 8< -----

