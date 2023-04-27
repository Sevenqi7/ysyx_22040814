

wire [63:0] GPR [31:0];
assign {GPR[31], GPR[30], GPR[29], GPR[28], GPR[27], GPR[26], GPR[25], GPR[24], GPR[23], GPR[22], GPR[21], GPR[20]
, GPR[19], GPR[18], GPR[17], GPR[16], GPR[15], GPR[14], GPR[13], GPR[12], GPR[11], GPR[10], GPR[9], GPR[8], GPR[7]
, GPR[6], GPR[5], GPR[4], GPR[3], GPR[2], GPR[1], GPR[0]} = 
{{_inst_decode_unit_io_ID_GPR_31}, {_inst_decode_unit_io_ID_GPR_30}, {_inst_decode_unit_io_ID_GPR_29}, 
{_inst_decode_unit_io_ID_GPR_28}, {_inst_decode_unit_io_ID_GPR_27}, {_inst_decode_unit_io_ID_GPR_26}, {_inst_decode_unit_io_ID_GPR_25}, 
{_inst_decode_unit_io_ID_GPR_24}, {_inst_decode_unit_io_ID_GPR_23}, {_inst_decode_unit_io_ID_GPR_22}, {_inst_decode_unit_io_ID_GPR_21}, 
{_inst_decode_unit_io_ID_GPR_20}, {_inst_decode_unit_io_ID_GPR_19}, {_inst_decode_unit_io_ID_GPR_18}, {_inst_decode_unit_io_ID_GPR_17}, 
{_inst_decode_unit_io_ID_GPR_16}, {_inst_decode_unit_io_ID_GPR_15}, {_inst_decode_unit_io_ID_GPR_14}, {_inst_decode_unit_io_ID_GPR_13}, 
{_inst_decode_unit_io_ID_GPR_12}, {_inst_decode_unit_io_ID_GPR_11}, {_inst_decode_unit_io_ID_GPR_10}, {_inst_decode_unit_io_ID_GPR_9 }, 
{_inst_decode_unit_io_ID_GPR_8 }, {_inst_decode_unit_io_ID_GPR_7 }, {_inst_decode_unit_io_ID_GPR_6 }, {_inst_decode_unit_io_ID_GPR_5 },
{_inst_decode_unit_io_ID_GPR_4 }, {_inst_decode_unit_io_ID_GPR_3 }, {_inst_decode_unit_io_ID_GPR_2 }, {_inst_decode_unit_io_ID_GPR_1 }, 
{_inst_decode_unit_io_ID_GPR_0}};	// IDU.scala:55:22, :66:20

sim simulate (	// top.scala:24:26
   .IF_pc             (_inst_fetch_unit_io_IF_to_ID_bus_bits_PC),	// top.scala:24:33
   .WB_Inst           (io_WB_Inst),
   .GPR               (GPR),
   .unknown_inst_flag(_inst_decode_unit_io_ID_unknown_inst)
);  reg  [15:0]      cache_5_1_tag;	// bpu.scala:40:24
  reg  [63:0]      cache_5_1_data;	// bpu.scala:40:24
  reg              cache_5_1_valid;	// bpu.scala:40:24
  reg  [15:0]      cache_6_0_tag;	// bpu.scala:40:24
  reg  [63:0]      cache_6_0_data;	// bpu.scala:40:24
  reg              cache_6_0_valid;	// bpu.scala:40:24
  reg  [15:0]      cache_6_1_tag;	// bpu.scala:40:24
  reg  [63:0]      cache_6_1_data;	// bpu.scala:40:24
  reg              cache_6_1_valid;	// bpu.scala:40:24
  reg  [15:0]      cache_7_0_tag;	// bpu.scala:40:24
  reg  [63:0]      cache_7_0_data;	// bpu.scala:40:24
  reg              cache_7_0_valid;	// bpu.scala:40:24
  reg  [15:0]      cache_7_1_tag;	// bpu.scala:40:24
  reg  [63:0]      cache_7_1_data;	// bpu.scala:40:24
  reg              cache_7_1_valid;	// bpu.scala:40:24
  wire [7:0][15:0] _GEN = {{cache_7_0_tag}, {cache_6_0_tag}, {cache_5_0_tag}, {cache_4_0_tag}, {cache_3_0_tag},
                {cache_2_0_tag}, {cache_1_0_tag}, {cache_0_0_tag}};	// bpu.scala:40:24, :52:19
  wire [15:0]      _GEN_0;	// bpu.scala:52:19
  /* synopsys infer_mux_override */
  assign _GEN_0 = _GEN[io_raddr[2:0]] /* cadence map_to_mux */;	// bpu.scala:46:24, :52:19
  wire [7:0][63:0] _GEN_1 = {{cache_7_0_data}, {cache_6_0_data}, {cache_5_0_data}, {cache_4_0_data}, {cache_3_0_data},
                {cache_2_0_data}, {cache_1_0_data}, {cache_0_0_data}};	// bpu.scala:40:24, :52:19
  wire [63:0]      _GEN_2;	// bpu.scala:52:19
  /* synopsys infer_mux_override */
  assign _GEN_2 = _GEN_1[io_raddr[2:0]] /* cadence map_to_mux */;	// bpu.scala:46:24, :52:19
  wire [7:0]       _GEN_3 = {{cache_7_0_valid}, {cache_6_0_valid}, {cache_5_0_valid}, {cache_4_0_valid},
                {cache_3_0_valid}, {cache_2_0_valid}, {cache_1_0_valid}, {cache_0_0_valid}};	// bpu.scala:40:24, :52:19
  wire             _GEN_4;	// bpu.scala:52:19
  /* synopsys infer_mux_override */
  assign _GEN_4 = _GEN_3[io_raddr[2:0]] /* cadence map_to_mux */;	// bpu.scala:46:24, :52:19
  wire [7:0][15:0] _GEN_5 = {{cache_7_1_tag}, {cache_6_1_tag}, {cache_5_1_tag}, {cache_4_1_tag}, {cache_3_1_tag},
                {cache_2_1_tag}, {cache_1_1_tag}, {cache_0_1_tag}};	// bpu.scala:40:24, :52:19
  wire [15:0]      _GEN_6;	// bpu.scala:52:19
  /* synopsys infer_mux_override */
  assign _GEN_6 = _GEN_5[io_raddr[2:0]] /* cadence map_to_mux */;	// bpu.scala:46:24, :52:19
  wire [7:0][63:0] _GEN_7 = {{cache_7_1_data}, {cache_6_1_data}, {cache_5_1_data}, {cache_4_1_data}, {cache_3_1_data},
                {cache_2_1_data}, {cache_1_1_data}, {cache_0_1_data}};	// bpu.scala:40:24, :52:19
  wire [63:0]      _GEN_8;	// bpu.scala:52:19
  /* synopsys infer_mux_override */
  assign _GEN_8 = _GEN_7[io_raddr[2:0]] /* cadence map_to_mux */;	// bpu.scala:46:24, :52:19
  wire [7:0]       _GEN_9 = {{cache_7_1_valid}, {cache_6_1_valid}, {cache_5_1_valid}, {cache_4_1_valid},
                {cache_3_1_valid}, {cache_2_1_valid}, {cache_1_1_valid}, {cache_0_1_valid}};	// bpu.scala:40:24, :52:19
  wire             _GEN_10;	// bpu.scala:52:19
  /* synopsys infer_mux_override */
  assign _GEN_10 = _GEN_9[io_raddr[2:0]] /* cadence map_to_mux */;	// bpu.scala:46:24, :52:19
  wire             _T_1 = io_raddr[18:3] == _GEN_0 & _GEN_4;	// bpu.scala:45:24, :52:{19,42}
  wire             _T_3 = io_raddr[18:3] == _GEN_6 & _GEN_10;	// bpu.scala:45:24, :52:{19,42}
  wire [15:0]      _GEN_11;	// bpu.scala:66:14
  /* synopsys infer_mux_override */
  assign _GEN_11 = _GEN[io_waddr[2:0]] /* cadence map_to_mux */;	// bpu.scala:52:19, :60:24, :66:14
  wire             _GEN_12;	// bpu.scala:66:14
  /* synopsys infer_mux_override */
  assign _GEN_12 = _GEN_3[io_waddr[2:0]] /* cadence map_to_mux */;	// bpu.scala:52:19, :60:24, :66:14
  wire [15:0]      _GEN_13;	// bpu.scala:66:14
  /* synopsys infer_mux_override */
  assign _GEN_13 = _GEN_5[io_waddr[2:0]] /* cadence map_to_mux */;	// bpu.scala:52:19, :60:24, :66:14
  wire             _GEN_14;	// bpu.scala:66:14
  /* synopsys infer_mux_override */
  assign _GEN_14 = _GEN_9[io_waddr[2:0]] /* cadence map_to_mux */;	// bpu.scala:52:19, :60:24, :66:14
  always @(posedge clock) begin
    if (reset) begin
      cache_0_0_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_0_0_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_0_0_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_0_1_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_0_1_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_0_1_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_1_0_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_1_0_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_1_0_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_1_1_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_1_1_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_1_1_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_2_0_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_2_0_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_2_0_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_2_1_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_2_1_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_2_1_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_3_0_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_3_0_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_3_0_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_3_1_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_3_1_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_3_1_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_4_0_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_4_0_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_4_0_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_4_1_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_4_1_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_4_1_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_5_0_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_5_0_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_5_0_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_5_1_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_5_1_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_5_1_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_6_0_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_6_0_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_6_0_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_6_1_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_6_1_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_6_1_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_7_0_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_7_0_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_7_0_valid <= 1'h0;	// bpu.scala:37:19, :40:24
      cache_7_1_tag <= 16'h0;	// bpu.scala:37:19, :40:24
      cache_7_1_data <= 64'h0;	// bpu.scala:38:20, :40:24
      cache_7_1_valid <= 1'h0;	// bpu.scala:37:19, :40:24
    end
    else begin
      automatic logic       _T_6 = io_waddr[18:3] == _GEN_11;	// bpu.scala:59:24, :66:14, :72:19
      automatic logic       _T_7 = io_waddr[18:3] == _GEN_13;	// bpu.scala:59:24, :66:14, :72:19
      automatic logic [1:0] _GEN_15 = ~io_writeEn | _T_7 | _T_6 | ~_GEN_14 | ~_GEN_12 ? (_T_7 ? 2'h1 : _T_6 ? 2'h0 : {1'h0,
                                                ~_GEN_14}) : {_writeIDX_prng_io_out_1, _writeIDX_prng_io_out_0};	// PRNG.scala:91:22, bpu.scala:37:19, :66:{14,36}, :67:22, :72:{19,42}, :73:22, :77:21, :78:24, :79:22, :81:37
      automatic logic       _GEN_16 = io_waddr[2:0] == 3'h0;	// bpu.scala:60:24, :81:37
      automatic logic       _GEN_17 = _GEN_15 == 2'h0;	// bpu.scala:72:42, :77:21, :78:24, :81:37
      automatic logic       _GEN_18 = io_writeEn & _GEN_16 & _GEN_17;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_19 = _GEN_15 == 2'h1;	// bpu.scala:72:42, :77:21, :78:24, :81:37
      automatic logic       _GEN_20 = io_writeEn & _GEN_16 & _GEN_19;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_21 = io_waddr[2:0] == 3'h1;	// bpu.scala:60:24, :81:37
      automatic logic       _GEN_22 = io_writeEn & _GEN_21 & _GEN_17;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_23 = io_writeEn & _GEN_21 & _GEN_19;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_24 = io_waddr[2:0] == 3'h2;	// bpu.scala:60:24, :81:37
      automatic logic       _GEN_25 = io_writeEn & _GEN_24 & _GEN_17;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_26 = io_writeEn & _GEN_24 & _GEN_19;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_27 = io_waddr[2:0] == 3'h3;	// bpu.scala:60:24, :81:37
      automatic logic       _GEN_28 = io_writeEn & _GEN_27 & _GEN_17;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_29 = io_writeEn & _GEN_27 & _GEN_19;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_30 = io_waddr[2:0] == 3'h4;	// bpu.scala:60:24, :81:37
      automatic logic       _GEN_31 = io_writeEn & _GEN_30 & _GEN_17;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_32 = io_writeEn & _GEN_30 & _GEN_19;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_33 = io_waddr[2:0] == 3'h5;	// bpu.scala:60:24, :81:37
      automatic logic       _GEN_34 = io_writeEn & _GEN_33 & _GEN_17;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_35 = io_writeEn & _GEN_33 & _GEN_19;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_36 = io_waddr[2:0] == 3'h6;	// bpu.scala:60:24, :81:37
      automatic logic       _GEN_37 = io_writeEn & _GEN_36 & _GEN_17;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_38 = io_writeEn & _GEN_36 & _GEN_19;	// bpu.scala:40:24, :77:21, :81:37
      automatic logic       _GEN_39 = io_writeEn & (&(io_waddr[2:0])) & _GEN_17;	// bpu.scala:40:24, :60:24, :77:21, :81:37
      automatic logic       _GEN_40 = io_writeEn & (&(io_waddr[2:0])) & _GEN_19;	// bpu.scala:40:24, :60:24, :77:21, :81:37
      if (_GEN_18) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_0_0_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_0_0_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_0_0_valid <= _GEN_18 | cache_0_0_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_20) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_0_1_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_0_1_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_0_1_valid <= _GEN_20 | cache_0_1_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_22) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_1_0_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_1_0_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_1_0_valid <= _GEN_22 | cache_1_0_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_23) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_1_1_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_1_1_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_1_1_valid <= _GEN_23 | cache_1_1_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_25) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_2_0_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_2_0_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_2_0_valid <= _GEN_25 | cache_2_0_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_26) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_2_1_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_2_1_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_2_1_valid <= _GEN_26 | cache_2_1_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_28) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_3_0_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_3_0_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_3_0_valid <= _GEN_28 | cache_3_0_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_29) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_3_1_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_3_1_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_3_1_valid <= _GEN_29 | cache_3_1_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_31) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_4_0_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_4_0_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_4_0_valid <= _GEN_31 | cache_4_0_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_32) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_4_1_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_4_1_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_4_1_valid <= _GEN_32 | cache_4_1_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_34) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_5_0_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_5_0_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_5_0_valid <= _GEN_34 | cache_5_0_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_35) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_5_1_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_5_1_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_5_1_valid <= _GEN_35 | cache_5_1_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_37) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_6_0_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_6_0_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_6_0_valid <= _GEN_37 | cache_6_0_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_38) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_6_1_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_6_1_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_6_1_valid <= _GEN_38 | cache_6_1_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_39) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_7_0_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_7_0_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_7_0_valid <= _GEN_39 | cache_7_0_valid;	// bpu.scala:40:24, :77:21, :81:37
      if (_GEN_40) begin	// bpu.scala:40:24, :77:21, :81:37
        cache_7_1_tag <= io_waddr[18:3];	// bpu.scala:40:24, :59:24
        cache_7_1_data <= io_writeData;	// bpu.scala:40:24
      end
      cache_7_1_valid <= _GEN_40 | cache_7_1_valid;	// bpu.scala:40:24, :77:21, :81:37
    end
  end // always @(posedge)
  `ifndef SYNTHESIS	// <stdin>:65:10
    `ifdef FIRRTL_BEFORE_INITIAL	// <stdin>:65:10
      `FIRRTL_BEFORE_INITIAL	// <stdin>:65:10
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_0;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_1;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_2;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_3;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_4;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_5;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_6;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_7;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_8;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_9;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_10;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_11;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_12;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_13;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_14;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_15;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_16;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_17;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_18;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_19;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_20;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_21;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_22;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_23;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_24;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_25;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_26;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_27;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_28;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_29;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_30;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_31;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_32;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_33;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_34;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_35;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_36;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_37;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_38;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_39;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_40;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_41;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_42;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_43;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_44;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_45;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_46;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_47;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_48;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_49;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_50;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_51;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_52;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_53;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_54;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_55;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_56;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_57;	// <stdin>:65:10
      automatic logic [31:0] _RANDOM_58;	// <stdin>:65:10
      `ifdef INIT_RANDOM_PROLOG_	// <stdin>:65:10
        `INIT_RANDOM_PROLOG_	// <stdin>:65:10
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// <stdin>:65:10
        _RANDOM_0 = `RANDOM;	// <stdin>:65:10
        _RANDOM_1 = `RANDOM;	// <stdin>:65:10
        _RANDOM_2 = `RANDOM;	// <stdin>:65:10
        _RANDOM_3 = `RANDOM;	// <stdin>:65:10
        _RANDOM_4 = `RANDOM;	// <stdin>:65:10
        _RANDOM_5 = `RANDOM;	// <stdin>:65:10
        _RANDOM_6 = `RANDOM;	// <stdin>:65:10
        _RANDOM_7 = `RANDOM;	// <stdin>:65:10
        _RANDOM_8 = `RANDOM;	// <stdin>:65:10
        _RANDOM_9 = `RANDOM;	// <stdin>:65:10
        _RANDOM_10 = `RANDOM;	// <stdin>:65:10
        _RANDOM_11 = `RANDOM;	// <stdin>:65:10
        _RANDOM_12 = `RANDOM;	// <stdin>:65:10
        _RANDOM_13 = `RANDOM;	// <stdin>:65:10
        _RANDOM_14 = `RANDOM;	// <stdin>:65:10
        _RANDOM_15 = `RANDOM;	// <stdin>:65:10
        _RANDOM_16 = `RANDOM;	// <stdin>:65:10
        _RANDOM_17 = `RANDOM;	// <stdin>:65:10
        _RANDOM_18 = `RANDOM;	// <stdin>:65:10
        _RANDOM_19 = `RANDOM;	// <stdin>:65:10
        _RANDOM_20 = `RANDOM;	// <stdin>:65:10
        _RANDOM_21 = `RANDOM;	// <stdin>:65:10
        _RANDOM_22 = `RANDOM;	// <stdin>:65:10
        _RANDOM_23 = `RANDOM;	// <stdin>:65:10
        _RANDOM_24 = `RANDOM;	// <stdin>:65:10
        _RANDOM_25 = `RANDOM;	// <stdin>:65:10
        _RANDOM_26 = `RANDOM;	// <stdin>:65:10
        _RANDOM_27 = `RANDOM;	// <stdin>:65:10
        _RANDOM_28 = `RANDOM;	// <stdin>:65:10
        _RANDOM_29 = `RANDOM;	// <stdin>:65:10
        _RANDOM_30 = `RANDOM;	// <stdin>:65:10
        _RANDOM_31 = `RANDOM;	// <stdin>:65:10
        _RANDOM_32 = `RANDOM;	// <stdin>:65:10
        _RANDOM_33 = `RANDOM;	// <stdin>:65:10
        _RANDOM_34 = `RANDOM;	// <stdin>:65:10
        _RANDOM_35 = `RANDOM;	// <stdin>:65:10
        _RANDOM_36 = `RANDOM;	// <stdin>:65:10
        _RANDOM_37 = `RANDOM;	// <stdin>:65:10
        _RANDOM_38 = `RANDOM;	// <stdin>:65:10
        _RANDOM_39 = `RANDOM;	// <stdin>:65:10
        _RANDOM_40 = `RANDOM;	// <stdin>:65:10
        _RANDOM_41 = `RANDOM;	// <stdin>:65:10
        _RANDOM_42 = `RANDOM;	// <stdin>:65:10
        _RANDOM_43 = `RANDOM;	// <stdin>:65:10
        _RANDOM_44 = `RANDOM;	// <stdin>:65:10
        _RANDOM_45 = `RANDOM;	// <stdin>:65:10
        _RANDOM_46 = `RANDOM;	// <stdin>:65:10
        _RANDOM_47 = `RANDOM;	// <stdin>:65:10
        _RANDOM_48 = `RANDOM;	// <stdin>:65:10
        _RANDOM_49 = `RANDOM;	// <stdin>:65:10
        _RANDOM_50 = `RANDOM;	// <stdin>:65:10
        _RANDOM_51 = `RANDOM;	// <stdin>:65:10
        _RANDOM_52 = `RANDOM;	// <stdin>:65:10
        _RANDOM_53 = `RANDOM;	// <stdin>:65:10
        _RANDOM_54 = `RANDOM;	// <stdin>:65:10
        _RANDOM_55 = `RANDOM;	// <stdin>:65:10
        _RANDOM_56 = `RANDOM;	// <stdin>:65:10
        _RANDOM_57 = `RANDOM;	// <stdin>:65:10
        _RANDOM_58 = `RANDOM;	// <stdin>:65:10
        cache_0_0_tag = _RANDOM_0[15:0];	// bpu.scala:40:24
        cache_0_0_data = {_RANDOM_0[31:16], _RANDOM_1, _RANDOM_2[15:0]};	// bpu.scala:40:24
        cache_0_0_valid = _RANDOM_2[16];	// bpu.scala:40:24
        cache_0_1_tag = {_RANDOM_2[31:17], _RANDOM_3[0]};	// bpu.scala:40:24
        cache_0_1_data = {_RANDOM_3[31:1], _RANDOM_4, _RANDOM_5[0]};	// bpu.scala:40:24
        cache_0_1_valid = _RANDOM_5[1];	// bpu.scala:40:24
        cache_1_0_tag = {_RANDOM_7[31:19], _RANDOM_8[2:0]};	// bpu.scala:40:24
        cache_1_0_data = {_RANDOM_8[31:3], _RANDOM_9, _RANDOM_10[2:0]};	// bpu.scala:40:24
        cache_1_0_valid = _RANDOM_10[3];	// bpu.scala:40:24
        cache_1_1_tag = _RANDOM_10[19:4];	// bpu.scala:40:24
        cache_1_1_data = {_RANDOM_10[31:20], _RANDOM_11, _RANDOM_12[19:0]};	// bpu.scala:40:24
        cache_1_1_valid = _RANDOM_12[20];	// bpu.scala:40:24
        cache_2_0_tag = _RANDOM_15[21:6];	// bpu.scala:40:24
        cache_2_0_data = {_RANDOM_15[31:22], _RANDOM_16, _RANDOM_17[21:0]};	// bpu.scala:40:24
        cache_2_0_valid = _RANDOM_17[22];	// bpu.scala:40:24
        cache_2_1_tag = {_RANDOM_17[31:23], _RANDOM_18[6:0]};	// bpu.scala:40:24
        cache_2_1_data = {_RANDOM_18[31:7], _RANDOM_19, _RANDOM_20[6:0]};	// bpu.scala:40:24
        cache_2_1_valid = _RANDOM_20[7];	// bpu.scala:40:24
        cache_3_0_tag = {_RANDOM_22[31:25], _RANDOM_23[8:0]};	// bpu.scala:40:24
        cache_3_0_data = {_RANDOM_23[31:9], _RANDOM_24, _RANDOM_25[8:0]};	// bpu.scala:40:24
        cache_3_0_valid = _RANDOM_25[9];	// bpu.scala:40:24
        cache_3_1_tag = _RANDOM_25[25:10];	// bpu.scala:40:24
        cache_3_1_data = {_RANDOM_25[31:26], _RANDOM_26, _RANDOM_27[25:0]};	// bpu.scala:40:24
        cache_3_1_valid = _RANDOM_27[26];	// bpu.scala:40:24
        cache_4_0_tag = _RANDOM_30[27:12];	// bpu.scala:40:24
        cache_4_0_data = {_RANDOM_30[31:28], _RANDOM_31, _RANDOM_32[27:0]};	// bpu.scala:40:24
        cache_4_0_valid = _RANDOM_32[28];	// bpu.scala:40:24
        cache_4_1_tag = {_RANDOM_32[31:29], _RANDOM_33[12:0]};	// bpu.scala:40:24
        cache_4_1_data = {_RANDOM_33[31:13], _RANDOM_34, _RANDOM_35[12:0]};	// bpu.scala:40:24
        cache_4_1_valid = _RANDOM_35[13];	// bpu.scala:40:24
        cache_5_0_tag = {_RANDOM_37[31], _RANDOM_38[14:0]};	// bpu.scala:40:24
        cache_5_0_data = {_RANDOM_38[31:15], _RANDOM_39, _RANDOM_40[14:0]};	// bpu.scala:40:24
        cache_5_0_valid = _RANDOM_40[15];	// bpu.scala:40:24
        cache_5_1_tag = _RANDOM_40[31:16];	// bpu.scala:40:24
        cache_5_1_data = {_RANDOM_41, _RANDOM_42};	// bpu.scala:40:24
        cache_5_1_valid = _RANDOM_43[0];	// bpu.scala:40:24
        cache_6_0_tag = {_RANDOM_45[31:18], _RANDOM_46[1:0]};	// bpu.scala:40:24
        cache_6_0_data = {_RANDOM_46[31:2], _RANDOM_47, _RANDOM_48[1:0]};	// bpu.scala:40:24
        cache_6_0_valid = _RANDOM_48[2];	// bpu.scala:40:24
        cache_6_1_tag = _RANDOM_48[18:3];	// bpu.scala:40:24
        cache_6_1_data = {_RANDOM_48[31:19], _RANDOM_49, _RANDOM_50[18:0]};	// bpu.scala:40:24
        cache_6_1_valid = _RANDOM_50[19];	// bpu.scala:40:24
        cache_7_0_tag = _RANDOM_53[20:5];	// bpu.scala:40:24
        cache_7_0_data = {_RANDOM_53[31:21], _RANDOM_54, _RANDOM_55[20:0]};	// bpu.scala:40:24
        cache_7_0_valid = _RANDOM_55[21];	// bpu.scala:40:24
        cache_7_1_tag = {_RANDOM_55[31:22], _RANDOM_56[5:0]};	// bpu.scala:40:24
        cache_7_1_data = {_RANDOM_56[31:6], _RANDOM_57, _RANDOM_58[5:0]};	// bpu.scala:40:24
        cache_7_1_valid = _RANDOM_58[6];	// bpu.scala:40:24
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// <stdin>:65:10
      `FIRRTL_AFTER_INITIAL	// <stdin>:65:10
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  MaxPeriodFibonacciLFSR writeIDX_prng (	// PRNG.scala:91:22
    .clock     (clock),
    .reset     (reset),
    .io_out_0  (_writeIDX_prng_io_out_0),
    .io_out_1  (_writeIDX_prng_io_out_1),
    .io_out_2  (_writeIDX_prng_io_out_2),
    .io_out_3  (_writeIDX_prng_io_out_3),
    .io_out_4  (_writeIDX_prng_io_out_4),
    .io_out_5  (_writeIDX_prng_io_out_5),
    .io_out_6  (_writeIDX_prng_io_out_6),
    .io_out_7  (_writeIDX_prng_io_out_7),
    .io_out_8  (_writeIDX_prng_io_out_8),
    .io_out_9  (_writeIDX_prng_io_out_9),
    .io_out_10 (_writeIDX_prng_io_out_10),
    .io_out_11 (_writeIDX_prng_io_out_11),
    .io_out_12 (_writeIDX_prng_io_out_12),
    .io_out_13 (_writeIDX_prng_io_out_13),
    .io_out_14 (_writeIDX_prng_io_out_14),
    .io_out_15 (_writeIDX_prng_io_out_15)
  );
  assign io_readData = _T_3 ? _GEN_8 : _T_1 ? _GEN_2 : 64'h7777;	// <stdin>:65:10, bpu.scala:49:17, :52:{19,42,66}, :54:25
  assign io_hit = _T_3 | _T_1;	// <stdin>:65:10, bpu.scala:52:{42,66}, :53:20
  assign io_wset = io_waddr[2:0];	// <stdin>:65:10, bpu.scala:60:24
  assign io_wtag = io_waddr[18:3];	// <stdin>:65:10, bpu.scala:59:24
  assign io_rset = io_raddr[2:0];	// <stdin>:65:10, bpu.scala:46:24
  assign io_rtag = io_raddr[18:3];	// <stdin>:65:10, bpu.scala:45:24
endmodule

module BPU(	// <stdin>:186:10
  input         clock,
                reset,
  input  [63:0] io_PF_pc,
  input  [31:0] io_PF_inst,
  input         io_PF_valid,
                io_ID_to_BPU_bus_valid,
  input  [63:0] io_ID_to_BPU_bus_bits_PC,
  input         io_ID_to_BPU_bus_bits_taken,
  input  [63:0] io_ID_to_BPU_bus_bits_br_target,
  input         io_ID_to_BPU_bus_bits_load_use_stall,
  output        io_bp_taken,
                io_bp_flush,
  output [63:0] io_bp_npc,
  output [2:0]  io_BTB_wset,
  output [15:0] io_BTB_wtag,
  output [2:0]  io_BTB_rset,
  output [15:0] io_BTB_rtag,
  output [63:0] io_BTB_rdata,
                io_BTB_wdata,
  output        io_BTB_hit,
  output [31:0] io_br_cnt,
                io_bp_fail,
                io_hit_cnt);

  wire              _GEN;	// bpu.scala:181:18, :182:55, :183:18
  wire [63:0]       _BTB_io_readData;	// bpu.scala:150:21
  wire              _BTB_io_hit;	// bpu.scala:150:21
  reg  [63:0]       bp_target;	// bpu.scala:141:28
  wire              _T_13 = io_PF_inst[6:0] == 7'h63 | io_PF_inst[6:0] == 7'h6F | io_PF_inst[6:0] == 7'h67;	// bpu.scala:132:28, :136:24, :137:{24,53}, :143:18
  reg  [3:0]        BHT_0;	// bpu.scala:148:22
  reg  [3:0]        BHT_1;	// bpu.scala:148:22
  reg  [3:0]        BHT_2;	// bpu.scala:148:22
  reg  [3:0]        BHT_3;	// bpu.scala:148:22
  reg  [3:0]        BHT_4;	// bpu.scala:148:22
  reg  [3:0]        BHT_5;	// bpu.scala:148:22
  reg  [3:0]        BHT_6;	// bpu.scala:148:22
  reg  [3:0]        BHT_7;	// bpu.scala:148:22
  reg  [3:0]        BHT_8;	// bpu.scala:148:22
  reg  [3:0]        BHT_9;	// bpu.scala:148:22
  reg  [3:0]        BHT_10;	// bpu.scala:148:22
  reg  [3:0]        BHT_11;	// bpu.scala:148:22
  reg  [3:0]        BHT_12;	// bpu.scala:148:22
  reg  [3:0]        BHT_13;	// bpu.scala:148:22
  reg  [3:0]        BHT_14;	// bpu.scala:148:22
  reg  [3:0]        BHT_15;	// bpu.scala:148:22
  reg  [3:0]        BHT_16;	// bpu.scala:148:22
  reg  [3:0]        BHT_17;	// bpu.scala:148:22
  reg  [3:0]        BHT_18;	// bpu.scala:148:22
  reg  [3:0]        BHT_19;	// bpu.scala:148:22
  reg  [3:0]        BHT_20;	// bpu.scala:148:22
  reg  [3:0]        BHT_21;	// bpu.scala:148:22
  reg  [3:0]        BHT_22;	// bpu.scala:148:22
  reg  [3:0]        BHT_23;	// bpu.scala:148:22
  reg  [3:0]        BHT_24;	// bpu.scala:148:22
  reg  [3:0]        BHT_25;	// bpu.scala:148:22
  reg  [3:0]        BHT_26;	// bpu.scala:148:22
  reg  [3:0]        BHT_27;	// bpu.scala:148:22
  reg  [3:0]        BHT_28;	// bpu.scala:148:22
  reg  [3:0]        BHT_29;	// bpu.scala:148:22
  reg  [3:0]        BHT_30;	// bpu.scala:148:22
  reg  [3:0]        BHT_31;	// bpu.scala:148:22
  reg  [3:0]        BHT_32;	// bpu.scala:148:22
  reg  [3:0]        BHT_33;	// bpu.scala:148:22
  reg  [3:0]        BHT_34;	// bpu.scala:148:22
  reg  [3:0]        BHT_35;	// bpu.scala:148:22
  reg  [3:0]        BHT_36;	// bpu.scala:148:22
  reg  [3:0]        BHT_37;	// bpu.scala:148:22
  reg  [3:0]        BHT_38;	// bpu.scala:148:22
  reg  [3:0]        BHT_39;	// bpu.scala:148:22
  reg  [3:0]        BHT_40;	// bpu.scala:148:22
  reg  [3:0]        BHT_41;	// bpu.scala:148:22
  reg  [3:0]        BHT_42;	// bpu.scala:148:22
  reg  [3:0]        BHT_43;	// bpu.scala:148:22
  reg  [3:0]        BHT_44;	// bpu.scala:148:22
  reg  [3:0]        BHT_45;	// bpu.scala:148:22
  reg  [3:0]        BHT_46;	// bpu.scala:148:22
  reg  [3:0]        BHT_47;	// bpu.scala:148:22
  reg  [3:0]        BHT_48;	// bpu.scala:148:22
  reg  [3:0]        BHT_49;	// bpu.scala:148:22
  reg  [3:0]        BHT_50;	// bpu.scala:148:22
  reg  [3:0]        BHT_51;	// bpu.scala:148:22
  reg  [3:0]        BHT_52;	// bpu.scala:148:22
  reg  [3:0]        BHT_53;	// bpu.scala:148:22
  reg  [3:0]        BHT_54;	// bpu.scala:148:22
  reg  [3:0]        BHT_55;	// bpu.scala:148:22
  reg  [3:0]        BHT_56;	// bpu.scala:148:22
  reg  [3:0]        BHT_57;	// bpu.scala:148:22
  reg  [3:0]        BHT_58;	// bpu.scala:148:22
  reg  [3:0]        BHT_59;	// bpu.scala:148:22
  reg  [3:0]        BHT_60;	// bpu.scala:148:22
  reg  [3:0]        BHT_61;	// bpu.scala:148:22
  reg  [3:0]        BHT_62;	// bpu.scala:148:22
  reg  [3:0]        BHT_63;	// bpu.scala:148:22
  reg  [3:0]        BHT_64;	// bpu.scala:148:22
  reg  [3:0]        BHT_65;	// bpu.scala:148:22
  reg  [3:0]        BHT_66;	// bpu.scala:148:22
  reg  [3:0]        BHT_67;	// bpu.scala:148:22
  reg  [3:0]        BHT_68;	// bpu.scala:148:22
  reg  [3:0]        BHT_69;	// bpu.scala:148:22
  reg  [3:0]        BHT_70;	// bpu.scala:148:22
  reg  [3:0]        BHT_71;	// bpu.scala:148:22
  reg  [3:0]        BHT_72;	// bpu.scala:148:22
  reg  [3:0]        BHT_73;	// bpu.scala:148:22
  reg  [3:0]        BHT_74;	// bpu.scala:148:22
  reg  [3:0]        BHT_75;	// bpu.scala:148:22
  reg  [3:0]        BHT_76;	// bpu.scala:148:22
  reg  [3:0]        BHT_77;	// bpu.scala:148:22
  reg  [3:0]        BHT_78;	// bpu.scala:148:22
  reg  [3:0]        BHT_79;	// bpu.scala:148:22
  reg  [3:0]        BHT_80;	// bpu.scala:148:22
  reg  [3:0]        BHT_81;	// bpu.scala:148:22
  reg  [3:0]        BHT_82;	// bpu.scala:148:22
  reg  [3:0]        BHT_83;	// bpu.scala:148:22
  reg  [3:0]        BHT_84;	// bpu.scala:148:22
  reg  [3:0]        BHT_85;	// bpu.scala:148:22
  reg  [3:0]        BHT_86;	// bpu.scala:148:22
  reg  [3:0]        BHT_87;	// bpu.scala:148:22
  reg  [3:0]        BHT_88;	// bpu.scala:148:22
  reg  [3:0]        BHT_89;	// bpu.scala:148:22
  reg  [3:0]        BHT_90;	// bpu.scala:148:22
  reg  [3:0]        BHT_91;	// bpu.scala:148:22
  reg  [3:0]        BHT_92;	// bpu.scala:148:22
  reg  [3:0]        BHT_93;	// bpu.scala:148:22
  reg  [3:0]        BHT_94;	// bpu.scala:148:22
  reg  [3:0]        BHT_95;	// bpu.scala:148:22
  reg  [3:0]        BHT_96;	// bpu.scala:148:22
  reg  [3:0]        BHT_97;	// bpu.scala:148:22
  reg  [3:0]        BHT_98;	// bpu.scala:148:22
  reg  [3:0]        BHT_99;	// bpu.scala:148:22
  reg  [3:0]        BHT_100;	// bpu.scala:148:22
  reg  [3:0]        BHT_101;	// bpu.scala:148:22
  reg  [3:0]        BHT_102;	// bpu.scala:148:22
  reg  [3:0]        BHT_103;	// bpu.scala:148:22
  reg  [3:0]        BHT_104;	// bpu.scala:148:22
  reg  [3:0]        BHT_105;	// bpu.scala:148:22
  reg  [3:0]        BHT_106;	// bpu.scala:148:22
  reg  [3:0]        BHT_107;	// bpu.scala:148:22
  reg  [3:0]        BHT_108;	// bpu.scala:148:22
  reg  [3:0]        BHT_109;	// bpu.scala:148:22
  reg  [3:0]        BHT_110;	// bpu.scala:148:22
  reg  [3:0]        BHT_111;	// bpu.scala:148:22
  reg  [3:0]        BHT_112;	// bpu.scala:148:22
  reg  [3:0]        BHT_113;	// bpu.scala:148:22
  reg  [3:0]        BHT_114;	// bpu.scala:148:22
  reg  [3:0]        BHT_115;	// bpu.scala:148:22
  reg  [3:0]        BHT_116;	// bpu.scala:148:22
  reg  [3:0]        BHT_117;	// bpu.scala:148:22
  reg  [3:0]        BHT_118;	// bpu.scala:148:22
  reg  [3:0]        BHT_119;	// bpu.scala:148:22
  reg  [3:0]        BHT_120;	// bpu.scala:148:22
  reg  [3:0]        BHT_121;	// bpu.scala:148:22
  reg  [3:0]        BHT_122;	// bpu.scala:148:22
  reg  [3:0]        BHT_123;	// bpu.scala:148:22
  reg  [3:0]        BHT_124;	// bpu.scala:148:22
  reg  [3:0]        BHT_125;	// bpu.scala:148:22
  reg  [3:0]        BHT_126;	// bpu.scala:148:22
  reg  [3:0]        BHT_127;	// bpu.scala:148:22
  reg  [3:0]        BHT_128;	// bpu.scala:148:22
  reg  [3:0]        BHT_129;	// bpu.scala:148:22
  reg  [3:0]        BHT_130;	// bpu.scala:148:22
  reg  [3:0]        BHT_131;	// bpu.scala:148:22
  reg  [3:0]        BHT_132;	// bpu.scala:148:22
  reg  [3:0]        BHT_133;	// bpu.scala:148:22
  reg  [3:0]        BHT_134;	// bpu.scala:148:22
  reg  [3:0]        BHT_135;	// bpu.scala:148:22
  reg  [3:0]        BHT_136;	// bpu.scala:148:22
  reg  [3:0]        BHT_137;	// bpu.scala:148:22
  reg  [3:0]        BHT_138;	// bpu.scala:148:22
  reg  [3:0]        BHT_139;	// bpu.scala:148:22
  reg  [3:0]        BHT_140;	// bpu.scala:148:22
  reg  [3:0]        BHT_141;	// bpu.scala:148:22
  reg  [3:0]        BHT_142;	// bpu.scala:148:22
  reg  [3:0]        BHT_143;	// bpu.scala:148:22
  reg  [3:0]        BHT_144;	// bpu.scala:148:22
  reg  [3:0]        BHT_145;	// bpu.scala:148:22
  reg  [3:0]        BHT_146;	// bpu.scala:148:22
  reg  [3:0]        BHT_147;	// bpu.scala:148:22
  reg  [3:0]        BHT_148;	// bpu.scala:148:22
  reg  [3:0]        BHT_149;	// bpu.scala:148:22
  reg  [3:0]        BHT_150;	// bpu.scala:148:22
  reg  [3:0]        BHT_151;	// bpu.scala:148:22
  reg  [3:0]        BHT_152;	// bpu.scala:148:22
  reg  [3:0]        BHT_153;	// bpu.scala:148:22
  reg  [3:0]        BHT_154;	// bpu.scala:148:22
  reg  [3:0]        BHT_155;	// bpu.scala:148:22
  reg  [3:0]        BHT_156;	// bpu.scala:148:22
  reg  [3:0]        BHT_157;	// bpu.scala:148:22
  reg  [3:0]        BHT_158;	// bpu.scala:148:22
  reg  [3:0]        BHT_159;	// bpu.scala:148:22
  reg  [3:0]        BHT_160;	// bpu.scala:148:22
  reg  [3:0]        BHT_161;	// bpu.scala:148:22
  reg  [3:0]        BHT_162;	// bpu.scala:148:22
  reg  [3:0]        BHT_163;	// bpu.scala:148:22
  reg  [3:0]        BHT_164;	// bpu.scala:148:22
  reg  [3:0]        BHT_165;	// bpu.scala:148:22
  reg  [3:0]        BHT_166;	// bpu.scala:148:22
  reg  [3:0]        BHT_167;	// bpu.scala:148:22
  reg  [3:0]        BHT_168;	// bpu.scala:148:22
  reg  [3:0]        BHT_169;	// bpu.scala:148:22
  reg  [3:0]        BHT_170;	// bpu.scala:148:22
  reg  [3:0]        BHT_171;	// bpu.scala:148:22
  reg  [3:0]        BHT_172;	// bpu.scala:148:22
  reg  [3:0]        BHT_173;	// bpu.scala:148:22
  reg  [3:0]        BHT_174;	// bpu.scala:148:22
  reg  [3:0]        BHT_175;	// bpu.scala:148:22
  reg  [3:0]        BHT_176;	// bpu.scala:148:22
  reg  [3:0]        BHT_177;	// bpu.scala:148:22
  reg  [3:0]        BHT_178;	// bpu.scala:148:22
  reg  [3:0]        BHT_179;	// bpu.scala:148:22
  reg  [3:0]        BHT_180;	// bpu.scala:148:22
  reg  [3:0]        BHT_181;	// bpu.scala:148:22
  reg  [3:0]        BHT_182;	// bpu.scala:148:22
  reg  [3:0]        BHT_183;	// bpu.scala:148:22
  reg  [3:0]        BHT_184;	// bpu.scala:148:22
  reg  [3:0]        BHT_185;	// bpu.scala:148:22
  reg  [3:0]        BHT_186;	// bpu.scala:148:22
  reg  [3:0]        BHT_187;	// bpu.scala:148:22
  reg  [3:0]        BHT_188;	// bpu.scala:148:22
  reg  [3:0]        BHT_189;	// bpu.scala:148:22
  reg  [3:0]        BHT_190;	// bpu.scala:148:22
  reg  [3:0]        BHT_191;	// bpu.scala:148:22
  reg  [3:0]        BHT_192;	// bpu.scala:148:22
  reg  [3:0]        BHT_193;	// bpu.scala:148:22
  reg  [3:0]        BHT_194;	// bpu.scala:148:22
  reg  [3:0]        BHT_195;	// bpu.scala:148:22
  reg  [3:0]        BHT_196;	// bpu.scala:148:22
  reg  [3:0]        BHT_197;	// bpu.scala:148:22
  reg  [3:0]        BHT_198;	// bpu.scala:148:22
  reg  [3:0]        BHT_199;	// bpu.scala:148:22
  reg  [3:0]        BHT_200;	// bpu.scala:148:22
  reg  [3:0]        BHT_201;	// bpu.scala:148:22
  reg  [3:0]        BHT_202;	// bpu.scala:148:22
  reg  [3:0]        BHT_203;	// bpu.scala:148:22
  reg  [3:0]        BHT_204;	// bpu.scala:148:22
  reg  [3:0]        BHT_205;	// bpu.scala:148:22
  reg  [3:0]        BHT_206;	// bpu.scala:148:22
  reg  [3:0]        BHT_207;	// bpu.scala:148:22
  reg  [3:0]        BHT_208;	// bpu.scala:148:22
  reg  [3:0]        BHT_209;	// bpu.scala:148:22
  reg  [3:0]        BHT_210;	// bpu.scala:148:22
  reg  [3:0]        BHT_211;	// bpu.scala:148:22
  reg  [3:0]        BHT_212;	// bpu.scala:148:22
  reg  [3:0]        BHT_213;	// bpu.scala:148:22
  reg  [3:0]        BHT_214;	// bpu.scala:148:22
  reg  [3:0]        BHT_215;	// bpu.scala:148:22
  reg  [3:0]        BHT_216;	// bpu.scala:148:22
  reg  [3:0]        BHT_217;	// bpu.scala:148:22
  reg  [3:0]        BHT_218;	// bpu.scala:148:22
  reg  [3:0]        BHT_219;	// bpu.scala:148:22
  reg  [3:0]        BHT_220;	// bpu.scala:148:22
  reg  [3:0]        BHT_221;	// bpu.scala:148:22
  reg  [3:0]        BHT_222;	// bpu.scala:148:22
  reg  [3:0]        BHT_223;	// bpu.scala:148:22
  reg  [3:0]        BHT_224;	// bpu.scala:148:22
  reg  [3:0]        BHT_225;	// bpu.scala:148:22
  reg  [3:0]        BHT_226;	// bpu.scala:148:22
  reg  [3:0]        BHT_227;	// bpu.scala:148:22
  reg  [3:0]        BHT_228;	// bpu.scala:148:22
  reg  [3:0]        BHT_229;	// bpu.scala:148:22
  reg  [3:0]        BHT_230;	// bpu.scala:148:22
  reg  [3:0]        BHT_231;	// bpu.scala:148:22
  reg  [3:0]        BHT_232;	// bpu.scala:148:22
  reg  [3:0]        BHT_233;	// bpu.scala:148:22
  reg  [3:0]        BHT_234;	// bpu.scala:148:22
  reg  [3:0]        BHT_235;	// bpu.scala:148:22
  reg  [3:0]        BHT_236;	// bpu.scala:148:22
  reg  [3:0]        BHT_237;	// bpu.scala:148:22
  reg  [3:0]        BHT_238;	// bpu.scala:148:22
  reg  [3:0]        BHT_239;	// bpu.scala:148:22
  reg  [3:0]        BHT_240;	// bpu.scala:148:22
  reg  [3:0]        BHT_241;	// bpu.scala:148:22
  reg  [3:0]        BHT_242;	// bpu.scala:148:22
  reg  [3:0]        BHT_243;	// bpu.scala:148:22
  reg  [3:0]        BHT_244;	// bpu.scala:148:22
  reg  [3:0]        BHT_245;	// bpu.scala:148:22
  reg  [3:0]        BHT_246;	// bpu.scala:148:22
  reg  [3:0]        BHT_247;	// bpu.scala:148:22
  reg  [3:0]        BHT_248;	// bpu.scala:148:22
  reg  [3:0]        BHT_249;	// bpu.scala:148:22
  reg  [3:0]        BHT_250;	// bpu.scala:148:22
  reg  [3:0]        BHT_251;	// bpu.scala:148:22
  reg  [3:0]        BHT_252;	// bpu.scala:148:22
  reg  [3:0]        BHT_253;	// bpu.scala:148:22
  reg  [3:0]        BHT_254;	// bpu.scala:148:22
  reg  [3:0]        BHT_255;	// bpu.scala:148:22
  reg  [1:0]        PHT_0;	// bpu.scala:149:22
  reg  [1:0]        PHT_1;	// bpu.scala:149:22
  reg  [1:0]        PHT_2;	// bpu.scala:149:22
  reg  [1:0]        PHT_3;	// bpu.scala:149:22
  reg  [1:0]        PHT_4;	// bpu.scala:149:22
  reg  [1:0]        PHT_5;	// bpu.scala:149:22
  reg  [1:0]        PHT_6;	// bpu.scala:149:22
  reg  [1:0]        PHT_7;	// bpu.scala:149:22
  reg  [1:0]        PHT_8;	// bpu.scala:149:22
  reg  [1:0]        PHT_9;	// bpu.scala:149:22
  reg  [1:0]        PHT_10;	// bpu.scala:149:22
  reg  [1:0]        PHT_11;	// bpu.scala:149:22
  reg  [1:0]        PHT_12;	// bpu.scala:149:22
  reg  [1:0]        PHT_13;	// bpu.scala:149:22
  reg  [1:0]        PHT_14;	// bpu.scala:149:22
  reg  [1:0]        PHT_15;	// bpu.scala:149:22
  reg  [1:0]        PHT_16;	// bpu.scala:149:22
  reg  [1:0]        PHT_17;	// bpu.scala:149:22
  reg  [1:0]        PHT_18;	// bpu.scala:149:22
  reg  [1:0]        PHT_19;	// bpu.scala:149:22
  reg  [1:0]        PHT_20;	// bpu.scala:149:22
  reg  [1:0]        PHT_21;	// bpu.scala:149:22
  reg  [1:0]        PHT_22;	// bpu.scala:149:22
  reg  [1:0]        PHT_23;	// bpu.scala:149:22
  reg  [1:0]        PHT_24;	// bpu.scala:149:22
  reg  [1:0]        PHT_25;	// bpu.scala:149:22
  reg  [1:0]        PHT_26;	// bpu.scala:149:22
  reg  [1:0]        PHT_27;	// bpu.scala:149:22
  reg  [1:0]        PHT_28;	// bpu.scala:149:22
  reg  [1:0]        PHT_29;	// bpu.scala:149:22
  reg  [1:0]        PHT_30;	// bpu.scala:149:22
  reg  [1:0]        PHT_31;	// bpu.scala:149:22
  reg  [1:0]        PHT_32;	// bpu.scala:149:22
  reg  [1:0]        PHT_33;	// bpu.scala:149:22
  reg  [1:0]        PHT_34;	// bpu.scala:149:22
  reg  [1:0]        PHT_35;	// bpu.scala:149:22
  reg  [1:0]        PHT_36;	// bpu.scala:149:22
  reg  [1:0]        PHT_37;	// bpu.scala:149:22
  reg  [1:0]        PHT_38;	// bpu.scala:149:22
  reg  [1:0]        PHT_39;	// bpu.scala:149:22
  reg  [1:0]        PHT_40;	// bpu.scala:149:22
  reg  [1:0]        PHT_41;	// bpu.scala:149:22
  reg  [1:0]        PHT_42;	// bpu.scala:149:22
  reg  [1:0]        PHT_43;	// bpu.scala:149:22
  reg  [1:0]        PHT_44;	// bpu.scala:149:22
  reg  [1:0]        PHT_45;	// bpu.scala:149:22
  reg  [1:0]        PHT_46;	// bpu.scala:149:22
  reg  [1:0]        PHT_47;	// bpu.scala:149:22
  reg  [1:0]        PHT_48;	// bpu.scala:149:22
  reg  [1:0]        PHT_49;	// bpu.scala:149:22
  reg  [1:0]        PHT_50;	// bpu.scala:149:22
  reg  [1:0]        PHT_51;	// bpu.scala:149:22
  reg  [1:0]        PHT_52;	// bpu.scala:149:22
  reg  [1:0]        PHT_53;	// bpu.scala:149:22
  reg  [1:0]        PHT_54;	// bpu.scala:149:22
  reg  [1:0]        PHT_55;	// bpu.scala:149:22
  reg  [1:0]        PHT_56;	// bpu.scala:149:22
  reg  [1:0]        PHT_57;	// bpu.scala:149:22
  reg  [1:0]        PHT_58;	// bpu.scala:149:22
  reg  [1:0]        PHT_59;	// bpu.scala:149:22
  reg  [1:0]        PHT_60;	// bpu.scala:149:22
  reg  [1:0]        PHT_61;	// bpu.scala:149:22
  reg  [1:0]        PHT_62;	// bpu.scala:149:22
  reg  [1:0]        PHT_63;	// bpu.scala:149:22
  reg  [1:0]        PHT_64;	// bpu.scala:149:22
  reg  [1:0]        PHT_65;	// bpu.scala:149:22
  reg  [1:0]        PHT_66;	// bpu.scala:149:22
  reg  [1:0]        PHT_67;	// bpu.scala:149:22
  reg  [1:0]        PHT_68;	// bpu.scala:149:22
  reg  [1:0]        PHT_69;	// bpu.scala:149:22
  reg  [1:0]        PHT_70;	// bpu.scala:149:22
  reg  [1:0]        PHT_71;	// bpu.scala:149:22
  reg  [1:0]        PHT_72;	// bpu.scala:149:22
  reg  [1:0]        PHT_73;	// bpu.scala:149:22
  reg  [1:0]        PHT_74;	// bpu.scala:149:22
  reg  [1:0]        PHT_75;	// bpu.scala:149:22
  reg  [1:0]        PHT_76;	// bpu.scala:149:22
  reg  [1:0]        PHT_77;	// bpu.scala:149:22
  reg  [1:0]        PHT_78;	// bpu.scala:149:22
  reg  [1:0]        PHT_79;	// bpu.scala:149:22
  reg  [1:0]        PHT_80;	// bpu.scala:149:22
  reg  [1:0]        PHT_81;	// bpu.scala:149:22
  reg  [1:0]        PHT_82;	// bpu.scala:149:22
  reg  [1:0]        PHT_83;	// bpu.scala:149:22
  reg  [1:0]        PHT_84;	// bpu.scala:149:22
  reg  [1:0]        PHT_85;	// bpu.scala:149:22
  reg  [1:0]        PHT_86;	// bpu.scala:149:22
  reg  [1:0]        PHT_87;	// bpu.scala:149:22
  reg  [1:0]        PHT_88;	// bpu.scala:149:22
  reg  [1:0]        PHT_89;	// bpu.scala:149:22
  reg  [1:0]        PHT_90;	// bpu.scala:149:22
  reg  [1:0]        PHT_91;	// bpu.scala:149:22
  reg  [1:0]        PHT_92;	// bpu.scala:149:22
  reg  [1:0]        PHT_93;	// bpu.scala:149:22
  reg  [1:0]        PHT_94;	// bpu.scala:149:22
  reg  [1:0]        PHT_95;	// bpu.scala:149:22
  reg  [1:0]        PHT_96;	// bpu.scala:149:22
  reg  [1:0]        PHT_97;	// bpu.scala:149:22
  reg  [1:0]        PHT_98;	// bpu.scala:149:22
  reg  [1:0]        PHT_99;	// bpu.scala:149:22
  reg  [1:0]        PHT_100;	// bpu.scala:149:22
  reg  [1:0]        PHT_101;	// bpu.scala:149:22
  reg  [1:0]        PHT_102;	// bpu.scala:149:22
  reg  [1:0]        PHT_103;	// bpu.scala:149:22
  reg  [1:0]        PHT_104;	// bpu.scala:149:22
  reg  [1:0]        PHT_105;	// bpu.scala:149:22
  reg  [1:0]        PHT_106;	// bpu.scala:149:22
  reg  [1:0]        PHT_107;	// bpu.scala:149:22
  reg  [1:0]        PHT_108;	// bpu.scala:149:22
  reg  [1:0]        PHT_109;	// bpu.scala:149:22
  reg  [1:0]        PHT_110;	// bpu.scala:149:22
  reg  [1:0]        PHT_111;	// bpu.scala:149:22
  reg  [1:0]        PHT_112;	// bpu.scala:149:22
  reg  [1:0]        PHT_113;	// bpu.scala:149:22
  reg  [1:0]        PHT_114;	// bpu.scala:149:22
  reg  [1:0]        PHT_115;	// bpu.scala:149:22
  reg  [1:0]        PHT_116;	// bpu.scala:149:22
  reg  [1:0]        PHT_117;	// bpu.scala:149:22
  reg  [1:0]        PHT_118;	// bpu.scala:149:22
  reg  [1:0]        PHT_119;	// bpu.scala:149:22
  reg  [1:0]        PHT_120;	// bpu.scala:149:22
  reg  [1:0]        PHT_121;	// bpu.scala:149:22
  reg  [1:0]        PHT_122;	// bpu.scala:149:22
  reg  [1:0]        PHT_123;	// bpu.scala:149:22
  reg  [1:0]        PHT_124;	// bpu.scala:149:22
  reg  [1:0]        PHT_125;	// bpu.scala:149:22
  reg  [1:0]        PHT_126;	// bpu.scala:149:22
  reg  [1:0]        PHT_127;	// bpu.scala:149:22
  reg  [1:0]        PHT_128;	// bpu.scala:149:22
  reg  [1:0]        PHT_129;	// bpu.scala:149:22
  reg  [1:0]        PHT_130;	// bpu.scala:149:22
  reg  [1:0]        PHT_131;	// bpu.scala:149:22
  reg  [1:0]        PHT_132;	// bpu.scala:149:22
  reg  [1:0]        PHT_133;	// bpu.scala:149:22
  reg  [1:0]        PHT_134;	// bpu.scala:149:22
  reg  [1:0]        PHT_135;	// bpu.scala:149:22
  reg  [1:0]        PHT_136;	// bpu.scala:149:22
  reg  [1:0]        PHT_137;	// bpu.scala:149:22
  reg  [1:0]        PHT_138;	// bpu.scala:149:22
  reg  [1:0]        PHT_139;	// bpu.scala:149:22
  reg  [1:0]        PHT_140;	// bpu.scala:149:22
  reg  [1:0]        PHT_141;	// bpu.scala:149:22
  reg  [1:0]        PHT_142;	// bpu.scala:149:22
  reg  [1:0]        PHT_143;	// bpu.scala:149:22
  reg  [1:0]        PHT_144;	// bpu.scala:149:22
  reg  [1:0]        PHT_145;	// bpu.scala:149:22
  reg  [1:0]        PHT_146;	// bpu.scala:149:22
  reg  [1:0]        PHT_147;	// bpu.scala:149:22
  reg  [1:0]        PHT_148;	// bpu.scala:149:22
  reg  [1:0]        PHT_149;	// bpu.scala:149:22
  reg  [1:0]        PHT_150;	// bpu.scala:149:22
  reg  [1:0]        PHT_151;	// bpu.scala:149:22
  reg  [1:0]        PHT_152;	// bpu.scala:149:22
  reg  [1:0]        PHT_153;	// bpu.scala:149:22
  reg  [1:0]        PHT_154;	// bpu.scala:149:22
  reg  [1:0]        PHT_155;	// bpu.scala:149:22
  reg  [1:0]        PHT_156;	// bpu.scala:149:22
  reg  [1:0]        PHT_157;	// bpu.scala:149:22
  reg  [1:0]        PHT_158;	// bpu.scala:149:22
  reg  [1:0]        PHT_159;	// bpu.scala:149:22
  reg  [1:0]        PHT_160;	// bpu.scala:149:22
  reg  [1:0]        PHT_161;	// bpu.scala:149:22
  reg  [1:0]        PHT_162;	// bpu.scala:149:22
  reg  [1:0]        PHT_163;	// bpu.scala:149:22
  reg  [1:0]        PHT_164;	// bpu.scala:149:22
  reg  [1:0]        PHT_165;	// bpu.scala:149:22
  reg  [1:0]        PHT_166;	// bpu.scala:149:22
  reg  [1:0]        PHT_167;	// bpu.scala:149:22
  reg  [1:0]        PHT_168;	// bpu.scala:149:22
  reg  [1:0]        PHT_169;	// bpu.scala:149:22
  reg  [1:0]        PHT_170;	// bpu.scala:149:22
  reg  [1:0]        PHT_171;	// bpu.scala:149:22
  reg  [1:0]        PHT_172;	// bpu.scala:149:22
  reg  [1:0]        PHT_173;	// bpu.scala:149:22
  reg  [1:0]        PHT_174;	// bpu.scala:149:22
  reg  [1:0]        PHT_175;	// bpu.scala:149:22
  reg  [1:0]        PHT_176;	// bpu.scala:149:22
  reg  [1:0]        PHT_177;	// bpu.scala:149:22
  reg  [1:0]        PHT_178;	// bpu.scala:149:22
  reg  [1:0]        PHT_179;	// bpu.scala:149:22
  reg  [1:0]        PHT_180;	// bpu.scala:149:22
  reg  [1:0]        PHT_181;	// bpu.scala:149:22
  reg  [1:0]        PHT_182;	// bpu.scala:149:22
  reg  [1:0]        PHT_183;	// bpu.scala:149:22
  reg  [1:0]        PHT_184;	// bpu.scala:149:22
  reg  [1:0]        PHT_185;	// bpu.scala:149:22
  reg  [1:0]        PHT_186;	// bpu.scala:149:22
  reg  [1:0]        PHT_187;	// bpu.scala:149:22
  reg  [1:0]        PHT_188;	// bpu.scala:149:22
  reg  [1:0]        PHT_189;	// bpu.scala:149:22
  reg  [1:0]        PHT_190;	// bpu.scala:149:22
  reg  [1:0]        PHT_191;	// bpu.scala:149:22
  reg  [1:0]        PHT_192;	// bpu.scala:149:22
  reg  [1:0]        PHT_193;	// bpu.scala:149:22
  reg  [1:0]        PHT_194;	// bpu.scala:149:22
  reg  [1:0]        PHT_195;	// bpu.scala:149:22
  reg  [1:0]        PHT_196;	// bpu.scala:149:22
  reg  [1:0]        PHT_197;	// bpu.scala:149:22
  reg  [1:0]        PHT_198;	// bpu.scala:149:22
  reg  [1:0]        PHT_199;	// bpu.scala:149:22
  reg  [1:0]        PHT_200;	// bpu.scala:149:22
  reg  [1:0]        PHT_201;	// bpu.scala:149:22
  reg  [1:0]        PHT_202;	// bpu.scala:149:22
  reg  [1:0]        PHT_203;	// bpu.scala:149:22
  reg  [1:0]        PHT_204;	// bpu.scala:149:22
  reg  [1:0]        PHT_205;	// bpu.scala:149:22
  reg  [1:0]        PHT_206;	// bpu.scala:149:22
  reg  [1:0]        PHT_207;	// bpu.scala:149:22
  reg  [1:0]        PHT_208;	// bpu.scala:149:22
  reg  [1:0]        PHT_209;	// bpu.scala:149:22
  reg  [1:0]        PHT_210;	// bpu.scala:149:22
  reg  [1:0]        PHT_211;	// bpu.scala:149:22
  reg  [1:0]        PHT_212;	// bpu.scala:149:22
  reg  [1:0]        PHT_213;	// bpu.scala:149:22
  reg  [1:0]        PHT_214;	// bpu.scala:149:22
  reg  [1:0]        PHT_215;	// bpu.scala:149:22
  reg  [1:0]        PHT_216;	// bpu.scala:149:22
  reg  [1:0]        PHT_217;	// bpu.scala:149:22
  reg  [1:0]        PHT_218;	// bpu.scala:149:22
  reg  [1:0]        PHT_219;	// bpu.scala:149:22
  reg  [1:0]        PHT_220;	// bpu.scala:149:22
  reg  [1:0]        PHT_221;	// bpu.scala:149:22
  reg  [1:0]        PHT_222;	// bpu.scala:149:22
  reg  [1:0]        PHT_223;	// bpu.scala:149:22
  reg  [1:0]        PHT_224;	// bpu.scala:149:22
  reg  [1:0]        PHT_225;	// bpu.scala:149:22
  reg  [1:0]        PHT_226;	// bpu.scala:149:22
  reg  [1:0]        PHT_227;	// bpu.scala:149:22
  reg  [1:0]        PHT_228;	// bpu.scala:149:22
  reg  [1:0]        PHT_229;	// bpu.scala:149:22
  reg  [1:0]        PHT_230;	// bpu.scala:149:22
  reg  [1:0]        PHT_231;	// bpu.scala:149:22
  reg  [1:0]        PHT_232;	// bpu.scala:149:22
  reg  [1:0]        PHT_233;	// bpu.scala:149:22
  reg  [1:0]        PHT_234;	// bpu.scala:149:22
  reg  [1:0]        PHT_235;	// bpu.scala:149:22
  reg  [1:0]        PHT_236;	// bpu.scala:149:22
  reg  [1:0]        PHT_237;	// bpu.scala:149:22
  reg  [1:0]        PHT_238;	// bpu.scala:149:22
  reg  [1:0]        PHT_239;	// bpu.scala:149:22
  reg  [1:0]        PHT_240;	// bpu.scala:149:22
  reg  [1:0]        PHT_241;	// bpu.scala:149:22
  reg  [1:0]        PHT_242;	// bpu.scala:149:22
  reg  [1:0]        PHT_243;	// bpu.scala:149:22
  reg  [1:0]        PHT_244;	// bpu.scala:149:22
  reg  [1:0]        PHT_245;	// bpu.scala:149:22
  reg  [1:0]        PHT_246;	// bpu.scala:149:22
  reg  [1:0]        PHT_247;	// bpu.scala:149:22
  reg  [1:0]        PHT_248;	// bpu.scala:149:22
  reg  [1:0]        PHT_249;	// bpu.scala:149:22
  reg  [1:0]        PHT_250;	// bpu.scala:149:22
  reg  [1:0]        PHT_251;	// bpu.scala:149:22
  reg  [1:0]        PHT_252;	// bpu.scala:149:22
  reg  [1:0]        PHT_253;	// bpu.scala:149:22
  reg  [1:0]        PHT_254;	// bpu.scala:149:22
  reg  [1:0]        PHT_255;	// bpu.scala:149:22
  wire              _io_bp_flush_T_1 = io_ID_to_BPU_bus_valid & bp_target != io_ID_to_BPU_bus_bits_br_target;	// bpu.scala:141:28, :168:{49,62}
  wire [63:0]       _io_bp_npc_T_1 = io_PF_pc + 64'h4;	// bpu.scala:169:43
  wire [15:0]       bht_idx_x1 = io_PF_pc[31:16] ^ io_PF_pc[15:0];	// bpu.scala:121:{19,28,31}
  wire [255:0][3:0] _GEN_0 = {{BHT_255}, {BHT_254}, {BHT_253}, {BHT_252}, {BHT_251}, {BHT_250}, {BHT_249}, {BHT_248},
                {BHT_247}, {BHT_246}, {BHT_245}, {BHT_244}, {BHT_243}, {BHT_242}, {BHT_241}, {BHT_240},
                {BHT_239}, {BHT_238}, {BHT_237}, {BHT_236}, {BHT_235}, {BHT_234}, {BHT_233}, {BHT_232},
                {BHT_231}, {BHT_230}, {BHT_229}, {BHT_228}, {BHT_227}, {BHT_226}, {BHT_225}, {BHT_224},
                {BHT_223}, {BHT_222}, {BHT_221}, {BHT_220}, {BHT_219}, {BHT_218}, {BHT_217}, {BHT_216},
                {BHT_215}, {BHT_214}, {BHT_213}, {BHT_212}, {BHT_211}, {BHT_210}, {BHT_209}, {BHT_208},
                {BHT_207}, {BHT_206}, {BHT_205}, {BHT_204}, {BHT_203}, {BHT_202}, {BHT_201}, {BHT_200},
                {BHT_199}, {BHT_198}, {BHT_197}, {BHT_196}, {BHT_195}, {BHT_194}, {BHT_193}, {BHT_192},
                {BHT_191}, {BHT_190}, {BHT_189}, {BHT_188}, {BHT_187}, {BHT_186}, {BHT_185}, {BHT_184},
                {BHT_183}, {BHT_182}, {BHT_181}, {BHT_180}, {BHT_179}, {BHT_178}, {BHT_177}, {BHT_176},
                {BHT_175}, {BHT_174}, {BHT_173}, {BHT_172}, {BHT_171}, {BHT_170}, {BHT_169}, {BHT_168},
                {BHT_167}, {BHT_166}, {BHT_165}, {BHT_164}, {BHT_163}, {BHT_162}, {BHT_161}, {BHT_160},
                {BHT_159}, {BHT_158}, {BHT_157}, {BHT_156}, {BHT_155}, {BHT_154}, {BHT_153}, {BHT_152},
                {BHT_151}, {BHT_150}, {BHT_149}, {BHT_148}, {BHT_147}, {BHT_146}, {BHT_145}, {BHT_144},
                {BHT_143}, {BHT_142}, {BHT_141}, {BHT_140}, {BHT_139}, {BHT_138}, {BHT_137}, {BHT_136},
                {BHT_135}, {BHT_134}, {BHT_133}, {BHT_132}, {BHT_131}, {BHT_130}, {BHT_129}, {BHT_128},
                {BHT_127}, {BHT_126}, {BHT_125}, {BHT_124}, {BHT_123}, {BHT_122}, {BHT_121}, {BHT_120},
                {BHT_119}, {BHT_118}, {BHT_117}, {BHT_116}, {BHT_115}, {BHT_114}, {BHT_113}, {BHT_112},
                {BHT_111}, {BHT_110}, {BHT_109}, {BHT_108}, {BHT_107}, {BHT_106}, {BHT_105}, {BHT_104},
                {BHT_103}, {BHT_102}, {BHT_101}, {BHT_100}, {BHT_99}, {BHT_98}, {BHT_97}, {BHT_96},
                {BHT_95}, {BHT_94}, {BHT_93}, {BHT_92}, {BHT_91}, {BHT_90}, {BHT_89}, {BHT_88}, {BHT_87},
                {BHT_86}, {BHT_85}, {BHT_84}, {BHT_83}, {BHT_82}, {BHT_81}, {BHT_80}, {BHT_79}, {BHT_78},
                {BHT_77}, {BHT_76}, {BHT_75}, {BHT_74}, {BHT_73}, {BHT_72}, {BHT_71}, {BHT_70}, {BHT_69},
                {BHT_68}, {BHT_67}, {BHT_66}, {BHT_65}, {BHT_64}, {BHT_63}, {BHT_62}, {BHT_61}, {BHT_60},
                {BHT_59}, {BHT_58}, {BHT_57}, {BHT_56}, {BHT_55}, {BHT_54}, {BHT_53}, {BHT_52}, {BHT_51},
                {BHT_50}, {BHT_49}, {BHT_48}, {BHT_47}, {BHT_46}, {BHT_45}, {BHT_44}, {BHT_43}, {BHT_42},
                {BHT_41}, {BHT_40}, {BHT_39}, {BHT_38}, {BHT_37}, {BHT_36}, {BHT_35}, {BHT_34}, {BHT_33},
                {BHT_32}, {BHT_31}, {BHT_30}, {BHT_29}, {BHT_28}, {BHT_27}, {BHT_26}, {BHT_25}, {BHT_24},
                {BHT_23}, {BHT_22}, {BHT_21}, {BHT_20}, {BHT_19}, {BHT_18}, {BHT_17}, {BHT_16}, {BHT_15},
                {BHT_14}, {BHT_13}, {BHT_12}, {BHT_11}, {BHT_10}, {BHT_9}, {BHT_8}, {BHT_7}, {BHT_6},
                {BHT_5}, {BHT_4}, {BHT_3}, {BHT_2}, {BHT_1}, {BHT_0}};	// bpu.scala:148:22, :179:32
  wire [3:0]        _GEN_1;	// bpu.scala:179:32
  /* synopsys infer_mux_override */
  assign _GEN_1 = _GEN_0[bht_idx_x1[15:8] ^ bht_idx_x1[7:0]] /* cadence map_to_mux */;	// bpu.scala:121:28, :122:{18,26,30}, :179:32
  wire              _T_12 = _BTB_io_hit & io_PF_valid;	// bpu.scala:150:21, :182:21
  wire [255:0][1:0] _GEN_2 = {{PHT_255}, {PHT_254}, {PHT_253}, {PHT_252}, {PHT_251}, {PHT_250}, {PHT_249}, {PHT_248},
                {PHT_247}, {PHT_246}, {PHT_245}, {PHT_244}, {PHT_243}, {PHT_242}, {PHT_241}, {PHT_240},
                {PHT_239}, {PHT_238}, {PHT_237}, {PHT_236}, {PHT_235}, {PHT_234}, {PHT_233}, {PHT_232},
                {PHT_231}, {PHT_230}, {PHT_229}, {PHT_228}, {PHT_227}, {PHT_226}, {PHT_225}, {PHT_224},
                {PHT_223}, {PHT_222}, {PHT_221}, {PHT_220}, {PHT_219}, {PHT_218}, {PHT_217}, {PHT_216},
                {PHT_215}, {PHT_214}, {PHT_213}, {PHT_212}, {PHT_211}, {PHT_210}, {PHT_209}, {PHT_208},
                {PHT_207}, {PHT_206}, {PHT_205}, {PHT_204}, {PHT_203}, {PHT_202}, {PHT_201}, {PHT_200},
                {PHT_199}, {PHT_198}, {PHT_197}, {PHT_196}, {PHT_195}, {PHT_194}, {PHT_193}, {PHT_192},
                {PHT_191}, {PHT_190}, {PHT_189}, {PHT_188}, {PHT_187}, {PHT_186}, {PHT_185}, {PHT_184},
                {PHT_183}, {PHT_182}, {PHT_181}, {PHT_180}, {PHT_179}, {PHT_178}, {PHT_177}, {PHT_176},
                {PHT_175}, {PHT_174}, {PHT_173}, {PHT_172}, {PHT_171}, {PHT_170}, {PHT_169}, {PHT_168},
                {PHT_167}, {PHT_166}, {PHT_165}, {PHT_164}, {PHT_163}, {PHT_162}, {PHT_161}, {PHT_160},
                {PHT_159}, {PHT_158}, {PHT_157}, {PHT_156}, {PHT_155}, {PHT_154}, {PHT_153}, {PHT_152},
                {PHT_151}, {PHT_150}, {PHT_149}, {PHT_148}, {PHT_147}, {PHT_146}, {PHT_145}, {PHT_144},
                {PHT_143}, {PHT_142}, {PHT_141}, {PHT_140}, {PHT_139}, {PHT_138}, {PHT_137}, {PHT_136},
                {PHT_135}, {PHT_134}, {PHT_133}, {PHT_132}, {PHT_131}, {PHT_130}, {PHT_129}, {PHT_128},
                {PHT_127}, {PHT_126}, {PHT_125}, {PHT_124}, {PHT_123}, {PHT_122}, {PHT_121}, {PHT_120},
                {PHT_119}, {PHT_118}, {PHT_117}, {PHT_116}, {PHT_115}, {PHT_114}, {PHT_113}, {PHT_112},
                {PHT_111}, {PHT_110}, {PHT_109}, {PHT_108}, {PHT_107}, {PHT_106}, {PHT_105}, {PHT_104},
                {PHT_103}, {PHT_102}, {PHT_101}, {PHT_100}, {PHT_99}, {PHT_98}, {PHT_97}, {PHT_96},
                {PHT_95}, {PHT_94}, {PHT_93}, {PHT_92}, {PHT_91}, {PHT_90}, {PHT_89}, {PHT_88}, {PHT_87},
                {PHT_86}, {PHT_85}, {PHT_84}, {PHT_83}, {PHT_82}, {PHT_81}, {PHT_80}, {PHT_79}, {PHT_78},
                {PHT_77}, {PHT_76}, {PHT_75}, {PHT_74}, {PHT_73}, {PHT_72}, {PHT_71}, {PHT_70}, {PHT_69},
                {PHT_68}, {PHT_67}, {PHT_66}, {PHT_65}, {PHT_64}, {PHT_63}, {PHT_62}, {PHT_61}, {PHT_60},
                {PHT_59}, {PHT_58}, {PHT_57}, {PHT_56}, {PHT_55}, {PHT_54}, {PHT_53}, {PHT_52}, {PHT_51},
                {PHT_50}, {PHT_49}, {PHT_48}, {PHT_47}, {PHT_46}, {PHT_45}, {PHT_44}, {PHT_43}, {PHT_42},
                {PHT_41}, {PHT_40}, {PHT_39}, {PHT_38}, {PHT_37}, {PHT_36}, {PHT_35}, {PHT_34}, {PHT_33},
                {PHT_32}, {PHT_31}, {PHT_30}, {PHT_29}, {PHT_28}, {PHT_27}, {PHT_26}, {PHT_25}, {PHT_24},
                {PHT_23}, {PHT_22}, {PHT_21}, {PHT_20}, {PHT_19}, {PHT_18}, {PHT_17}, {PHT_16}, {PHT_15},
                {PHT_14}, {PHT_13}, {PHT_12}, {PHT_11}, {PHT_10}, {PHT_9}, {PHT_8}, {PHT_7}, {PHT_6},
                {PHT_5}, {PHT_4}, {PHT_3}, {PHT_2}, {PHT_1}, {PHT_0}};	// bpu.scala:149:22, :183:34
  wire [1:0]        _GEN_3;	// bpu.scala:183:34
  /* synopsys infer_mux_override */
  assign _GEN_3 = _GEN_2[{4'h0, _GEN_1 ^ io_PF_pc[3:0]}] /* cadence map_to_mux */;	// bpu.scala:148:30, :179:{32,42}, :183:34
  assign _GEN = _T_12 & _T_13 & _GEN_3[0];	// bpu.scala:143:18, :181:18, :182:{21,55}, :183:{18,34}
  wire [15:0]       up_bht_idx_x1 = io_ID_to_BPU_bus_bits_PC[31:16] ^ io_ID_to_BPU_bus_bits_PC[15:0];	// bpu.scala:121:{19,28,31}
  wire [7:0]        _up_bht_idx_ret_T_2 = up_bht_idx_x1[15:8] ^ up_bht_idx_x1[7:0];	// bpu.scala:121:28, :122:{18,26,30}
  wire [3:0]        _GEN_4;	// bpu.scala:189:38
  /* synopsys infer_mux_override */
  assign _GEN_4 = _GEN_0[_up_bht_idx_ret_T_2] /* cadence map_to_mux */;	// bpu.scala:122:26, :179:32, :189:38
  wire [3:0]        up_pht_idx = _GEN_4 ^ io_ID_to_BPU_bus_bits_PC[3:0];	// bpu.scala:189:{38,45}
  wire [1:0]        _GEN_5;	// bpu.scala:194:30
  /* synopsys infer_mux_override */
  assign _GEN_5 = _GEN_2[{4'h0, up_pht_idx}] /* cadence map_to_mux */;	// bpu.scala:148:30, :183:34, :189:38, :194:30
  wire [1:0]        _GEN_6;	// bpu.scala:199:30
  /* synopsys infer_mux_override */
  assign _GEN_6 = _GEN_2[_up_bht_idx_ret_T_2] /* cadence map_to_mux */;	// bpu.scala:122:26, :183:34, :199:30
  reg  [31:0]       br_cnt;	// bpu.scala:205:26
  reg  [31:0]       bp_fail;	// bpu.scala:206:26
  reg  [31:0]       hit_cnt;	// bpu.scala:207:26
  always @(posedge clock) begin
    if (reset) begin
      bp_target <= 64'h0;	// bpu.scala:141:28
      BHT_0 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_1 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_2 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_3 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_4 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_5 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_6 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_7 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_8 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_9 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_10 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_11 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_12 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_13 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_14 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_15 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_16 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_17 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_18 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_19 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_20 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_21 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_22 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_23 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_24 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_25 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_26 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_27 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_28 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_29 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_30 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_31 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_32 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_33 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_34 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_35 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_36 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_37 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_38 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_39 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_40 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_41 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_42 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_43 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_44 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_45 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_46 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_47 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_48 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_49 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_50 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_51 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_52 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_53 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_54 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_55 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_56 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_57 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_58 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_59 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_60 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_61 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_62 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_63 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_64 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_65 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_66 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_67 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_68 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_69 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_70 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_71 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_72 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_73 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_74 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_75 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_76 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_77 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_78 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_79 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_80 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_81 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_82 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_83 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_84 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_85 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_86 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_87 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_88 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_89 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_90 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_91 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_92 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_93 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_94 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_95 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_96 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_97 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_98 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_99 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_100 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_101 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_102 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_103 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_104 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_105 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_106 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_107 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_108 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_109 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_110 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_111 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_112 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_113 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_114 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_115 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_116 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_117 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_118 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_119 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_120 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_121 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_122 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_123 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_124 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_125 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_126 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_127 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_128 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_129 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_130 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_131 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_132 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_133 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_134 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_135 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_136 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_137 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_138 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_139 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_140 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_141 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_142 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_143 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_144 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_145 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_146 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_147 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_148 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_149 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_150 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_151 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_152 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_153 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_154 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_155 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_156 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_157 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_158 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_159 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_160 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_161 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_162 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_163 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_164 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_165 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_166 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_167 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_168 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_169 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_170 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_171 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_172 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_173 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_174 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_175 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_176 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_177 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_178 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_179 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_180 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_181 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_182 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_183 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_184 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_185 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_186 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_187 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_188 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_189 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_190 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_191 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_192 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_193 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_194 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_195 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_196 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_197 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_198 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_199 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_200 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_201 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_202 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_203 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_204 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_205 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_206 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_207 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_208 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_209 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_210 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_211 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_212 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_213 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_214 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_215 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_216 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_217 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_218 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_219 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_220 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_221 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_222 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_223 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_224 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_225 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_226 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_227 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_228 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_229 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_230 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_231 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_232 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_233 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_234 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_235 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_236 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_237 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_238 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_239 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_240 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_241 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_242 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_243 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_244 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_245 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_246 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_247 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_248 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_249 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_250 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_251 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_252 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_253 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_254 <= 4'h0;	// bpu.scala:148:{22,30}
      BHT_255 <= 4'h0;	// bpu.scala:148:{22,30}
      PHT_0 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_1 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_2 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_3 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_4 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_5 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_6 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_7 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_8 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_9 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_10 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_11 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_12 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_13 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_14 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_15 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_16 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_17 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_18 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_19 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_20 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_21 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_22 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_23 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_24 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_25 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_26 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_27 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_28 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_29 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_30 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_31 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_32 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_33 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_34 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_35 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_36 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_37 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_38 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_39 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_40 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_41 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_42 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_43 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_44 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_45 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_46 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_47 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_48 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_49 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_50 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_51 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_52 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_53 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_54 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_55 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_56 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_57 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_58 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_59 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_60 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_61 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_62 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_63 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_64 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_65 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_66 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_67 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_68 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_69 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_70 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_71 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_72 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_73 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_74 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_75 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_76 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_77 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_78 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_79 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_80 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_81 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_82 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_83 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_84 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_85 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_86 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_87 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_88 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_89 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_90 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_91 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_92 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_93 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_94 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_95 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_96 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_97 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_98 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_99 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_100 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_101 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_102 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_103 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_104 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_105 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_106 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_107 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_108 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_109 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_110 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_111 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_112 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_113 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_114 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_115 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_116 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_117 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_118 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_119 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_120 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_121 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_122 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_123 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_124 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_125 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_126 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_127 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_128 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_129 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_130 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_131 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_132 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_133 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_134 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_135 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_136 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_137 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_138 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_139 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_140 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_141 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_142 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_143 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_144 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_145 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_146 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_147 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_148 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_149 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_150 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_151 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_152 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_153 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_154 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_155 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_156 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_157 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_158 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_159 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_160 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_161 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_162 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_163 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_164 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_165 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_166 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_167 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_168 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_169 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_170 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_171 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_172 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_173 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_174 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_175 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_176 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_177 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_178 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_179 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_180 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_181 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_182 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_183 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_184 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_185 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_186 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_187 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_188 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_189 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_190 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_191 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_192 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_193 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_194 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_195 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_196 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_197 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_198 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_199 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_200 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_201 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_202 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_203 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_204 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_205 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_206 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_207 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_208 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_209 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_210 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_211 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_212 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_213 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_214 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_215 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_216 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_217 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_218 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_219 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_220 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_221 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_222 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_223 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_224 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_225 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_226 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_227 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_228 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_229 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_230 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_231 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_232 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_233 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_234 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_235 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_236 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_237 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_238 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_239 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_240 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_241 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_242 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_243 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_244 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_245 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_246 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_247 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_248 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_249 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_250 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_251 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_252 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_253 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_254 <= 2'h1;	// bpu.scala:149:{22,30}
      PHT_255 <= 2'h1;	// bpu.scala:149:{22,30}
      br_cnt <= 32'h0;	// bpu.scala:205:26
      bp_fail <= 32'h0;	// bpu.scala:205:26, :206:26
      hit_cnt <= 32'h0;	// bpu.scala:205:26, :207:26
    end
    else begin
      automatic logic [3:0] _GEN_7;	// bpu.scala:191:51
      automatic logic       _PHT_T_2;	// bpu.scala:194:47
      automatic logic       _PHT_T_6 = _GEN_5 == 2'h1;	// bpu.scala:149:30, :194:30, :195:30
      automatic logic       _PHT_T_5;	// bpu.scala:195:47
      automatic logic       _PHT_T_7;	// bpu.scala:196:47
      automatic logic       _PHT_T_10 = _GEN_5 == 2'h0;	// Mux.scala:101:16, bpu.scala:194:30, :197:30
      automatic logic       _PHT_T_9;	// bpu.scala:197:47
      automatic logic       _GEN_8;	// Mux.scala:101:16
      _GEN_7 = {_GEN_4[2:0], 1'h0} + {3'h0, io_ID_to_BPU_bus_bits_taken};	// bpu.scala:143:30, :189:38, :191:51
      _PHT_T_2 = (&_GEN_5) & ~io_ID_to_BPU_bus_bits_taken;	// bpu.scala:194:{30,47,50}
      _PHT_T_5 = _PHT_T_6 & ~io_ID_to_BPU_bus_bits_taken;	// bpu.scala:194:50, :195:{30,47}
      _PHT_T_7 = _PHT_T_6 & io_ID_to_BPU_bus_bits_taken;	// bpu.scala:195:30, :196:47
      _PHT_T_9 = _PHT_T_10 & io_ID_to_BPU_bus_bits_taken;	// bpu.scala:197:{30,47}
      _GEN_8 = _PHT_T_10 & ~io_ID_to_BPU_bus_bits_taken | _GEN_6 == 2'h2 & io_ID_to_BPU_bus_bits_taken;	// Mux.scala:101:16, bpu.scala:194:50, :197:30, :198:47, :199:{30,47}
      if (_T_13 & ~io_ID_to_BPU_bus_bits_load_use_stall) begin	// bpu.scala:143:{18,28,30}
        if (_io_bp_flush_T_1)	// bpu.scala:168:49
          bp_target <= io_ID_to_BPU_bus_bits_br_target;	// bpu.scala:141:28
        else if (_GEN)	// bpu.scala:168:49, :181:18, :182:55, :183:18
          bp_target <= _BTB_io_readData;	// bpu.scala:141:28, :150:21
        else	// bpu.scala:168:49, :181:18, :182:55, :183:18
          bp_target <= _io_bp_npc_T_1;	// bpu.scala:141:28, :169:43
      end
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h0)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_0 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h1)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_1 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h2)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_2 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h3)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_3 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h4)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_4 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h5)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_5 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h6)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_6 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h7)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_7 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h8)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_8 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h9)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_9 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hA)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_10 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hB)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_11 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hC)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_12 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hD)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_13 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hE)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_14 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hF)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_15 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h10)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_16 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h11)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_17 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h12)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_18 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h13)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_19 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h14)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_20 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h15)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_21 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h16)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_22 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h17)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_23 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h18)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_24 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h19)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_25 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h1A)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_26 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h1B)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_27 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h1C)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_28 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h1D)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_29 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h1E)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_30 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h1F)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_31 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h20)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_32 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h21)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_33 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h22)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_34 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h23)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_35 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h24)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_36 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h25)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_37 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h26)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_38 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h27)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_39 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h28)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_40 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h29)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_41 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h2A)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_42 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h2B)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_43 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h2C)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_44 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h2D)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_45 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h2E)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_46 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h2F)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_47 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h30)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_48 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h31)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_49 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h32)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_50 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h33)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_51 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h34)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_52 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h35)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_53 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h36)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_54 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h37)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_55 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h38)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_56 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h39)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_57 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h3A)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_58 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h3B)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_59 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h3C)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_60 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h3D)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_61 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h3E)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_62 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h3F)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_63 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h40)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_64 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h41)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_65 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h42)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_66 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h43)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_67 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h44)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_68 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h45)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_69 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h46)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_70 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h47)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_71 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h48)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_72 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h49)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_73 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h4A)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_74 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h4B)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_75 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h4C)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_76 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h4D)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_77 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h4E)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_78 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h4F)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_79 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h50)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_80 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h51)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_81 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h52)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_82 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h53)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_83 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h54)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_84 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h55)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_85 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h56)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_86 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h57)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_87 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h58)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_88 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h59)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_89 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h5A)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_90 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h5B)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_91 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h5C)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_92 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h5D)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_93 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h5E)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_94 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h5F)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_95 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h60)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_96 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h61)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_97 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h62)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_98 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h63)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_99 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h64)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_100 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h65)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_101 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h66)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_102 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h67)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_103 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h68)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_104 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h69)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_105 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h6A)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_106 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h6B)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_107 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h6C)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_108 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h6D)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_109 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h6E)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_110 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h6F)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_111 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h70)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_112 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h71)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_113 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h72)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_114 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h73)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_115 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h74)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_116 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h75)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_117 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h76)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_118 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h77)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_119 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h78)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_120 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h79)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_121 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h7A)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_122 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h7B)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_123 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h7C)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_124 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h7D)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_125 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h7E)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_126 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h7F)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_127 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h80)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_128 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h81)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_129 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h82)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_130 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h83)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_131 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h84)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_132 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h85)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_133 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h86)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_134 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h87)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_135 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h88)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_136 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h89)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_137 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h8A)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_138 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h8B)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_139 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h8C)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_140 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h8D)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_141 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h8E)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_142 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h8F)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_143 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h90)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_144 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h91)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_145 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h92)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_146 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h93)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_147 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h94)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_148 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h95)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_149 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h96)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_150 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h97)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_151 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h98)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_152 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h99)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_153 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h9A)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_154 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h9B)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_155 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h9C)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_156 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h9D)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_157 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h9E)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_158 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'h9F)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_159 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hA0)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_160 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hA1)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_161 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hA2)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_162 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hA3)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_163 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hA4)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_164 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hA5)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_165 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hA6)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_166 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hA7)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_167 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hA8)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_168 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hA9)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_169 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hAA)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_170 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hAB)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_171 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hAC)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_172 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hAD)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_173 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hAE)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_174 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hAF)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_175 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hB0)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_176 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hB1)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_177 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hB2)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_178 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hB3)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_179 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hB4)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_180 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hB5)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_181 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hB6)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_182 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hB7)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_183 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hB8)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_184 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hB9)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_185 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hBA)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_186 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hBB)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_187 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hBC)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_188 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hBD)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_189 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hBE)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_190 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hBF)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_191 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hC0)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_192 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hC1)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_193 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hC2)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_194 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hC3)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_195 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hC4)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_196 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hC5)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_197 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hC6)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_198 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hC7)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_199 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hC8)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_200 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hC9)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_201 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hCA)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_202 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hCB)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_203 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hCC)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_204 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hCD)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_205 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hCE)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_206 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hCF)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_207 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hD0)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_208 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hD1)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_209 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hD2)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_210 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hD3)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_211 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hD4)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_212 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hD5)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_213 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hD6)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_214 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hD7)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_215 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hD8)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_216 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hD9)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_217 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hDA)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_218 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hDB)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_219 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hDC)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_220 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hDD)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_221 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hDE)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_222 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hDF)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_223 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hE0)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_224 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hE1)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_225 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hE2)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_226 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hE3)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_227 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hE4)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_228 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hE5)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_229 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hE6)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_230 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hE7)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_231 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hE8)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_232 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hE9)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_233 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hEA)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_234 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hEB)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_235 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hEC)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_236 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hED)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_237 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hEE)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_238 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hEF)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_239 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hF0)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_240 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hF1)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_241 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hF2)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_242 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hF3)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_243 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hF4)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_244 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hF5)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_245 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hF6)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_246 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hF7)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_247 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hF8)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_248 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hF9)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_249 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hFA)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_250 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hFB)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_251 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hFC)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_252 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hFD)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_253 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & _up_bht_idx_ret_T_2 == 8'hFE)	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_254 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & (&_up_bht_idx_ret_T_2))	// bpu.scala:122:26, :148:22, :190:33, :191:25
        BHT_255 <= _GEN_7;	// bpu.scala:148:22, :191:51
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'h0) begin	// bpu.scala:148:30, :149:22, :189:38, :190:33, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_0 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_0 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_0 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_0 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_0 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_0 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'h1) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_1 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_1 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_1 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_1 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_1 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_1 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'h2) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_2 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_2 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_2 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_2 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_2 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_2 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'h3) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_3 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_3 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_3 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_3 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_3 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_3 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'h4) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_4 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_4 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_4 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_4 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_4 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_4 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'h5) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_5 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_5 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_5 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_5 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_5 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_5 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'h6) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_6 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_6 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_6 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_6 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_6 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_6 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'h7) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_7 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_7 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_7 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_7 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_7 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_7 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'h8) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_8 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_8 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_8 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_8 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_8 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_8 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'h9) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_9 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_9 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_9 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_9 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_9 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_9 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'hA) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_10 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_10 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_10 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_10 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_10 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_10 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'hB) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_11 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_11 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_11 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_11 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_11 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_11 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'hC) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_12 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_12 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_12 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_12 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_12 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_12 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'hD) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_13 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_13 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_13 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_13 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_13 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_13 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & up_pht_idx == 4'hE) begin	// bpu.scala:149:22, :189:38, :190:33, :191:25, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_14 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_14 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_14 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_14 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_14 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_14 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_ID_to_BPU_bus_valid & (&up_pht_idx)) begin	// bpu.scala:149:22, :189:38, :190:33, :193:25
        if (_PHT_T_2)	// bpu.scala:194:47
          PHT_15 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_PHT_T_5)	// bpu.scala:194:47, :195:47
          PHT_15 <= 2'h0;	// Mux.scala:101:16, bpu.scala:149:22
        else if (_PHT_T_7)	// bpu.scala:194:47, :195:47, :196:47
          PHT_15 <= 2'h3;	// bpu.scala:149:22, :194:30
        else if (_PHT_T_9)	// bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_15 <= 2'h1;	// bpu.scala:149:{22,30}
        else if (_GEN_8)	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_15 <= 2'h2;	// bpu.scala:149:22, :199:30
        else	// Mux.scala:101:16, bpu.scala:194:47, :195:47, :196:47, :197:47
          PHT_15 <= _GEN_5;	// bpu.scala:149:22, :194:30
      end
      if (io_PF_valid & _T_13 & ~io_ID_to_BPU_bus_bits_load_use_stall)	// bpu.scala:143:{18,30}, :209:42
        br_cnt <= br_cnt + 32'h1;	// bpu.scala:205:26, :210:26
      if (_io_bp_flush_T_1 & ~io_ID_to_BPU_bus_bits_load_use_stall)	// bpu.scala:143:30, :168:49, :212:22
        bp_fail <= bp_fail + 32'h1;	// bpu.scala:206:26, :210:26, :213:28
      if (_T_12 & _T_13 & ~io_ID_to_BPU_bus_bits_load_use_stall)	// bpu.scala:143:{18,30}, :182:21, :215:55
        hit_cnt <= hit_cnt + 32'h1;	// bpu.scala:207:26, :210:26, :216:28
    end
  end // always @(posedge)
  `ifndef SYNTHESIS	// <stdin>:186:10
    `ifdef FIRRTL_BEFORE_INITIAL	// <stdin>:186:10
      `FIRRTL_BEFORE_INITIAL	// <stdin>:186:10
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_0;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_1;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_2;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_3;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_4;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_5;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_6;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_7;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_8;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_9;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_10;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_11;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_12;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_13;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_14;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_15;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_16;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_17;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_18;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_19;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_20;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_21;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_22;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_23;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_24;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_25;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_26;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_27;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_28;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_29;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_30;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_31;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_32;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_33;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_34;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_35;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_36;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_37;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_38;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_39;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_40;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_41;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_42;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_43;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_44;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_45;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_46;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_47;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_48;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_49;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_50;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_51;	// <stdin>:186:10
      automatic logic [31:0] _RANDOM_52;	// <stdin>:186:10
      `ifdef INIT_RANDOM_PROLOG_	// <stdin>:186:10
        `INIT_RANDOM_PROLOG_	// <stdin>:186:10
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// <stdin>:186:10
        _RANDOM_0 = `RANDOM;	// <stdin>:186:10
        _RANDOM_1 = `RANDOM;	// <stdin>:186:10
        _RANDOM_2 = `RANDOM;	// <stdin>:186:10
        _RANDOM_3 = `RANDOM;	// <stdin>:186:10
        _RANDOM_4 = `RANDOM;	// <stdin>:186:10
        _RANDOM_5 = `RANDOM;	// <stdin>:186:10
        _RANDOM_6 = `RANDOM;	// <stdin>:186:10
        _RANDOM_7 = `RANDOM;	// <stdin>:186:10
        _RANDOM_8 = `RANDOM;	// <stdin>:186:10
        _RANDOM_9 = `RANDOM;	// <stdin>:186:10
        _RANDOM_10 = `RANDOM;	// <stdin>:186:10
        _RANDOM_11 = `RANDOM;	// <stdin>:186:10
        _RANDOM_12 = `RANDOM;	// <stdin>:186:10
        _RANDOM_13 = `RANDOM;	// <stdin>:186:10
        _RANDOM_14 = `RANDOM;	// <stdin>:186:10
        _RANDOM_15 = `RANDOM;	// <stdin>:186:10
        _RANDOM_16 = `RANDOM;	// <stdin>:186:10
        _RANDOM_17 = `RANDOM;	// <stdin>:186:10
        _RANDOM_18 = `RANDOM;	// <stdin>:186:10
        _RANDOM_19 = `RANDOM;	// <stdin>:186:10
        _RANDOM_20 = `RANDOM;	// <stdin>:186:10
        _RANDOM_21 = `RANDOM;	// <stdin>:186:10
        _RANDOM_22 = `RANDOM;	// <stdin>:186:10
        _RANDOM_23 = `RANDOM;	// <stdin>:186:10
        _RANDOM_24 = `RANDOM;	// <stdin>:186:10
        _RANDOM_25 = `RANDOM;	// <stdin>:186:10
        _RANDOM_26 = `RANDOM;	// <stdin>:186:10
        _RANDOM_27 = `RANDOM;	// <stdin>:186:10
        _RANDOM_28 = `RANDOM;	// <stdin>:186:10
        _RANDOM_29 = `RANDOM;	// <stdin>:186:10
        _RANDOM_30 = `RANDOM;	// <stdin>:186:10
        _RANDOM_31 = `RANDOM;	// <stdin>:186:10
        _RANDOM_32 = `RANDOM;	// <stdin>:186:10
        _RANDOM_33 = `RANDOM;	// <stdin>:186:10
        _RANDOM_34 = `RANDOM;	// <stdin>:186:10
        _RANDOM_35 = `RANDOM;	// <stdin>:186:10
        _RANDOM_36 = `RANDOM;	// <stdin>:186:10
        _RANDOM_37 = `RANDOM;	// <stdin>:186:10
        _RANDOM_38 = `RANDOM;	// <stdin>:186:10
        _RANDOM_39 = `RANDOM;	// <stdin>:186:10
        _RANDOM_40 = `RANDOM;	// <stdin>:186:10
        _RANDOM_41 = `RANDOM;	// <stdin>:186:10
        _RANDOM_42 = `RANDOM;	// <stdin>:186:10
        _RANDOM_43 = `RANDOM;	// <stdin>:186:10
        _RANDOM_44 = `RANDOM;	// <stdin>:186:10
        _RANDOM_45 = `RANDOM;	// <stdin>:186:10
        _RANDOM_46 = `RANDOM;	// <stdin>:186:10
        _RANDOM_47 = `RANDOM;	// <stdin>:186:10
        _RANDOM_48 = `RANDOM;	// <stdin>:186:10
        _RANDOM_49 = `RANDOM;	// <stdin>:186:10
        _RANDOM_50 = `RANDOM;	// <stdin>:186:10
        _RANDOM_51 = `RANDOM;	// <stdin>:186:10
        _RANDOM_52 = `RANDOM;	// <stdin>:186:10
        bp_target = {_RANDOM_0, _RANDOM_1};	// bpu.scala:141:28
        BHT_0 = _RANDOM_2[3:0];	// bpu.scala:148:22
        BHT_1 = _RANDOM_2[7:4];	// bpu.scala:148:22
        BHT_2 = _RANDOM_2[11:8];	// bpu.scala:148:22
        BHT_3 = _RANDOM_2[15:12];	// bpu.scala:148:22
        BHT_4 = _RANDOM_2[19:16];	// bpu.scala:148:22
        BHT_5 = _RANDOM_2[23:20];	// bpu.scala:148:22
        BHT_6 = _RANDOM_2[27:24];	// bpu.scala:148:22
        BHT_7 = _RANDOM_2[31:28];	// bpu.scala:148:22
        BHT_8 = _RANDOM_3[3:0];	// bpu.scala:148:22
        BHT_9 = _RANDOM_3[7:4];	// bpu.scala:148:22
        BHT_10 = _RANDOM_3[11:8];	// bpu.scala:148:22
        BHT_11 = _RANDOM_3[15:12];	// bpu.scala:148:22
        BHT_12 = _RANDOM_3[19:16];	// bpu.scala:148:22
        BHT_13 = _RANDOM_3[23:20];	// bpu.scala:148:22
        BHT_14 = _RANDOM_3[27:24];	// bpu.scala:148:22
        BHT_15 = _RANDOM_3[31:28];	// bpu.scala:148:22
        BHT_16 = _RANDOM_4[3:0];	// bpu.scala:148:22
        BHT_17 = _RANDOM_4[7:4];	// bpu.scala:148:22
        BHT_18 = _RANDOM_4[11:8];	// bpu.scala:148:22
        BHT_19 = _RANDOM_4[15:12];	// bpu.scala:148:22
        BHT_20 = _RANDOM_4[19:16];	// bpu.scala:148:22
        BHT_21 = _RANDOM_4[23:20];	// bpu.scala:148:22
        BHT_22 = _RANDOM_4[27:24];	// bpu.scala:148:22
        BHT_23 = _RANDOM_4[31:28];	// bpu.scala:148:22
        BHT_24 = _RANDOM_5[3:0];	// bpu.scala:148:22
        BHT_25 = _RANDOM_5[7:4];	// bpu.scala:148:22
        BHT_26 = _RANDOM_5[11:8];	// bpu.scala:148:22
        BHT_27 = _RANDOM_5[15:12];	// bpu.scala:148:22
        BHT_28 = _RANDOM_5[19:16];	// bpu.scala:148:22
        BHT_29 = _RANDOM_5[23:20];	// bpu.scala:148:22
        BHT_30 = _RANDOM_5[27:24];	// bpu.scala:148:22
        BHT_31 = _RANDOM_5[31:28];	// bpu.scala:148:22
        BHT_32 = _RANDOM_6[3:0];	// bpu.scala:148:22
        BHT_33 = _RANDOM_6[7:4];	// bpu.scala:148:22
        BHT_34 = _RANDOM_6[11:8];	// bpu.scala:148:22
        BHT_35 = _RANDOM_6[15:12];	// bpu.scala:148:22
        BHT_36 = _RANDOM_6[19:16];	// bpu.scala:148:22
        BHT_37 = _RANDOM_6[23:20];	// bpu.scala:148:22
        BHT_38 = _RANDOM_6[27:24];	// bpu.scala:148:22
        BHT_39 = _RANDOM_6[31:28];	// bpu.scala:148:22
        BHT_40 = _RANDOM_7[3:0];	// bpu.scala:148:22
        BHT_41 = _RANDOM_7[7:4];	// bpu.scala:148:22
        BHT_42 = _RANDOM_7[11:8];	// bpu.scala:148:22
        BHT_43 = _RANDOM_7[15:12];	// bpu.scala:148:22
        BHT_44 = _RANDOM_7[19:16];	// bpu.scala:148:22
        BHT_45 = _RANDOM_7[23:20];	// bpu.scala:148:22
        BHT_46 = _RANDOM_7[27:24];	// bpu.scala:148:22
        BHT_47 = _RANDOM_7[31:28];	// bpu.scala:148:22
        BHT_48 = _RANDOM_8[3:0];	// bpu.scala:148:22
        BHT_49 = _RANDOM_8[7:4];	// bpu.scala:148:22
        BHT_50 = _RANDOM_8[11:8];	// bpu.scala:148:22
        BHT_51 = _RANDOM_8[15:12];	// bpu.scala:148:22
        BHT_52 = _RANDOM_8[19:16];	// bpu.scala:148:22
        BHT_53 = _RANDOM_8[23:20];	// bpu.scala:148:22
        BHT_54 = _RANDOM_8[27:24];	// bpu.scala:148:22
        BHT_55 = _RANDOM_8[31:28];	// bpu.scala:148:22
        BHT_56 = _RANDOM_9[3:0];	// bpu.scala:148:22
        BHT_57 = _RANDOM_9[7:4];	// bpu.scala:148:22
        BHT_58 = _RANDOM_9[11:8];	// bpu.scala:148:22
        BHT_59 = _RANDOM_9[15:12];	// bpu.scala:148:22
        BHT_60 = _RANDOM_9[19:16];	// bpu.scala:148:22
        BHT_61 = _RANDOM_9[23:20];	// bpu.scala:148:22
        BHT_62 = _RANDOM_9[27:24];	// bpu.scala:148:22
        BHT_63 = _RANDOM_9[31:28];	// bpu.scala:148:22
        BHT_64 = _RANDOM_10[3:0];	// bpu.scala:148:22
        BHT_65 = _RANDOM_10[7:4];	// bpu.scala:148:22
        BHT_66 = _RANDOM_10[11:8];	// bpu.scala:148:22
        BHT_67 = _RANDOM_10[15:12];	// bpu.scala:148:22
        BHT_68 = _RANDOM_10[19:16];	// bpu.scala:148:22
        BHT_69 = _RANDOM_10[23:20];	// bpu.scala:148:22
        BHT_70 = _RANDOM_10[27:24];	// bpu.scala:148:22
        BHT_71 = _RANDOM_10[31:28];	// bpu.scala:148:22
        BHT_72 = _RANDOM_11[3:0];	// bpu.scala:148:22
        BHT_73 = _RANDOM_11[7:4];	// bpu.scala:148:22
        BHT_74 = _RANDOM_11[11:8];	// bpu.scala:148:22
        BHT_75 = _RANDOM_11[15:12];	// bpu.scala:148:22
        BHT_76 = _RANDOM_11[19:16];	// bpu.scala:148:22
        BHT_77 = _RANDOM_11[23:20];	// bpu.scala:148:22
        BHT_78 = _RANDOM_11[27:24];	// bpu.scala:148:22
        BHT_79 = _RANDOM_11[31:28];	// bpu.scala:148:22
        BHT_80 = _RANDOM_12[3:0];	// bpu.scala:148:22
        BHT_81 = _RANDOM_12[7:4];	// bpu.scala:148:22
        BHT_82 = _RANDOM_12[11:8];	// bpu.scala:148:22
        BHT_83 = _RANDOM_12[15:12];	// bpu.scala:148:22
        BHT_84 = _RANDOM_12[19:16];	// bpu.scala:148:22
        BHT_85 = _RANDOM_12[23:20];	// bpu.scala:148:22
        BHT_86 = _RANDOM_12[27:24];	// bpu.scala:148:22
        BHT_87 = _RANDOM_12[31:28];	// bpu.scala:148:22
        BHT_88 = _RANDOM_13[3:0];	// bpu.scala:148:22
        BHT_89 = _RANDOM_13[7:4];	// bpu.scala:148:22
        BHT_90 = _RANDOM_13[11:8];	// bpu.scala:148:22
        BHT_91 = _RANDOM_13[15:12];	// bpu.scala:148:22
        BHT_92 = _RANDOM_13[19:16];	// bpu.scala:148:22
        BHT_93 = _RANDOM_13[23:20];	// bpu.scala:148:22
        BHT_94 = _RANDOM_13[27:24];	// bpu.scala:148:22
        BHT_95 = _RANDOM_13[31:28];	// bpu.scala:148:22
        BHT_96 = _RANDOM_14[3:0];	// bpu.scala:148:22
        BHT_97 = _RANDOM_14[7:4];	// bpu.scala:148:22
        BHT_98 = _RANDOM_14[11:8];	// bpu.scala:148:22
        BHT_99 = _RANDOM_14[15:12];	// bpu.scala:148:22
        BHT_100 = _RANDOM_14[19:16];	// bpu.scala:148:22
        BHT_101 = _RANDOM_14[23:20];	// bpu.scala:148:22
        BHT_102 = _RANDOM_14[27:24];	// bpu.scala:148:22
        BHT_103 = _RANDOM_14[31:28];	// bpu.scala:148:22
        BHT_104 = _RANDOM_15[3:0];	// bpu.scala:148:22
        BHT_105 = _RANDOM_15[7:4];	// bpu.scala:148:22
        BHT_106 = _RANDOM_15[11:8];	// bpu.scala:148:22
        BHT_107 = _RANDOM_15[15:12];	// bpu.scala:148:22
        BHT_108 = _RANDOM_15[19:16];	// bpu.scala:148:22
        BHT_109 = _RANDOM_15[23:20];	// bpu.scala:148:22
        BHT_110 = _RANDOM_15[27:24];	// bpu.scala:148:22
        BHT_111 = _RANDOM_15[31:28];	// bpu.scala:148:22
        BHT_112 = _RANDOM_16[3:0];	// bpu.scala:148:22
        BHT_113 = _RANDOM_16[7:4];	// bpu.scala:148:22
        BHT_114 = _RANDOM_16[11:8];	// bpu.scala:148:22
        BHT_115 = _RANDOM_16[15:12];	// bpu.scala:148:22
        BHT_116 = _RANDOM_16[19:16];	// bpu.scala:148:22
        BHT_117 = _RANDOM_16[23:20];	// bpu.scala:148:22
        BHT_118 = _RANDOM_16[27:24];	// bpu.scala:148:22
        BHT_119 = _RANDOM_16[31:28];	// bpu.scala:148:22
        BHT_120 = _RANDOM_17[3:0];	// bpu.scala:148:22
        BHT_121 = _RANDOM_17[7:4];	// bpu.scala:148:22
        BHT_122 = _RANDOM_17[11:8];	// bpu.scala:148:22
        BHT_123 = _RANDOM_17[15:12];	// bpu.scala:148:22
        BHT_124 = _RANDOM_17[19:16];	// bpu.scala:148:22
        BHT_125 = _RANDOM_17[23:20];	// bpu.scala:148:22
        BHT_126 = _RANDOM_17[27:24];	// bpu.scala:148:22
        BHT_127 = _RANDOM_17[31:28];	// bpu.scala:148:22
        BHT_128 = _RANDOM_18[3:0];	// bpu.scala:148:22
        BHT_129 = _RANDOM_18[7:4];	// bpu.scala:148:22
        BHT_130 = _RANDOM_18[11:8];	// bpu.scala:148:22
        BHT_131 = _RANDOM_18[15:12];	// bpu.scala:148:22
        BHT_132 = _RANDOM_18[19:16];	// bpu.scala:148:22
        BHT_133 = _RANDOM_18[23:20];	// bpu.scala:148:22
        BHT_134 = _RANDOM_18[27:24];	// bpu.scala:148:22
        BHT_135 = _RANDOM_18[31:28];	// bpu.scala:148:22
        BHT_136 = _RANDOM_19[3:0];	// bpu.scala:148:22
        BHT_137 = _RANDOM_19[7:4];	// bpu.scala:148:22
        BHT_138 = _RANDOM_19[11:8];	// bpu.scala:148:22
        BHT_139 = _RANDOM_19[15:12];	// bpu.scala:148:22
        BHT_140 = _RANDOM_19[19:16];	// bpu.scala:148:22
        BHT_141 = _RANDOM_19[23:20];	// bpu.scala:148:22
        BHT_142 = _RANDOM_19[27:24];	// bpu.scala:148:22
        BHT_143 = _RANDOM_19[31:28];	// bpu.scala:148:22
        BHT_144 = _RANDOM_20[3:0];	// bpu.scala:148:22
        BHT_145 = _RANDOM_20[7:4];	// bpu.scala:148:22
        BHT_146 = _RANDOM_20[11:8];	// bpu.scala:148:22
        BHT_147 = _RANDOM_20[15:12];	// bpu.scala:148:22
        BHT_148 = _RANDOM_20[19:16];	// bpu.scala:148:22
        BHT_149 = _RANDOM_20[23:20];	// bpu.scala:148:22
        BHT_150 = _RANDOM_20[27:24];	// bpu.scala:148:22
        BHT_151 = _RANDOM_20[31:28];	// bpu.scala:148:22
        BHT_152 = _RANDOM_21[3:0];	// bpu.scala:148:22
        BHT_153 = _RANDOM_21[7:4];	// bpu.scala:148:22
        BHT_154 = _RANDOM_21[11:8];	// bpu.scala:148:22
        BHT_155 = _RANDOM_21[15:12];	// bpu.scala:148:22
        BHT_156 = _RANDOM_21[19:16];	// bpu.scala:148:22
        BHT_157 = _RANDOM_21[23:20];	// bpu.scala:148:22
        BHT_158 = _RANDOM_21[27:24];	// bpu.scala:148:22
        BHT_159 = _RANDOM_21[31:28];	// bpu.scala:148:22
        BHT_160 = _RANDOM_22[3:0];	// bpu.scala:148:22
        BHT_161 = _RANDOM_22[7:4];	// bpu.scala:148:22
        BHT_162 = _RANDOM_22[11:8];	// bpu.scala:148:22
        BHT_163 = _RANDOM_22[15:12];	// bpu.scala:148:22
        BHT_164 = _RANDOM_22[19:16];	// bpu.scala:148:22
        BHT_165 = _RANDOM_22[23:20];	// bpu.scala:148:22
        BHT_166 = _RANDOM_22[27:24];	// bpu.scala:148:22
        BHT_167 = _RANDOM_22[31:28];	// bpu.scala:148:22
        BHT_168 = _RANDOM_23[3:0];	// bpu.scala:148:22
        BHT_169 = _RANDOM_23[7:4];	// bpu.scala:148:22
        BHT_170 = _RANDOM_23[11:8];	// bpu.scala:148:22
        BHT_171 = _RANDOM_23[15:12];	// bpu.scala:148:22
        BHT_172 = _RANDOM_23[19:16];	// bpu.scala:148:22
        BHT_173 = _RANDOM_23[23:20];	// bpu.scala:148:22
        BHT_174 = _RANDOM_23[27:24];	// bpu.scala:148:22
        BHT_175 = _RANDOM_23[31:28];	// bpu.scala:148:22
        BHT_176 = _RANDOM_24[3:0];	// bpu.scala:148:22
        BHT_177 = _RANDOM_24[7:4];	// bpu.scala:148:22
        BHT_178 = _RANDOM_24[11:8];	// bpu.scala:148:22
        BHT_179 = _RANDOM_24[15:12];	// bpu.scala:148:22
        BHT_180 = _RANDOM_24[19:16];	// bpu.scala:148:22
        BHT_181 = _RANDOM_24[23:20];	// bpu.scala:148:22
        BHT_182 = _RANDOM_24[27:24];	// bpu.scala:148:22
        BHT_183 = _RANDOM_24[31:28];	// bpu.scala:148:22
        BHT_184 = _RANDOM_25[3:0];	// bpu.scala:148:22
        BHT_185 = _RANDOM_25[7:4];	// bpu.scala:148:22
        BHT_186 = _RANDOM_25[11:8];	// bpu.scala:148:22
        BHT_187 = _RANDOM_25[15:12];	// bpu.scala:148:22
        BHT_188 = _RANDOM_25[19:16];	// bpu.scala:148:22
        BHT_189 = _RANDOM_25[23:20];	// bpu.scala:148:22
        BHT_190 = _RANDOM_25[27:24];	// bpu.scala:148:22
        BHT_191 = _RANDOM_25[31:28];	// bpu.scala:148:22
        BHT_192 = _RANDOM_26[3:0];	// bpu.scala:148:22
        BHT_193 = _RANDOM_26[7:4];	// bpu.scala:148:22
        BHT_194 = _RANDOM_26[11:8];	// bpu.scala:148:22
        BHT_195 = _RANDOM_26[15:12];	// bpu.scala:148:22
        BHT_196 = _RANDOM_26[19:16];	// bpu.scala:148:22
        BHT_197 = _RANDOM_26[23:20];	// bpu.scala:148:22
        BHT_198 = _RANDOM_26[27:24];	// bpu.scala:148:22
        BHT_199 = _RANDOM_26[31:28];	// bpu.scala:148:22
        BHT_200 = _RANDOM_27[3:0];	// bpu.scala:148:22
        BHT_201 = _RANDOM_27[7:4];	// bpu.scala:148:22
        BHT_202 = _RANDOM_27[11:8];	// bpu.scala:148:22
        BHT_203 = _RANDOM_27[15:12];	// bpu.scala:148:22
        BHT_204 = _RANDOM_27[19:16];	// bpu.scala:148:22
        BHT_205 = _RANDOM_27[23:20];	// bpu.scala:148:22
        BHT_206 = _RANDOM_27[27:24];	// bpu.scala:148:22
        BHT_207 = _RANDOM_27[31:28];	// bpu.scala:148:22
        BHT_208 = _RANDOM_28[3:0];	// bpu.scala:148:22
        BHT_209 = _RANDOM_28[7:4];	// bpu.scala:148:22
        BHT_210 = _RANDOM_28[11:8];	// bpu.scala:148:22
        BHT_211 = _RANDOM_28[15:12];	// bpu.scala:148:22
        BHT_212 = _RANDOM_28[19:16];	// bpu.scala:148:22
        BHT_213 = _RANDOM_28[23:20];	// bpu.scala:148:22
        BHT_214 = _RANDOM_28[27:24];	// bpu.scala:148:22
        BHT_215 = _RANDOM_28[31:28];	// bpu.scala:148:22
        BHT_216 = _RANDOM_29[3:0];	// bpu.scala:148:22
        BHT_217 = _RANDOM_29[7:4];	// bpu.scala:148:22
        BHT_218 = _RANDOM_29[11:8];	// bpu.scala:148:22
        BHT_219 = _RANDOM_29[15:12];	// bpu.scala:148:22
        BHT_220 = _RANDOM_29[19:16];	// bpu.scala:148:22
        BHT_221 = _RANDOM_29[23:20];	// bpu.scala:148:22
        BHT_222 = _RANDOM_29[27:24];	// bpu.scala:148:22
        BHT_223 = _RANDOM_29[31:28];	// bpu.scala:148:22
        BHT_224 = _RANDOM_30[3:0];	// bpu.scala:148:22
        BHT_225 = _RANDOM_30[7:4];	// bpu.scala:148:22
        BHT_226 = _RANDOM_30[11:8];	// bpu.scala:148:22
        BHT_227 = _RANDOM_30[15:12];	// bpu.scala:148:22
        BHT_228 = _RANDOM_30[19:16];	// bpu.scala:148:22
        BHT_229 = _RANDOM_30[23:20];	// bpu.scala:148:22
        BHT_230 = _RANDOM_30[27:24];	// bpu.scala:148:22
        BHT_231 = _RANDOM_30[31:28];	// bpu.scala:148:22
        BHT_232 = _RANDOM_31[3:0];	// bpu.scala:148:22
        BHT_233 = _RANDOM_31[7:4];	// bpu.scala:148:22
        BHT_234 = _RANDOM_31[11:8];	// bpu.scala:148:22
        BHT_235 = _RANDOM_31[15:12];	// bpu.scala:148:22
        BHT_236 = _RANDOM_31[19:16];	// bpu.scala:148:22
        BHT_237 = _RANDOM_31[23:20];	// bpu.scala:148:22
        BHT_238 = _RANDOM_31[27:24];	// bpu.scala:148:22
        BHT_239 = _RANDOM_31[31:28];	// bpu.scala:148:22
        BHT_240 = _RANDOM_32[3:0];	// bpu.scala:148:22
        BHT_241 = _RANDOM_32[7:4];	// bpu.scala:148:22
        BHT_242 = _RANDOM_32[11:8];	// bpu.scala:148:22
        BHT_243 = _RANDOM_32[15:12];	// bpu.scala:148:22
        BHT_244 = _RANDOM_32[19:16];	// bpu.scala:148:22
        BHT_245 = _RANDOM_32[23:20];	// bpu.scala:148:22
        BHT_246 = _RANDOM_32[27:24];	// bpu.scala:148:22
        BHT_247 = _RANDOM_32[31:28];	// bpu.scala:148:22
        BHT_248 = _RANDOM_33[3:0];	// bpu.scala:148:22
        BHT_249 = _RANDOM_33[7:4];	// bpu.scala:148:22
        BHT_250 = _RANDOM_33[11:8];	// bpu.scala:148:22
        BHT_251 = _RANDOM_33[15:12];	// bpu.scala:148:22
        BHT_252 = _RANDOM_33[19:16];	// bpu.scala:148:22
        BHT_253 = _RANDOM_33[23:20];	// bpu.scala:148:22
        BHT_254 = _RANDOM_33[27:24];	// bpu.scala:148:22
        BHT_255 = _RANDOM_33[31:28];	// bpu.scala:148:22
        PHT_0 = _RANDOM_34[1:0];	// bpu.scala:149:22
        PHT_1 = _RANDOM_34[3:2];	// bpu.scala:149:22
        PHT_2 = _RANDOM_34[5:4];	// bpu.scala:149:22
        PHT_3 = _RANDOM_34[7:6];	// bpu.scala:149:22
        PHT_4 = _RANDOM_34[9:8];	// bpu.scala:149:22
        PHT_5 = _RANDOM_34[11:10];	// bpu.scala:149:22
        PHT_6 = _RANDOM_34[13:12];	// bpu.scala:149:22
        PHT_7 = _RANDOM_34[15:14];	// bpu.scala:149:22
        PHT_8 = _RANDOM_34[17:16];	// bpu.scala:149:22
        PHT_9 = _RANDOM_34[19:18];	// bpu.scala:149:22
        PHT_10 = _RANDOM_34[21:20];	// bpu.scala:149:22
        PHT_11 = _RANDOM_34[23:22];	// bpu.scala:149:22
        PHT_12 = _RANDOM_34[25:24];	// bpu.scala:149:22
        PHT_13 = _RANDOM_34[27:26];	// bpu.scala:149:22
        PHT_14 = _RANDOM_34[29:28];	// bpu.scala:149:22
        PHT_15 = _RANDOM_34[31:30];	// bpu.scala:149:22
        PHT_16 = _RANDOM_35[1:0];	// bpu.scala:149:22
        PHT_17 = _RANDOM_35[3:2];	// bpu.scala:149:22
        PHT_18 = _RANDOM_35[5:4];	// bpu.scala:149:22
        PHT_19 = _RANDOM_35[7:6];	// bpu.scala:149:22
        PHT_20 = _RANDOM_35[9:8];	// bpu.scala:149:22
        PHT_21 = _RANDOM_35[11:10];	// bpu.scala:149:22
        PHT_22 = _RANDOM_35[13:12];	// bpu.scala:149:22
        PHT_23 = _RANDOM_35[15:14];	// bpu.scala:149:22
        PHT_24 = _RANDOM_35[17:16];	// bpu.scala:149:22
        PHT_25 = _RANDOM_35[19:18];	// bpu.scala:149:22
        PHT_26 = _RANDOM_35[21:20];	// bpu.scala:149:22
        PHT_27 = _RANDOM_35[23:22];	// bpu.scala:149:22
        PHT_28 = _RANDOM_35[25:24];	// bpu.scala:149:22
        PHT_29 = _RANDOM_35[27:26];	// bpu.scala:149:22
        PHT_30 = _RANDOM_35[29:28];	// bpu.scala:149:22
        PHT_31 = _RANDOM_35[31:30];	// bpu.scala:149:22
        PHT_32 = _RANDOM_36[1:0];	// bpu.scala:149:22
        PHT_33 = _RANDOM_36[3:2];	// bpu.scala:149:22
        PHT_34 = _RANDOM_36[5:4];	// bpu.scala:149:22
        PHT_35 = _RANDOM_36[7:6];	// bpu.scala:149:22
        PHT_36 = _RANDOM_36[9:8];	// bpu.scala:149:22
        PHT_37 = _RANDOM_36[11:10];	// bpu.scala:149:22
        PHT_38 = _RANDOM_36[13:12];	// bpu.scala:149:22
        PHT_39 = _RANDOM_36[15:14];	// bpu.scala:149:22
        PHT_40 = _RANDOM_36[17:16];	// bpu.scala:149:22
        PHT_41 = _RANDOM_36[19:18];	// bpu.scala:149:22
        PHT_42 = _RANDOM_36[21:20];	// bpu.scala:149:22
        PHT_43 = _RANDOM_36[23:22];	// bpu.scala:149:22
        PHT_44 = _RANDOM_36[25:24];	// bpu.scala:149:22
        PHT_45 = _RANDOM_36[27:26];	// bpu.scala:149:22
        PHT_46 = _RANDOM_36[29:28];	// bpu.scala:149:22
        PHT_47 = _RANDOM_36[31:30];	// bpu.scala:149:22
        PHT_48 = _RANDOM_37[1:0];	// bpu.scala:149:22
        PHT_49 = _RANDOM_37[3:2];	// bpu.scala:149:22
        PHT_50 = _RANDOM_37[5:4];	// bpu.scala:149:22
        PHT_51 = _RANDOM_37[7:6];	// bpu.scala:149:22
        PHT_52 = _RANDOM_37[9:8];	// bpu.scala:149:22
        PHT_53 = _RANDOM_37[11:10];	// bpu.scala:149:22
        PHT_54 = _RANDOM_37[13:12];	// bpu.scala:149:22
        PHT_55 = _RANDOM_37[15:14];	// bpu.scala:149:22
        PHT_56 = _RANDOM_37[17:16];	// bpu.scala:149:22
        PHT_57 = _RANDOM_37[19:18];	// bpu.scala:149:22
        PHT_58 = _RANDOM_37[21:20];	// bpu.scala:149:22
        PHT_59 = _RANDOM_37[23:22];	// bpu.scala:149:22
        PHT_60 = _RANDOM_37[25:24];	// bpu.scala:149:22
        PHT_61 = _RANDOM_37[27:26];	// bpu.scala:149:22
        PHT_62 = _RANDOM_37[29:28];	// bpu.scala:149:22
        PHT_63 = _RANDOM_37[31:30];	// bpu.scala:149:22
        PHT_64 = _RANDOM_38[1:0];	// bpu.scala:149:22
        PHT_65 = _RANDOM_38[3:2];	// bpu.scala:149:22
        PHT_66 = _RANDOM_38[5:4];	// bpu.scala:149:22
        PHT_67 = _RANDOM_38[7:6];	// bpu.scala:149:22
        PHT_68 = _RANDOM_38[9:8];	// bpu.scala:149:22
        PHT_69 = _RANDOM_38[11:10];	// bpu.scala:149:22
        PHT_70 = _RANDOM_38[13:12];	// bpu.scala:149:22
        PHT_71 = _RANDOM_38[15:14];	// bpu.scala:149:22
        PHT_72 = _RANDOM_38[17:16];	// bpu.scala:149:22
        PHT_73 = _RANDOM_38[19:18];	// bpu.scala:149:22
        PHT_74 = _RANDOM_38[21:20];	// bpu.scala:149:22
        PHT_75 = _RANDOM_38[23:22];	// bpu.scala:149:22
        PHT_76 = _RANDOM_38[25:24];	// bpu.scala:149:22
        PHT_77 = _RANDOM_38[27:26];	// bpu.scala:149:22
        PHT_78 = _RANDOM_38[29:28];	// bpu.scala:149:22
        PHT_79 = _RANDOM_38[31:30];	// bpu.scala:149:22
        PHT_80 = _RANDOM_39[1:0];	// bpu.scala:149:22
        PHT_81 = _RANDOM_39[3:2];	// bpu.scala:149:22
        PHT_82 = _RANDOM_39[5:4];	// bpu.scala:149:22
        PHT_83 = _RANDOM_39[7:6];	// bpu.scala:149:22
        PHT_84 = _RANDOM_39[9:8];	// bpu.scala:149:22
        PHT_85 = _RANDOM_39[11:10];	// bpu.scala:149:22
        PHT_86 = _RANDOM_39[13:12];	// bpu.scala:149:22
        PHT_87 = _RANDOM_39[15:14];	// bpu.scala:149:22
        PHT_88 = _RANDOM_39[17:16];	// bpu.scala:149:22
        PHT_89 = _RANDOM_39[19:18];	// bpu.scala:149:22
        PHT_90 = _RANDOM_39[21:20];	// bpu.scala:149:22
        PHT_91 = _RANDOM_39[23:22];	// bpu.scala:149:22
        PHT_92 = _RANDOM_39[25:24];	// bpu.scala:149:22
        PHT_93 = _RANDOM_39[27:26];	// bpu.scala:149:22
        PHT_94 = _RANDOM_39[29:28];	// bpu.scala:149:22
        PHT_95 = _RANDOM_39[31:30];	// bpu.scala:149:22
        PHT_96 = _RANDOM_40[1:0];	// bpu.scala:149:22
        PHT_97 = _RANDOM_40[3:2];	// bpu.scala:149:22
        PHT_98 = _RANDOM_40[5:4];	// bpu.scala:149:22
        PHT_99 = _RANDOM_40[7:6];	// bpu.scala:149:22
        PHT_100 = _RANDOM_40[9:8];	// bpu.scala:149:22
        PHT_101 = _RANDOM_40[11:10];	// bpu.scala:149:22
        PHT_102 = _RANDOM_40[13:12];	// bpu.scala:149:22
        PHT_103 = _RANDOM_40[15:14];	// bpu.scala:149:22
        PHT_104 = _RANDOM_40[17:16];	// bpu.scala:149:22
        PHT_105 = _RANDOM_40[19:18];	// bpu.scala:149:22
        PHT_106 = _RANDOM_40[21:20];	// bpu.scala:149:22
        PHT_107 = _RANDOM_40[23:22];	// bpu.scala:149:22
        PHT_108 = _RANDOM_40[25:24];	// bpu.scala:149:22
        PHT_109 = _RANDOM_40[27:26];	// bpu.scala:149:22
        PHT_110 = _RANDOM_40[29:28];	// bpu.scala:149:22
        PHT_111 = _RANDOM_40[31:30];	// bpu.scala:149:22
        PHT_112 = _RANDOM_41[1:0];	// bpu.scala:149:22
        PHT_113 = _RANDOM_41[3:2];	// bpu.scala:149:22
        PHT_114 = _RANDOM_41[5:4];	// bpu.scala:149:22
        PHT_115 = _RANDOM_41[7:6];	// bpu.scala:149:22
        PHT_116 = _RANDOM_41[9:8];	// bpu.scala:149:22
        PHT_117 = _RANDOM_41[11:10];	// bpu.scala:149:22
        PHT_118 = _RANDOM_41[13:12];	// bpu.scala:149:22
        PHT_119 = _RANDOM_41[15:14];	// bpu.scala:149:22
        PHT_120 = _RANDOM_41[17:16];	// bpu.scala:149:22
        PHT_121 = _RANDOM_41[19:18];	// bpu.scala:149:22
        PHT_122 = _RANDOM_41[21:20];	// bpu.scala:149:22
        PHT_123 = _RANDOM_41[23:22];	// bpu.scala:149:22
        PHT_124 = _RANDOM_41[25:24];	// bpu.scala:149:22
        PHT_125 = _RANDOM_41[27:26];	// bpu.scala:149:22
        PHT_126 = _RANDOM_41[29:28];	// bpu.scala:149:22
        PHT_127 = _RANDOM_41[31:30];	// bpu.scala:149:22
        PHT_128 = _RANDOM_42[1:0];	// bpu.scala:149:22
        PHT_129 = _RANDOM_42[3:2];	// bpu.scala:149:22
        PHT_130 = _RANDOM_42[5:4];	// bpu.scala:149:22
        PHT_131 = _RANDOM_42[7:6];	// bpu.scala:149:22
        PHT_132 = _RANDOM_42[9:8];	// bpu.scala:149:22
        PHT_133 = _RANDOM_42[11:10];	// bpu.scala:149:22
        PHT_134 = _RANDOM_42[13:12];	// bpu.scala:149:22
        PHT_135 = _RANDOM_42[15:14];	// bpu.scala:149:22
        PHT_136 = _RANDOM_42[17:16];	// bpu.scala:149:22
        PHT_137 = _RANDOM_42[19:18];	// bpu.scala:149:22
        PHT_138 = _RANDOM_42[21:20];	// bpu.scala:149:22
        PHT_139 = _RANDOM_42[23:22];	// bpu.scala:149:22
        PHT_140 = _RANDOM_42[25:24];	// bpu.scala:149:22
        PHT_141 = _RANDOM_42[27:26];	// bpu.scala:149:22
        PHT_142 = _RANDOM_42[29:28];	// bpu.scala:149:22
        PHT_143 = _RANDOM_42[31:30];	// bpu.scala:149:22
        PHT_144 = _RANDOM_43[1:0];	// bpu.scala:149:22
        PHT_145 = _RANDOM_43[3:2];	// bpu.scala:149:22
        PHT_146 = _RANDOM_43[5:4];	// bpu.scala:149:22
        PHT_147 = _RANDOM_43[7:6];	// bpu.scala:149:22
        PHT_148 = _RANDOM_43[9:8];	// bpu.scala:149:22
        PHT_149 = _RANDOM_43[11:10];	// bpu.scala:149:22
        PHT_150 = _RANDOM_43[13:12];	// bpu.scala:149:22
        PHT_151 = _RANDOM_43[15:14];	// bpu.scala:149:22
        PHT_152 = _RANDOM_43[17:16];	// bpu.scala:149:22
        PHT_153 = _RANDOM_43[19:18];	// bpu.scala:149:22
        PHT_154 = _RANDOM_43[21:20];	// bpu.scala:149:22
        PHT_155 = _RANDOM_43[23:22];	// bpu.scala:149:22
        PHT_156 = _RANDOM_43[25:24];	// bpu.scala:149:22
        PHT_157 = _RANDOM_43[27:26];	// bpu.scala:149:22
        PHT_158 = _RANDOM_43[29:28];	// bpu.scala:149:22
        PHT_159 = _RANDOM_43[31:30];	// bpu.scala:149:22
        PHT_160 = _RANDOM_44[1:0];	// bpu.scala:149:22
        PHT_161 = _RANDOM_44[3:2];	// bpu.scala:149:22
        PHT_162 = _RANDOM_44[5:4];	// bpu.scala:149:22
        PHT_163 = _RANDOM_44[7:6];	// bpu.scala:149:22
        PHT_164 = _RANDOM_44[9:8];	// bpu.scala:149:22
        PHT_165 = _RANDOM_44[11:10];	// bpu.scala:149:22
        PHT_166 = _RANDOM_44[13:12];	// bpu.scala:149:22
        PHT_167 = _RANDOM_44[15:14];	// bpu.scala:149:22
        PHT_168 = _RANDOM_44[17:16];	// bpu.scala:149:22
        PHT_169 = _RANDOM_44[19:18];	// bpu.scala:149:22
        PHT_170 = _RANDOM_44[21:20];	// bpu.scala:149:22
        PHT_171 = _RANDOM_44[23:22];	// bpu.scala:149:22
        PHT_172 = _RANDOM_44[25:24];	// bpu.scala:149:22
        PHT_173 = _RANDOM_44[27:26];	// bpu.scala:149:22
        PHT_174 = _RANDOM_44[29:28];	// bpu.scala:149:22
        PHT_175 = _RANDOM_44[31:30];	// bpu.scala:149:22
        PHT_176 = _RANDOM_45[1:0];	// bpu.scala:149:22
        PHT_177 = _RANDOM_45[3:2];	// bpu.scala:149:22
        PHT_178 = _RANDOM_45[5:4];	// bpu.scala:149:22
        PHT_179 = _RANDOM_45[7:6];	// bpu.scala:149:22
        PHT_180 = _RANDOM_45[9:8];	// bpu.scala:149:22
        PHT_181 = _RANDOM_45[11:10];	// bpu.scala:149:22
        PHT_182 = _RANDOM_45[13:12];	// bpu.scala:149:22
        PHT_183 = _RANDOM_45[15:14];	// bpu.scala:149:22
        PHT_184 = _RANDOM_45[17:16];	// bpu.scala:149:22
        PHT_185 = _RANDOM_45[19:18];	// bpu.scala:149:22
        PHT_186 = _RANDOM_45[21:20];	// bpu.scala:149:22
        PHT_187 = _RANDOM_45[23:22];	// bpu.scala:149:22
        PHT_188 = _RANDOM_45[25:24];	// bpu.scala:149:22
        PHT_189 = _RANDOM_45[27:26];	// bpu.scala:149:22
        PHT_190 = _RANDOM_45[29:28];	// bpu.scala:149:22
        PHT_191 = _RANDOM_45[31:30];	// bpu.scala:149:22
        PHT_192 = _RANDOM_46[1:0];	// bpu.scala:149:22
        PHT_193 = _RANDOM_46[3:2];	// bpu.scala:149:22
        PHT_194 = _RANDOM_46[5:4];	// bpu.scala:149:22
        PHT_195 = _RANDOM_46[7:6];	// bpu.scala:149:22
        PHT_196 = _RANDOM_46[9:8];	// bpu.scala:149:22
        PHT_197 = _RANDOM_46[11:10];	// bpu.scala:149:22
        PHT_198 = _RANDOM_46[13:12];	// bpu.scala:149:22
        PHT_199 = _RANDOM_46[15:14];	// bpu.scala:149:22
        PHT_200 = _RANDOM_46[17:16];	// bpu.scala:149:22
        PHT_201 = _RANDOM_46[19:18];	// bpu.scala:149:22
        PHT_202 = _RANDOM_46[21:20];	// bpu.scala:149:22
        PHT_203 = _RANDOM_46[23:22];	// bpu.scala:149:22
        PHT_204 = _RANDOM_46[25:24];	// bpu.scala:149:22
        PHT_205 = _RANDOM_46[27:26];	// bpu.scala:149:22
        PHT_206 = _RANDOM_46[29:28];	// bpu.scala:149:22
        PHT_207 = _RANDOM_46[31:30];	// bpu.scala:149:22
        PHT_208 = _RANDOM_47[1:0];	// bpu.scala:149:22
        PHT_209 = _RANDOM_47[3:2];	// bpu.scala:149:22
        PHT_210 = _RANDOM_47[5:4];	// bpu.scala:149:22
        PHT_211 = _RANDOM_47[7:6];	// bpu.scala:149:22
        PHT_212 = _RANDOM_47[9:8];	// bpu.scala:149:22
        PHT_213 = _RANDOM_47[11:10];	// bpu.scala:149:22
        PHT_214 = _RANDOM_47[13:12];	// bpu.scala:149:22
        PHT_215 = _RANDOM_47[15:14];	// bpu.scala:149:22
        PHT_216 = _RANDOM_47[17:16];	// bpu.scala:149:22
        PHT_217 = _RANDOM_47[19:18];	// bpu.scala:149:22
        PHT_218 = _RANDOM_47[21:20];	// bpu.scala:149:22
        PHT_219 = _RANDOM_47[23:22];	// bpu.scala:149:22
        PHT_220 = _RANDOM_47[25:24];	// bpu.scala:149:22
        PHT_221 = _RANDOM_47[27:26];	// bpu.scala:149:22
        PHT_222 = _RANDOM_47[29:28];	// bpu.scala:149:22
        PHT_223 = _RANDOM_47[31:30];	// bpu.scala:149:22
        PHT_224 = _RANDOM_48[1:0];	// bpu.scala:149:22
        PHT_225 = _RANDOM_48[3:2];	// bpu.scala:149:22
        PHT_226 = _RANDOM_48[5:4];	// bpu.scala:149:22
        PHT_227 = _RANDOM_48[7:6];	// bpu.scala:149:22
        PHT_228 = _RANDOM_48[9:8];	// bpu.scala:149:22
        PHT_229 = _RANDOM_48[11:10];	// bpu.scala:149:22
        PHT_230 = _RANDOM_48[13:12];	// bpu.scala:149:22
        PHT_231 = _RANDOM_48[15:14];	// bpu.scala:149:22
        PHT_232 = _RANDOM_48[17:16];	// bpu.scala:149:22
        PHT_233 = _RANDOM_48[19:18];	// bpu.scala:149:22
        PHT_234 = _RANDOM_48[21:20];	// bpu.scala:149:22
        PHT_235 = _RANDOM_48[23:22];	// bpu.scala:149:22
        PHT_236 = _RANDOM_48[25:24];	// bpu.scala:149:22
        PHT_237 = _RANDOM_48[27:26];	// bpu.scala:149:22
        PHT_238 = _RANDOM_48[29:28];	// bpu.scala:149:22
        PHT_239 = _RANDOM_48[31:30];	// bpu.scala:149:22
        PHT_240 = _RANDOM_49[1:0];	// bpu.scala:149:22
        PHT_241 = _RANDOM_49[3:2];	// bpu.scala:149:22
        PHT_242 = _RANDOM_49[5:4];	// bpu.scala:149:22
        PHT_243 = _RANDOM_49[7:6];	// bpu.scala:149:22
        PHT_244 = _RANDOM_49[9:8];	// bpu.scala:149:22
        PHT_245 = _RANDOM_49[11:10];	// bpu.scala:149:22
        PHT_246 = _RANDOM_49[13:12];	// bpu.scala:149:22
        PHT_247 = _RANDOM_49[15:14];	// bpu.scala:149:22
        PHT_248 = _RANDOM_49[17:16];	// bpu.scala:149:22
        PHT_249 = _RANDOM_49[19:18];	// bpu.scala:149:22
        PHT_250 = _RANDOM_49[21:20];	// bpu.scala:149:22
        PHT_251 = _RANDOM_49[23:22];	// bpu.scala:149:22
        PHT_252 = _RANDOM_49[25:24];	// bpu.scala:149:22
        PHT_253 = _RANDOM_49[27:26];	// bpu.scala:149:22
        PHT_254 = _RANDOM_49[29:28];	// bpu.scala:149:22
        PHT_255 = _RANDOM_49[31:30];	// bpu.scala:149:22
        br_cnt = _RANDOM_50;	// bpu.scala:205:26
        bp_fail = _RANDOM_51;	// bpu.scala:206:26
        hit_cnt = _RANDOM_52;	// bpu.scala:207:26
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// <stdin>:186:10
      `FIRRTL_AFTER_INITIAL	// <stdin>:186:10
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  BPU_Cache BTB (	// bpu.scala:150:21
    .clock        (clock),
    .reset        (reset),
    .io_raddr     (io_PF_pc),
    .io_waddr     (io_ID_to_BPU_bus_bits_PC),
    .io_writeData (io_ID_to_BPU_bus_bits_br_target),
    .io_writeEn   (io_ID_to_BPU_bus_bits_taken & io_ID_to_BPU_bus_valid),	// bpu.scala:155:38
    .io_readData  (_BTB_io_readData),
    .io_hit       (_BTB_io_hit),
    .io_wset      (io_BTB_wset),
    .io_wtag      (io_BTB_wtag),
    .io_rset      (io_BTB_rset),
    .io_rtag      (io_BTB_rtag)
  );
  assign io_bp_taken = _GEN;	// <stdin>:186:10, bpu.scala:181:18, :182:55, :183:18
  assign io_bp_flush = _io_bp_flush_T_1;	// <stdin>:186:10, bpu.scala:168:49
  assign io_bp_npc = _io_bp_flush_T_1 ? io_ID_to_BPU_bus_bits_br_target : _GEN ? _BTB_io_readData :
                _io_bp_npc_T_1;	// <stdin>:186:10, Mux.scala:101:16, bpu.scala:150:21, :168:49, :169:43, :181:18, :182:55, :183:18
  assign io_BTB_rdata = _BTB_io_readData;	// <stdin>:186:10, bpu.scala:150:21
  assign io_BTB_wdata = io_ID_to_BPU_bus_bits_taken ? io_ID_to_BPU_bus_bits_br_target : 64'h0;	// <stdin>:186:10, bpu.scala:141:28, :165:29
  assign io_BTB_hit = _BTB_io_hit;	// <stdin>:186:10, bpu.scala:150:21
  assign io_br_cnt = br_cnt;	// <stdin>:186:10, bpu.scala:205:26
  assign io_bp_fail = bp_fail;	// <stdin>:186:10, bpu.scala:206:26
  assign io_hit_cnt = hit_cnt;	// <stdin>:186:10, bpu.scala:207:26
endmodule

module IF_pre_fetch(	// <stdin>:840:10
  input         clock,
                reset,
                io_stall,
  input  [63:0] io_bp_npc,
  input         io_bp_taken,
                io_bp_flush,
                axi_lite_readData_valid,
  input  [63:0] axi_lite_readData_bits_data,
  input  [1:0]  axi_lite_readData_bits_resp,
  input         axi_req_ready,
  output        io_inst_valid,
  output [63:0] io_PF_pc,
                io_PF_npc,
  output        axi_lite_readAddr_valid,
  output [31:0] axi_lite_readAddr_bits_addr,
  output        axi_lite_readData_ready);

  reg [63:0] PF_npc;	// pre_fetch.scala:24:27
  reg        axi_busy;	// pre_fetch.scala:26:27
  reg [63:0] rhsReg;	// tools.scala:15:29
  always @(posedge clock) begin
    if (reset) begin
      PF_npc <= 64'h80000000;	// pre_fetch.scala:24:27
      axi_busy <= 1'h0;	// pre_fetch.scala:26:27
      rhsReg <= 64'h0;	// tools.scala:15:29
    end
    else begin
      automatic logic [63:0] _PF_npc_T_3;	// pre_fetch.scala:40:33
      _PF_npc_T_3 = io_bp_npc + 64'h4;	// pre_fetch.scala:37:33, :40:33
      if (io_bp_flush) begin
        PF_npc <= _PF_npc_T_3;	// pre_fetch.scala:24:27, :40:33
        rhsReg <= io_bp_npc;	// tools.scala:15:29
      end
      else begin
        if (io_stall | ~axi_req_ready | axi_busy) begin	// pre_fetch.scala:26:27, :27:17, :41:37
        end
        else if (io_bp_taken)	// pre_fetch.scala:26:27, :27:17, :41:37
          PF_npc <= _PF_npc_T_3;	// pre_fetch.scala:24:27, :40:33
        else	// pre_fetch.scala:26:27, :27:17, :41:37
          PF_npc <= PF_npc + 64'h4;	// pre_fetch.scala:24:27, :37:33
        if (io_stall | ~axi_req_ready | axi_busy) begin	// pre_fetch.scala:26:27, :27:17, :53:39
        end
        else if (io_bp_taken)	// pre_fetch.scala:26:27, :27:17, :53:39
          rhsReg <= io_bp_npc;	// tools.scala:15:29
        else	// pre_fetch.scala:26:27, :27:17, :53:39
          rhsReg <= PF_npc;	// pre_fetch.scala:24:27, tools.scala:15:29
      end
      axi_busy <= ~axi_req_ready;	// pre_fetch.scala:26:27, :27:17
    end
  end // always @(posedge)
  `ifndef SYNTHESIS	// <stdin>:840:10
    `ifdef FIRRTL_BEFORE_INITIAL	// <stdin>:840:10
      `FIRRTL_BEFORE_INITIAL	// <stdin>:840:10
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// <stdin>:840:10
      automatic logic [31:0] _RANDOM_0;	// <stdin>:840:10
      automatic logic [31:0] _RANDOM_1;	// <stdin>:840:10
      automatic logic [31:0] _RANDOM_2;	// <stdin>:840:10
      automatic logic [31:0] _RANDOM_3;	// <stdin>:840:10
      automatic logic [31:0] _RANDOM_4;	// <stdin>:840:10
      `ifdef INIT_RANDOM_PROLOG_	// <stdin>:840:10
        `INIT_RANDOM_PROLOG_	// <stdin>:840:10
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// <stdin>:840:10
        _RANDOM_0 = `RANDOM;	// <stdin>:840:10
        _RANDOM_1 = `RANDOM;	// <stdin>:840:10
        _RANDOM_2 = `RANDOM;	// <stdin>:840:10
        _RANDOM_3 = `RANDOM;	// <stdin>:840:10
        _RANDOM_4 = `RANDOM;	// <stdin>:840:10
        PF_npc = {_RANDOM_0, _RANDOM_1};	// pre_fetch.scala:24:27
        axi_busy = _RANDOM_2[0];	// pre_fetch.scala:26:27
        rhsReg = {_RANDOM_2[31:2], _RANDOM_3, _RANDOM_4[1:0]};	// pre_fetch.scala:26:27, tools.scala:15:29
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// <stdin>:840:10
      `FIRRTL_AFTER_INITIAL	// <stdin>:840:10
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_inst_valid = axi_lite_readData_valid & axi_lite_readData_bits_resp == 2'h0 & axi_req_ready & ~axi_busy;	// <stdin>:840:10, pre_fetch.scala:26:27, :81:{96,121,123}
  assign io_PF_pc = rhsReg;	// <stdin>:840:10, tools.scala:15:29
  assign io_PF_npc = PF_npc;	// <stdin>:840:10, pre_fetch.scala:24:27
  assign axi_lite_readAddr_valid = ~io_stall;	// <stdin>:840:10, pre_fetch.scala:70:40
  assign axi_lite_readAddr_bits_addr = io_bp_flush ? io_bp_npc[31:0] : io_stall | ~axi_req_ready | axi_busy ? rhsReg[31:0] :
                io_bp_taken ? io_bp_npc[31:0] : PF_npc[31:0];	// <stdin>:840:10, Mux.scala:101:16, pre_fetch.scala:24:27, :26:27, :27:17, :71:88, :74:72, tools.scala:15:29
  assign axi_lite_readData_ready = ~io_stall;	// <stdin>:840:10, pre_fetch.scala:70:40
endmodule

module IFU(	// <stdin>:923:10
  input         clock,
                reset,
                io_IF_to_ID_bus_ready,
                io_bp_flush,
                io_bp_taken,
  input  [63:0] io_bp_npc,
  input         axi_lite_readData_valid,
  input  [63:0] axi_lite_readData_bits_data,
  input  [1:0]  axi_lite_readData_bits_resp,
  input         axi_req_ready,
  output        io_IF_to_ID_bus_valid,
  output [63:0] io_IF_to_ID_bus_bits_PC,
  output [31:0] io_IF_to_ID_bus_bits_Inst,
  output [63:0] io_PF_npc,
                io_PF_pc,
  output        io_PF_valid,
  output [63:0] io_axidata,
  output        axi_lite_readAddr_valid,
  output [31:0] axi_lite_readAddr_bits_addr,
  output        axi_lite_readData_ready);

  wire        _pre_fetch_io_inst_valid;	// IFU.scala:59:27
  wire [63:0] _pre_fetch_io_PF_pc;	// IFU.scala:59:27
  reg  [63:0] rhsReg;	// tools.scala:32:33
  reg         rhsReg_1;	// tools.scala:32:33
  reg  [63:0] rhsReg_2;	// tools.scala:32:33
  always @(posedge clock) begin
    if (reset | io_bp_flush) begin	// IFU.scala:77:61
      rhsReg <= 64'h0;	// tools.scala:32:33
      rhsReg_1 <= 1'h0;	// <stdin>:923:10, tools.scala:32:33
      rhsReg_2 <= 64'h0;	// tools.scala:32:33
    end
    else if (io_IF_to_ID_bus_ready) begin	// IFU.scala:77:61
      rhsReg <= _pre_fetch_io_PF_pc;	// IFU.scala:59:27, tools.scala:32:33
      rhsReg_1 <= _pre_fetch_io_inst_valid;	// IFU.scala:59:27, tools.scala:32:33
      rhsReg_2 <= axi_lite_readData_bits_data;	// tools.scala:32:33
    end
  end // always @(posedge)
  `ifndef SYNTHESIS	// <stdin>:923:10
    `ifdef FIRRTL_BEFORE_INITIAL	// <stdin>:923:10
      `FIRRTL_BEFORE_INITIAL	// <stdin>:923:10
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// <stdin>:923:10
      automatic logic [31:0] _RANDOM_0;	// <stdin>:923:10
      automatic logic [31:0] _RANDOM_1;	// <stdin>:923:10
      automatic logic [31:0] _RANDOM_2;	// <stdin>:923:10
      automatic logic [31:0] _RANDOM_3;	// <stdin>:923:10
      automatic logic [31:0] _RANDOM_4;	// <stdin>:923:10
      `ifdef INIT_RANDOM_PROLOG_	// <stdin>:923:10
        `INIT_RANDOM_PROLOG_	// <stdin>:923:10
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// <stdin>:923:10
        _RANDOM_0 = `RANDOM;	// <stdin>:923:10
        _RANDOM_1 = `RANDOM;	// <stdin>:923:10
        _RANDOM_2 = `RANDOM;	// <stdin>:923:10
        _RANDOM_3 = `RANDOM;	// <stdin>:923:10
        _RANDOM_4 = `RANDOM;	// <stdin>:923:10
        rhsReg = {_RANDOM_0, _RANDOM_1};	// tools.scala:32:33
        rhsReg_1 = _RANDOM_2[0];	// tools.scala:32:33
        rhsReg_2 = {_RANDOM_2[31:1], _RANDOM_3, _RANDOM_4[0]};	// tools.scala:32:33
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// <stdin>:923:10
      `FIRRTL_AFTER_INITIAL	// <stdin>:923:10
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  IF_pre_fetch pre_fetch (	// IFU.scala:59:27
    .clock                       (clock),
    .reset                       (reset),
    .io_stall                    (~io_IF_to_ID_bus_ready),	// IFU.scala:75:48
    .io_bp_npc                   (io_bp_npc),
    .io_bp_taken                 (io_bp_taken),
    .io_bp_flush                 (io_bp_flush),
    .axi_lite_readData_valid     (axi_lite_readData_valid),
    .axi_lite_readData_bits_data (axi_lite_readData_bits_data),
    .axi_lite_readData_bits_resp (axi_lite_readData_bits_resp),
    .axi_req_ready               (axi_req_ready),
    .io_inst_valid               (_pre_fetch_io_inst_valid),
    .io_PF_pc                    (_pre_fetch_io_PF_pc),
    .io_PF_npc                   (io_PF_npc),
    .axi_lite_readAddr_valid     (axi_lite_readAddr_valid),
    .axi_lite_readAddr_bits_addr (axi_lite_readAddr_bits_addr),
    .axi_lite_readData_ready     (axi_lite_readData_ready)
  );
  assign io_IF_to_ID_bus_valid = rhsReg_1;	// <stdin>:923:10, tools.scala:32:33
  assign io_IF_to_ID_bus_bits_PC = rhsReg;	// <stdin>:923:10, tools.scala:32:33
  assign io_IF_to_ID_bus_bits_Inst = rhsReg_2[31:0];	// <stdin>:923:10, tools.scala:32:33, :37:17
  assign io_PF_pc = _pre_fetch_io_PF_pc;	// <stdin>:923:10, IFU.scala:59:27
  assign io_PF_valid = _pre_fetch_io_inst_valid;	// <stdin>:923:10, IFU.scala:59:27
  assign io_axidata = axi_lite_readData_bits_data;	// <stdin>:923:10
endmodule

module IDU(	// <stdin>:984:10
  input         clock,
                reset,
                io_IF_to_ID_bus_valid,
  input  [63:0] io_IF_to_ID_bus_bits_PC,
  input  [31:0] io_IF_to_ID_bus_bits_Inst,
  input  [63:0] io_WB_to_ID_forward_bits_regWriteData,
  input         io_WB_to_ID_forward_bits_regWriteEn,
  input  [4:0]  io_WB_to_ID_forward_bits_regWriteID,
  input  [63:0] io_PMEM_to_ID_forward_bits_ALU_result,
  input         io_PMEM_to_ID_forward_bits_regWriteEn,
  input  [4:0]  io_PMEM_to_ID_forward_bits_regWriteID,
  input         io_PMEM_to_ID_forward_bits_memReadEn,
  input  [63:0] io_MEM_to_ID_forward_bits_regWriteData,
  input         io_MEM_to_ID_forward_bits_regWriteEn,
  input  [4:0]  io_MEM_to_ID_forward_bits_regWriteID,
  input  [63:0] io_EX_ALUResult,
  output        io_IF_to_ID_bus_ready,
                io_ID_to_EX_bus_valid,
  output [63:0] io_ID_to_EX_bus_bits_ALU_Data1,
                io_ID_to_EX_bus_bits_ALU_Data2,
  output        io_ID_to_EX_bus_bits_futype,
  output [4:0]  io_ID_to_EX_bus_bits_optype,
  output [63:0] io_ID_to_EX_bus_bits_rs1_data,
                io_ID_to_EX_bus_bits_rs2_data,
  output [4:0]  io_ID_to_EX_bus_bits_regWriteID,
  output        io_ID_to_EX_bus_bits_regWriteEn,
                io_ID_to_EX_bus_bits_memWriteEn,
                io_ID_to_EX_bus_bits_memReadEn,
  output [63:0] io_ID_to_EX_bus_bits_PC,
  output [31:0] io_ID_to_EX_bus_bits_Inst,
  output        io_ID_to_BPU_bus_valid,
  output [63:0] io_ID_to_BPU_bus_bits_PC,
  output        io_ID_to_BPU_bus_bits_taken,
  output [63:0] io_ID_to_BPU_bus_bits_br_target,
  output        io_ID_to_BPU_bus_bits_load_use_stall,
                io_ID_stall,
  output [63:0] io_ID_GPR_0,
                io_ID_GPR_1,
                io_ID_GPR_2,
                io_ID_GPR_3,
                io_ID_GPR_4,
                io_ID_GPR_5,
                io_ID_GPR_6,
                io_ID_GPR_7,
                io_ID_GPR_8,
                io_ID_GPR_9,
                io_ID_GPR_10,
                io_ID_GPR_11,
                io_ID_GPR_12,
                io_ID_GPR_13,
                io_ID_GPR_14,
                io_ID_GPR_15,
                io_ID_GPR_16,
                io_ID_GPR_17,
                io_ID_GPR_18,
                io_ID_GPR_19,
                io_ID_GPR_20,
                io_ID_GPR_21,
                io_ID_GPR_22,
                io_ID_GPR_23,
                io_ID_GPR_24,
                io_ID_GPR_25,
                io_ID_GPR_26,
                io_ID_GPR_27,
                io_ID_GPR_28,
                io_ID_GPR_29,
                io_ID_GPR_30,
                io_ID_GPR_31,
  output        io_ID_unknown_inst);

  reg               rhsReg_5;	// tools.scala:23:33
  reg  [4:0]        rhsReg_4;	// tools.scala:23:33
  wire              _InstInfo_T_1 = io_IF_to_ID_bus_bits_Inst == 32'h100073;	// Lookup.scala:31:38
  wire              _InstInfo_T_3 = io_IF_to_ID_bus_bits_Inst[6:0] == 7'h17;	// Lookup.scala:31:38
  wire              _InstInfo_T_5 = io_IF_to_ID_bus_bits_Inst[6:0] == 7'h37;	// Lookup.scala:31:38
  wire [9:0]        _GEN = {io_IF_to_ID_bus_bits_Inst[14:12], io_IF_to_ID_bus_bits_Inst[6:0]};	// Lookup.scala:31:38
  wire              _InstInfo_T_7 = _GEN == 10'h13;	// Lookup.scala:31:38
  wire [15:0]       _GEN_0 = {io_IF_to_ID_bus_bits_Inst[31:26], io_IF_to_ID_bus_bits_Inst[14:12],
                io_IF_to_ID_bus_bits_Inst[6:0]};	// Lookup.scala:31:38
  wire              _InstInfo_T_9 = _GEN_0 == 16'h93;	// Lookup.scala:31:38
  wire              _InstInfo_T_11 = _GEN_0 == 16'h293;	// Lookup.scala:31:38
  wire              _InstInfo_T_13 = _GEN_0 == 16'h4293;	// Lookup.scala:31:38
  wire              _InstInfo_T_15 = _GEN == 10'h67;	// Lookup.scala:31:38
  wire              _InstInfo_T_17 = _GEN == 10'h213;	// Lookup.scala:31:38
  wire              _InstInfo_T_19 = _GEN == 10'h313;	// Lookup.scala:31:38
  wire              _InstInfo_T_21 = _GEN == 10'h393;	// Lookup.scala:31:38
  wire              _InstInfo_T_23 = _GEN == 10'h113;	// Lookup.scala:31:38
  wire              _InstInfo_T_25 = _GEN == 10'h193;	// Lookup.scala:31:38
  wire              _InstInfo_T_27 = _GEN == 10'h1B;	// Lookup.scala:31:38
  wire [16:0]       _GEN_1 = {io_IF_to_ID_bus_bits_Inst[31:25], io_IF_to_ID_bus_bits_Inst[14:12],
                io_IF_to_ID_bus_bits_Inst[6:0]};	// Lookup.scala:31:38
  wire              _InstInfo_T_29 = _GEN_1 == 17'h9B;	// Lookup.scala:31:38
  wire              _InstInfo_T_31 = _GEN_1 == 17'h29B;	// Lookup.scala:31:38
  wire              _InstInfo_T_33 = _GEN_1 == 17'h829B;	// Lookup.scala:31:38
  wire              _InstInfo_T_35 = _GEN == 10'h3;	// Lookup.scala:31:38
  wire              _InstInfo_T_37 = _GEN == 10'h83;	// Lookup.scala:31:38
  wire              _InstInfo_T_39 = _GEN == 10'h103;	// Lookup.scala:31:38
  wire              _InstInfo_T_41 = _GEN == 10'h183;	// Lookup.scala:31:38
  wire              _InstInfo_T_43 = _GEN == 10'h203;	// Lookup.scala:31:38
  wire              _InstInfo_T_45 = _GEN == 10'h283;	// Lookup.scala:31:38
  wire              _InstInfo_T_47 = _GEN == 10'h303;	// Lookup.scala:31:38
  wire              _InstInfo_T_49 = _GEN == 10'h1A3;	// Lookup.scala:31:38
  wire              _InstInfo_T_51 = _GEN == 10'h123;	// Lookup.scala:31:38
  wire              _InstInfo_T_53 = _GEN == 10'hA3;	// Lookup.scala:31:38
  wire              _InstInfo_T_203 = _GEN == 10'h23;	// Lookup.scala:31:38
  wire              _InstInfo_T_57 = _GEN_1 == 17'h33;	// Lookup.scala:31:38
  wire              _InstInfo_T_59 = _GEN_1 == 17'hB3;	// Lookup.scala:31:38
  wire              _InstInfo_T_61 = _GEN_1 == 17'h8033;	// Lookup.scala:31:38
  wire              _InstInfo_T_63 = _GEN_1 == 17'h233;	// Lookup.scala:31:38
  wire              _InstInfo_T_65 = _GEN_1 == 17'h333;	// Lookup.scala:31:38
  wire              _InstInfo_T_67 = _GEN_1 == 17'h3B3;	// Lookup.scala:31:38
  wire              _InstInfo_T_69 = _GEN_1 == 17'h133;	// Lookup.scala:31:38
  wire              _InstInfo_T_71 = _GEN_1 == 17'h1B3;	// Lookup.scala:31:38
  wire              _InstInfo_T_73 = _GEN_1 == 17'h433;	// Lookup.scala:31:38
  wire              _InstInfo_T_75 = _GEN_1 == 17'h633;	// Lookup.scala:31:38
  wire              _InstInfo_T_77 = _GEN_1 == 17'h6B3;	// Lookup.scala:31:38
  wire              _InstInfo_T_79 = _GEN_1 == 17'h733;	// Lookup.scala:31:38
  wire              _InstInfo_T_81 = _GEN_1 == 17'h7B3;	// Lookup.scala:31:38
  wire              _InstInfo_T_83 = _GEN_1 == 17'h3B;	// Lookup.scala:31:38
  wire              _InstInfo_T_85 = _GEN_1 == 17'h803B;	// Lookup.scala:31:38
  wire              _InstInfo_T_87 = _GEN_1 == 17'hBB;	// Lookup.scala:31:38
  wire              _InstInfo_T_89 = _GEN_1 == 17'h2BB;	// Lookup.scala:31:38
  wire              _InstInfo_T_91 = _GEN_1 == 17'h82BB;	// Lookup.scala:31:38
  wire              _InstInfo_T_93 = _GEN_1 == 17'h43B;	// Lookup.scala:31:38
  wire              _InstInfo_T_95 = _GEN_1 == 17'h63B;	// Lookup.scala:31:38
  wire              _InstInfo_T_97 = _GEN_1 == 17'h6BB;	// Lookup.scala:31:38
  wire              _InstInfo_T_99 = _GEN_1 == 17'h73B;	// Lookup.scala:31:38
  wire              _InstInfo_T_101 = _GEN_1 == 17'h7BB;	// Lookup.scala:31:38
  wire              _InstInfo_T_103 = io_IF_to_ID_bus_bits_Inst[6:0] == 7'h6F;	// Lookup.scala:31:38
  wire              _InstInfo_T_105 = _GEN == 10'h63;	// Lookup.scala:31:38
  wire              _InstInfo_T_107 = _GEN == 10'hE3;	// Lookup.scala:31:38
  wire              _InstInfo_T_109 = _GEN == 10'h263;	// Lookup.scala:31:38
  wire              _InstInfo_T_111 = _GEN == 10'h363;	// Lookup.scala:31:38
  wire              _InstInfo_T_113 = _GEN == 10'h2E3;	// Lookup.scala:31:38
  wire              _InstInfo_T_230 = _GEN == 10'h3E3;	// Lookup.scala:31:38
  wire              _GEN_2 = _InstInfo_T_57 | _InstInfo_T_59 | _InstInfo_T_61 | _InstInfo_T_63 | _InstInfo_T_65 |
                _InstInfo_T_67 | _InstInfo_T_69 | _InstInfo_T_71 | _InstInfo_T_73 | _InstInfo_T_75 |
                _InstInfo_T_77 | _InstInfo_T_79 | _InstInfo_T_81 | _InstInfo_T_83 | _InstInfo_T_85 |
                _InstInfo_T_87 | _InstInfo_T_89 | _InstInfo_T_91 | _InstInfo_T_93 | _InstInfo_T_95 |
                _InstInfo_T_97 | _InstInfo_T_99 | _InstInfo_T_101;	// Lookup.scala:31:38, :34:39
  wire [2:0]        InstInfo_0 = _InstInfo_T_1 ? 3'h7 : _InstInfo_T_3 | _InstInfo_T_5 ? 3'h3 : _InstInfo_T_7 | _InstInfo_T_9
                | _InstInfo_T_11 | _InstInfo_T_13 | _InstInfo_T_15 | _InstInfo_T_17 | _InstInfo_T_19 |
                _InstInfo_T_21 | _InstInfo_T_23 | _InstInfo_T_25 | _InstInfo_T_27 | _InstInfo_T_29 |
                _InstInfo_T_31 | _InstInfo_T_33 | _InstInfo_T_35 | _InstInfo_T_37 | _InstInfo_T_39 |
                _InstInfo_T_41 | _InstInfo_T_43 | _InstInfo_T_45 | _InstInfo_T_47 ? 3'h1 : _InstInfo_T_49 |
                _InstInfo_T_51 | _InstInfo_T_53 | _InstInfo_T_203 ? 3'h4 : _GEN_2 ? 3'h2 : _InstInfo_T_103
                ? 3'h5 : _InstInfo_T_105 | _InstInfo_T_107 | _InstInfo_T_109 | _InstInfo_T_111 |
                _InstInfo_T_113 | _InstInfo_T_230 ? 3'h6 : 3'h0;	// Lookup.scala:31:38, :34:39
  wire              InstInfo_1 = ~_InstInfo_T_1 & ~_InstInfo_T_3 & ~_InstInfo_T_5 & ~_InstInfo_T_7 & ~_InstInfo_T_9 &
                ~_InstInfo_T_11 & ~_InstInfo_T_13 & ~_InstInfo_T_15 & ~_InstInfo_T_17 & ~_InstInfo_T_19 &
                ~_InstInfo_T_21 & ~_InstInfo_T_23 & ~_InstInfo_T_25 & ~_InstInfo_T_27 & ~_InstInfo_T_29 &
                ~_InstInfo_T_31 & ~_InstInfo_T_33 & (_InstInfo_T_35 | _InstInfo_T_37 | _InstInfo_T_39 |
                _InstInfo_T_41 | _InstInfo_T_43 | _InstInfo_T_45 | _InstInfo_T_47 | _InstInfo_T_49 |
                _InstInfo_T_51 | _InstInfo_T_53 | _InstInfo_T_203);	// Lookup.scala:31:38, :34:39
  wire              _GEN_3 = _InstInfo_T_17 | _InstInfo_T_19 | _InstInfo_T_21 | _InstInfo_T_23 | _InstInfo_T_25 |
                _InstInfo_T_27 | _InstInfo_T_29 | _InstInfo_T_31 | _InstInfo_T_33 | _InstInfo_T_35 |
                _InstInfo_T_37 | _InstInfo_T_39 | _InstInfo_T_41 | _InstInfo_T_43 | _InstInfo_T_45 |
                _InstInfo_T_47 | _InstInfo_T_49 | _InstInfo_T_51 | _InstInfo_T_53 | _InstInfo_T_203 |
                _InstInfo_T_57;	// Lookup.scala:31:38, :34:39
  wire              _GEN_4 = _InstInfo_T_59 | _InstInfo_T_61 | _InstInfo_T_63 | _InstInfo_T_65 | _InstInfo_T_67 |
                _InstInfo_T_69 | _InstInfo_T_71 | _InstInfo_T_73 | _InstInfo_T_75 | _InstInfo_T_77 |
                _InstInfo_T_79 | _InstInfo_T_81 | _InstInfo_T_83 | _InstInfo_T_85 | _InstInfo_T_87 |
                _InstInfo_T_89 | _InstInfo_T_91 | _InstInfo_T_93 | _InstInfo_T_95 | _InstInfo_T_97 |
                _InstInfo_T_99 | _InstInfo_T_101;	// Lookup.scala:31:38, :34:39
  wire [2:0]        InstInfo_2 = _InstInfo_T_1 ? 3'h0 : _InstInfo_T_3 ? 3'h1 : _InstInfo_T_5 ? 3'h0 : _InstInfo_T_7 |
                _InstInfo_T_9 | _InstInfo_T_11 | _InstInfo_T_13 ? 3'h2 : _InstInfo_T_15 ? 3'h6 : _GEN_3 |
                _GEN_4 ? 3'h2 : _InstInfo_T_103 ? 3'h6 : {2'h0, _InstInfo_T_105 | _InstInfo_T_107 |
                _InstInfo_T_109 | _InstInfo_T_111 | _InstInfo_T_113 | _InstInfo_T_230};	// Lookup.scala:31:38, :34:39
  wire [2:0]        InstInfo_3 = _InstInfo_T_1 ? 3'h0 : _InstInfo_T_3 | _InstInfo_T_5 | _InstInfo_T_7 ? 3'h4 : _InstInfo_T_9
                | _InstInfo_T_11 | _InstInfo_T_13 ? 3'h5 : _InstInfo_T_15 ? 3'h0 : _InstInfo_T_17 |
                _InstInfo_T_19 | _InstInfo_T_21 | _InstInfo_T_23 | _InstInfo_T_25 | _InstInfo_T_27 ? 3'h4 :
                _InstInfo_T_29 | _InstInfo_T_31 | _InstInfo_T_33 ? 3'h5 : _InstInfo_T_35 | _InstInfo_T_37 |
                _InstInfo_T_39 | _InstInfo_T_41 | _InstInfo_T_43 | _InstInfo_T_45 | _InstInfo_T_47 |
                _InstInfo_T_49 | _InstInfo_T_51 | _InstInfo_T_53 | _InstInfo_T_203 ? 3'h4 : _GEN_2 ? 3'h3 :
                _InstInfo_T_103 ? 3'h0 : _InstInfo_T_105 | _InstInfo_T_107 | _InstInfo_T_109 |
                _InstInfo_T_111 | _InstInfo_T_113 ? 3'h4 : {_InstInfo_T_230, 2'h0};	// Lookup.scala:31:38, :34:39
  wire [4:0]        _GEN_5 = {2'h0, _InstInfo_T_103 | _InstInfo_T_105 ? 3'h1 : _InstInfo_T_107 ? 3'h2 : _InstInfo_T_109
                ? 3'h3 : _InstInfo_T_111 ? 3'h4 : _InstInfo_T_113 ? 3'h6 : _InstInfo_T_230 ? 3'h5 : 3'h0};	// Lookup.scala:31:38, :34:39
  wire              _GEN_6 = _InstInfo_T_1 | _InstInfo_T_3 | _InstInfo_T_5 | _InstInfo_T_7;	// Lookup.scala:31:38, :34:39
  wire [4:0]        InstInfo_4 = _GEN_6 ? 5'h1 : _InstInfo_T_9 ? 5'h7 : _InstInfo_T_11 ? 5'h8 : _InstInfo_T_13 ? 5'h9 :
                _InstInfo_T_15 ? 5'h1 : _InstInfo_T_17 ? 5'h6 : _InstInfo_T_19 ? 5'h5 : _InstInfo_T_21 ?
                5'h4 : _InstInfo_T_23 ? 5'hA : _InstInfo_T_25 ? 5'hB : _InstInfo_T_27 ? 5'h11 :
                _InstInfo_T_29 ? 5'h13 : _InstInfo_T_31 ? 5'h15 : _InstInfo_T_33 ? 5'h14 : _InstInfo_T_35 ?
                5'h3 : _InstInfo_T_37 ? 5'h5 : _InstInfo_T_39 ? 5'h9 : _InstInfo_T_41 ? 5'h11 :
                _InstInfo_T_43 ? 5'h2 : _InstInfo_T_45 ? 5'h4 : _InstInfo_T_47 ? 5'h8 : _InstInfo_T_49 ?
                5'h10 : _InstInfo_T_51 ? 5'h8 : _InstInfo_T_53 ? 5'h4 : _InstInfo_T_203 ? 5'h2 :
                _InstInfo_T_57 ? 5'h1 : _InstInfo_T_59 ? 5'h7 : _InstInfo_T_61 ? 5'h2 : _InstInfo_T_63 ?
                5'h6 : _InstInfo_T_65 ? 5'h5 : _InstInfo_T_67 ? 5'h4 : _InstInfo_T_69 ? 5'hA :
                _InstInfo_T_71 ? 5'hB : _InstInfo_T_73 ? 5'hC : _InstInfo_T_75 ? 5'hD : _InstInfo_T_77 ?
                5'hE : _InstInfo_T_79 ? 5'hF : _InstInfo_T_81 ? 5'h10 : _InstInfo_T_83 ? 5'h11 :
                _InstInfo_T_85 ? 5'h12 : _InstInfo_T_87 ? 5'h13 : _InstInfo_T_89 ? 5'h15 : _InstInfo_T_91 ?
                5'h14 : _InstInfo_T_93 ? 5'h19 : _InstInfo_T_95 ? 5'h1A : _InstInfo_T_97 ? 5'h1B :
                _InstInfo_T_99 ? 5'h1C : _InstInfo_T_101 ? 5'h1D : _GEN_5;	// IDU.scala:148:28, Lookup.scala:31:38, :34:39
  wire [51:0]       _immI_ret_T_2 = {52{io_IF_to_ID_bus_bits_Inst[31]}};	// Bitwise.scala:77:12, tools.scala:9:34
  reg  [63:0]       GPR_0;	// IDU.scala:114:22
  reg  [63:0]       GPR_1;	// IDU.scala:114:22
  reg  [63:0]       GPR_2;	// IDU.scala:114:22
  reg  [63:0]       GPR_3;	// IDU.scala:114:22
  reg  [63:0]       GPR_4;	// IDU.scala:114:22
  reg  [63:0]       GPR_5;	// IDU.scala:114:22
  reg  [63:0]       GPR_6;	// IDU.scala:114:22
  reg  [63:0]       GPR_7;	// IDU.scala:114:22
  reg  [63:0]       GPR_8;	// IDU.scala:114:22
  reg  [63:0]       GPR_9;	// IDU.scala:114:22
  reg  [63:0]       GPR_10;	// IDU.scala:114:22
  reg  [63:0]       GPR_11;	// IDU.scala:114:22
  reg  [63:0]       GPR_12;	// IDU.scala:114:22
  reg  [63:0]       GPR_13;	// IDU.scala:114:22
  reg  [63:0]       GPR_14;	// IDU.scala:114:22
  reg  [63:0]       GPR_15;	// IDU.scala:114:22
  reg  [63:0]       GPR_16;	// IDU.scala:114:22
  reg  [63:0]       GPR_17;	// IDU.scala:114:22
  reg  [63:0]       GPR_18;	// IDU.scala:114:22
  reg  [63:0]       GPR_19;	// IDU.scala:114:22
  reg  [63:0]       GPR_20;	// IDU.scala:114:22
  reg  [63:0]       GPR_21;	// IDU.scala:114:22
  reg  [63:0]       GPR_22;	// IDU.scala:114:22
  reg  [63:0]       GPR_23;	// IDU.scala:114:22
  reg  [63:0]       GPR_24;	// IDU.scala:114:22
  reg  [63:0]       GPR_25;	// IDU.scala:114:22
  reg  [63:0]       GPR_26;	// IDU.scala:114:22
  reg  [63:0]       GPR_27;	// IDU.scala:114:22
  reg  [63:0]       GPR_28;	// IDU.scala:114:22
  reg  [63:0]       GPR_29;	// IDU.scala:114:22
  reg  [63:0]       GPR_30;	// IDU.scala:114:22
  reg  [63:0]       GPR_31;	// IDU.scala:114:22
  wire              _rs1_data_T = io_IF_to_ID_bus_bits_Inst[19:15] == 5'h0;	// IDU.scala:106:39, :127:19, :131:15
  wire              _load_use_stall_T_5 = rhsReg_4 == io_IF_to_ID_bus_bits_Inst[19:15];	// IDU.scala:127:19, :132:44, tools.scala:23:33
  wire              _rs1_data_T_2 = _load_use_stall_T_5 & rhsReg_5;	// IDU.scala:132:{44,53}, tools.scala:23:33
  wire              _load_use_stall_T_7 = io_PMEM_to_ID_forward_bits_regWriteID == io_IF_to_ID_bus_bits_Inst[19:15];	// IDU.scala:127:19, :133:27
  wire              _rs1_data_T_4 = _load_use_stall_T_7 & io_PMEM_to_ID_forward_bits_regWriteEn;	// IDU.scala:133:{27,36}
  wire              _rs1_data_T_6 = io_MEM_to_ID_forward_bits_regWriteID == io_IF_to_ID_bus_bits_Inst[19:15] &
                io_MEM_to_ID_forward_bits_regWriteEn;	// IDU.scala:127:19, :134:{26,35}
  wire              _rs1_data_T_8 = io_WB_to_ID_forward_bits_regWriteID == io_IF_to_ID_bus_bits_Inst[19:15] &
                io_WB_to_ID_forward_bits_regWriteEn;	// IDU.scala:127:19, :135:{26,35}
  wire [31:0][63:0] _GEN_7 = {{GPR_31}, {GPR_30}, {GPR_29}, {GPR_28}, {GPR_27}, {GPR_26}, {GPR_25}, {GPR_24}, {GPR_23},
                {GPR_22}, {GPR_21}, {GPR_20}, {GPR_19}, {GPR_18}, {GPR_17}, {GPR_16}, {GPR_15}, {GPR_14},
                {GPR_13}, {GPR_12}, {GPR_11}, {GPR_10}, {GPR_9}, {GPR_8}, {GPR_7}, {GPR_6}, {GPR_5},
                {GPR_4}, {GPR_3}, {GPR_2}, {GPR_1}, {GPR_0}};	// IDU.scala:114:22, Mux.scala:101:16
  wire [63:0]       _GEN_8;	// Mux.scala:101:16
  /* synopsys infer_mux_override */
  assign _GEN_8 = _GEN_7[io_IF_to_ID_bus_bits_Inst[19:15]] /* cadence map_to_mux */;	// IDU.scala:127:19, Mux.scala:101:16
  wire [63:0]       _rs1_data_T_13 = _rs1_data_T ? 64'h0 : _rs1_data_T_2 ? io_EX_ALUResult : _rs1_data_T_4 ?
                io_PMEM_to_ID_forward_bits_ALU_result : _rs1_data_T_6 ?
                io_MEM_to_ID_forward_bits_regWriteData : _rs1_data_T_8 ?
                io_WB_to_ID_forward_bits_regWriteData : _GEN_8;	// IDU.scala:114:30, :131:15, :132:53, :133:36, :134:35, :135:35, Mux.scala:101:16
  wire              _rs2_data_T = io_IF_to_ID_bus_bits_Inst[24:20] == 5'h0;	// IDU.scala:106:39, :128:19, :139:15
  wire              _load_use_stall_T_16 = rhsReg_4 == io_IF_to_ID_bus_bits_Inst[24:20];	// IDU.scala:128:19, :140:44, tools.scala:23:33
  wire              _rs2_data_T_2 = _load_use_stall_T_16 & rhsReg_5;	// IDU.scala:140:{44,53}, tools.scala:23:33
  wire              _load_use_stall_T_18 = io_PMEM_to_ID_forward_bits_regWriteID == io_IF_to_ID_bus_bits_Inst[24:20];	// IDU.scala:128:19, :141:27
  wire              _rs2_data_T_4 = _load_use_stall_T_18 & io_PMEM_to_ID_forward_bits_regWriteEn;	// IDU.scala:141:{27,36}
  wire              _rs2_data_T_6 = io_MEM_to_ID_forward_bits_regWriteID == io_IF_to_ID_bus_bits_Inst[24:20] &
                io_MEM_to_ID_forward_bits_regWriteEn;	// IDU.scala:128:19, :142:{26,35}
  wire              _rs2_data_T_8 = io_WB_to_ID_forward_bits_regWriteID == io_IF_to_ID_bus_bits_Inst[24:20] &
                io_WB_to_ID_forward_bits_regWriteEn;	// IDU.scala:128:19, :143:{26,35}
  wire [63:0]       _GEN_9;	// Mux.scala:101:16
  /* synopsys infer_mux_override */
  assign _GEN_9 = _GEN_7[io_IF_to_ID_bus_bits_Inst[24:20]] /* cadence map_to_mux */;	// IDU.scala:128:19, Mux.scala:101:16
  wire [63:0]       _rs2_data_T_13 = _rs2_data_T ? 64'h0 : _rs2_data_T_2 ? io_EX_ALUResult : _rs2_data_T_4 ?
                io_PMEM_to_ID_forward_bits_ALU_result : _rs2_data_T_6 ?
                io_MEM_to_ID_forward_bits_regWriteData : _rs2_data_T_8 ?
                io_WB_to_ID_forward_bits_regWriteData : _GEN_9;	// IDU.scala:114:30, :139:15, :140:53, :141:36, :142:35, :143:35, Mux.scala:101:16
  wire              _io_ID_to_BPU_bus_valid_T_3 = InstInfo_0 == 3'h1;	// IDU.scala:166:19, Lookup.scala:34:39
  wire              _io_ID_to_BPU_bus_valid_T_1 = InstInfo_0 == 3'h6;	// IDU.scala:167:19, Lookup.scala:34:39
  wire              _load_use_stall_T = InstInfo_2 == 3'h2;	// IDU.scala:175:15, Lookup.scala:34:39
  wire              _io_ID_to_BPU_bus_valid_T_4 = InstInfo_2 == 3'h6;	// IDU.scala:176:15, Lookup.scala:34:39
  wire [63:0]       _ALU_Data1_T_5 = io_IF_to_ID_bus_bits_PC + 64'h4;	// IDU.scala:176:30
  wire              _load_use_stall_T_11 = InstInfo_3 == 3'h3;	// IDU.scala:182:15, Lookup.scala:34:39
  wire              _io_ID_to_BPU_bus_valid_T = InstInfo_0 == 3'h5;	// IDU.scala:187:104, Lookup.scala:34:39
  reg  [63:0]       rhsReg;	// tools.scala:23:33
  reg  [31:0]       rhsReg_1;	// tools.scala:23:33
  reg  [63:0]       rhsReg_2;	// tools.scala:23:33
  reg  [63:0]       rhsReg_3;	// tools.scala:23:33
  reg               rhsReg_6;	// tools.scala:23:33
  reg               rhsReg_7;	// tools.scala:23:33
  reg  [4:0]        rhsReg_8;	// tools.scala:23:33
  reg  [1:0]        rhsReg_9;	// tools.scala:23:33
  reg  [63:0]       rhsReg_10;	// tools.scala:23:33
  reg  [63:0]       rhsReg_12;	// tools.scala:23:33
  reg               rhsReg_14;	// tools.scala:23:33
  wire              _load_use_stall_T_22 = (_load_use_stall_T | _io_ID_to_BPU_bus_valid_T_4 | _io_ID_to_BPU_bus_valid_T_1) & (rhsReg_6
                & _load_use_stall_T_5 | io_PMEM_to_ID_forward_bits_memReadEn & _load_use_stall_T_7) |
                (_load_use_stall_T_11 | InstInfo_1 | _io_ID_to_BPU_bus_valid_T_1) & (rhsReg_6 &
                _load_use_stall_T_16 | io_PMEM_to_ID_forward_bits_memReadEn & _load_use_stall_T_18);	// IDU.scala:132:44, :133:27, :140:44, :141:27, :167:19, :175:15, :176:15, :182:15, :220:{43,67}, :221:{46,90}, :222:29, :223:65, :225:{52,76}, :226:{46,90}, :227:29, Lookup.scala:34:39, tools.scala:23:33
  wire              _GEN_10 = InstInfo_4 == 5'h1 ? _rs1_data_T_13 == _rs2_data_T_13 : InstInfo_4 == 5'h2 ? _rs1_data_T_13
                != _rs2_data_T_13 : InstInfo_4 == 5'h3 ? $signed(_rs1_data_T_13) < $signed(_rs2_data_T_13)
                : InstInfo_4 == 5'h6 ? $signed(_rs1_data_T_13) >= $signed(_rs2_data_T_13) : InstInfo_4 ==
                5'h4 ? _rs1_data_T_13 < _rs2_data_T_13 : InstInfo_4 == 5'h5 & _rs1_data_T_13 >=
                _rs2_data_T_13;	// IDU.scala:148:28, :233:13, :234:19, :235:{34,46}, :236:{34,46}, :237:{34,53}, :238:{34,53}, :239:{34,46}, :240:{34,46}, Lookup.scala:34:39, Mux.scala:101:16
  always @(posedge clock) begin
    if (reset) begin
      GPR_0 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_1 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_2 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_3 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_4 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_5 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_6 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_7 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_8 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_9 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_10 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_11 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_12 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_13 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_14 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_15 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_16 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_17 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_18 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_19 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_20 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_21 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_22 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_23 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_24 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_25 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_26 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_27 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_28 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_29 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_30 <= 64'h0;	// IDU.scala:114:{22,30}
      GPR_31 <= 64'h0;	// IDU.scala:114:{22,30}
    end
    else begin
      automatic logic _T_1 = io_WB_to_ID_forward_bits_regWriteEn & (|io_WB_to_ID_forward_bits_regWriteID);	// IDU.scala:146:{24,41}
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h0)	// IDU.scala:106:39, :114:22, :146:24, :147:5, :148:28
        GPR_0 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h1)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_1 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h2)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_2 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h3)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_3 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h4)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_4 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h5)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_5 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h6)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_6 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h7)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_7 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h8)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_8 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h9)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_9 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'hA)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_10 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'hB)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_11 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'hC)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_12 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'hD)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_13 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'hE)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_14 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'hF)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_15 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h10)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:34:39
        GPR_16 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h11)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:34:39
        GPR_17 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h12)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:34:39
        GPR_18 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h13)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:31:38
        GPR_19 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h14)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:34:39
        GPR_20 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h15)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:34:39
        GPR_21 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h16)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_22 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h17)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:31:38
        GPR_23 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h18)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_24 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h19)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:34:39
        GPR_25 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h1A)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:34:39
        GPR_26 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h1B)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:31:38
        GPR_27 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h1C)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:34:39
        GPR_28 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h1D)	// IDU.scala:114:22, :146:24, :147:5, :148:28, Lookup.scala:34:39
        GPR_29 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & io_WB_to_ID_forward_bits_regWriteID == 5'h1E)	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_30 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
      if (_T_1 & (&io_WB_to_ID_forward_bits_regWriteID))	// IDU.scala:114:22, :146:24, :147:5, :148:28
        GPR_31 <= io_WB_to_ID_forward_bits_regWriteData;	// IDU.scala:114:22
    end
    if (reset | _load_use_stall_T_22 | ~io_IF_to_ID_bus_valid) begin	// IDU.scala:192:{48,50}, :223:65
      rhsReg <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
      rhsReg_1 <= 32'h0;	// Mux.scala:101:16, tools.scala:23:33
      rhsReg_2 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
      rhsReg_3 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
      rhsReg_4 <= 5'h0;	// IDU.scala:106:39, tools.scala:23:33
      rhsReg_5 <= 1'h0;	// Lookup.scala:34:39, tools.scala:23:33
      rhsReg_6 <= 1'h0;	// Lookup.scala:34:39, tools.scala:23:33
      rhsReg_7 <= 1'h0;	// Lookup.scala:34:39, tools.scala:23:33
      rhsReg_8 <= 5'h0;	// IDU.scala:106:39, tools.scala:23:33
      rhsReg_9 <= 2'h0;	// Lookup.scala:34:39, tools.scala:23:33
      rhsReg_10 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
      rhsReg_12 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
      rhsReg_14 <= 1'h0;	// Lookup.scala:34:39, tools.scala:23:33
    end
    else begin	// IDU.scala:192:{48,50}, :223:65
      automatic logic _regWriteEn_T_3;	// IDU.scala:168:19
      automatic logic _memWriteEn_T;	// IDU.scala:169:19
      _regWriteEn_T_3 = InstInfo_0 == 3'h3;	// IDU.scala:168:19, Lookup.scala:34:39
      _memWriteEn_T = InstInfo_0 == 3'h4;	// IDU.scala:169:19, Lookup.scala:34:39
      rhsReg <= io_IF_to_ID_bus_bits_PC;	// tools.scala:23:33
      rhsReg_1 <= io_IF_to_ID_bus_bits_Inst;	// tools.scala:23:33
      if (InstInfo_2 == 3'h0)	// IDU.scala:173:15, Lookup.scala:34:39
        rhsReg_2 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
      else if (InstInfo_2 == 3'h1)	// IDU.scala:173:15, :174:15, Lookup.scala:34:39
        rhsReg_2 <= io_IF_to_ID_bus_bits_PC;	// tools.scala:23:33
      else if (_load_use_stall_T) begin	// IDU.scala:173:15, :174:15, :175:15, Lookup.scala:34:39
        if (_rs1_data_T)	// IDU.scala:131:15
          rhsReg_2 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
        else if (_rs1_data_T_2)	// IDU.scala:131:15, :132:53
          rhsReg_2 <= io_EX_ALUResult;	// tools.scala:23:33
        else if (_rs1_data_T_4)	// IDU.scala:131:15, :132:53, :133:36
          rhsReg_2 <= io_PMEM_to_ID_forward_bits_ALU_result;	// tools.scala:23:33
        else if (_rs1_data_T_6)	// IDU.scala:131:15, :132:53, :133:36, :134:35
          rhsReg_2 <= io_MEM_to_ID_forward_bits_regWriteData;	// tools.scala:23:33
        else if (_rs1_data_T_8)	// IDU.scala:131:15, :132:53, :133:36, :134:35, :135:35
          rhsReg_2 <= io_WB_to_ID_forward_bits_regWriteData;	// tools.scala:23:33
        else	// IDU.scala:131:15, :132:53, :133:36, :134:35, :135:35
          rhsReg_2 <= _GEN_8;	// Mux.scala:101:16, tools.scala:23:33
      end
      else if (_io_ID_to_BPU_bus_valid_T_4)	// IDU.scala:173:15, :174:15, :175:15, :176:15, Lookup.scala:34:39
        rhsReg_2 <= _ALU_Data1_T_5;	// IDU.scala:176:30, tools.scala:23:33
      else	// IDU.scala:173:15, :174:15, :175:15, :176:15, Lookup.scala:34:39
        rhsReg_2 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
      if (InstInfo_3 == 3'h0)	// IDU.scala:180:15, Lookup.scala:34:39
        rhsReg_3 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
      else if (InstInfo_3 == 3'h1)	// IDU.scala:180:15, :181:15, Lookup.scala:34:39
        rhsReg_3 <= io_IF_to_ID_bus_bits_PC;	// tools.scala:23:33
      else if (_load_use_stall_T_11) begin	// IDU.scala:180:15, :181:15, :182:15, Lookup.scala:34:39
        if (_rs2_data_T)	// IDU.scala:139:15
          rhsReg_3 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
        else if (_rs2_data_T_2)	// IDU.scala:139:15, :140:53
          rhsReg_3 <= io_EX_ALUResult;	// tools.scala:23:33
        else if (_rs2_data_T_4)	// IDU.scala:139:15, :140:53, :141:36
          rhsReg_3 <= io_PMEM_to_ID_forward_bits_ALU_result;	// tools.scala:23:33
        else if (_rs2_data_T_6)	// IDU.scala:139:15, :140:53, :141:36, :142:35
          rhsReg_3 <= io_MEM_to_ID_forward_bits_regWriteData;	// tools.scala:23:33
        else if (_rs2_data_T_8)	// IDU.scala:139:15, :140:53, :141:36, :142:35, :143:35
          rhsReg_3 <= io_WB_to_ID_forward_bits_regWriteData;	// tools.scala:23:33
        else	// IDU.scala:139:15, :140:53, :141:36, :142:35, :143:35
          rhsReg_3 <= _GEN_9;	// Mux.scala:101:16, tools.scala:23:33
      end
      else if (InstInfo_3 == 3'h4) begin	// IDU.scala:180:15, :181:15, :182:15, :183:15, Lookup.scala:34:39
        if (_io_ID_to_BPU_bus_valid_T_3)	// IDU.scala:166:19
          rhsReg_3 <= {_immI_ret_T_2, io_IF_to_ID_bus_bits_Inst[31:20]};	// Bitwise.scala:77:12, Cat.scala:33:92, IDU.scala:104:25, tools.scala:23:33
        else if (_io_ID_to_BPU_bus_valid_T_1)	// IDU.scala:166:19, :167:19
          rhsReg_3 <= {{53{io_IF_to_ID_bus_bits_Inst[31]}}, io_IF_to_ID_bus_bits_Inst[7],
                                                                                io_IF_to_ID_bus_bits_Inst[30:25], io_IF_to_ID_bus_bits_Inst[11:8]};	// Cat.scala:33:92, IDU.scala:107:92, :108:{48,72,90}, tools.scala:23:33
        else if (_regWriteEn_T_3)	// IDU.scala:166:19, :167:19, :168:19
          rhsReg_3 <= {{32{io_IF_to_ID_bus_bits_Inst[31]}}, io_IF_to_ID_bus_bits_Inst[31:12], 12'h0};	// IDU.scala:105:{10,25,39}, tools.scala:9:34, :23:33
        else if (_memWriteEn_T)	// IDU.scala:166:19, :167:19, :168:19, :169:19
          rhsReg_3 <= {{52{io_IF_to_ID_bus_bits_Inst[31]}}, io_IF_to_ID_bus_bits_Inst[31:25],
                                                                                io_IF_to_ID_bus_bits_Inst[11:7]};	// IDU.scala:106:{10,26,54}, tools.scala:9:34, :23:33
        else	// IDU.scala:166:19, :167:19, :168:19, :169:19
          rhsReg_3 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
      end
      else	// IDU.scala:180:15, :181:15, :182:15, :183:15, Lookup.scala:34:39
        rhsReg_3 <= {58'h0, InstInfo_3 == 3'h5 ? io_IF_to_ID_bus_bits_Inst[25:20] : 6'h0};	// IDU.scala:109:21, :184:15, Lookup.scala:34:39, Mux.scala:101:16, tools.scala:23:33
      rhsReg_4 <= io_IF_to_ID_bus_bits_Inst[11:7];	// IDU.scala:106:54, tools.scala:23:33
      rhsReg_5 <= InstInfo_0 == 3'h2 | _io_ID_to_BPU_bus_valid_T_3 | _regWriteEn_T_3 |
                                                _io_ID_to_BPU_bus_valid_T;	// IDU.scala:166:19, :168:19, :187:{29,91,104}, Lookup.scala:34:39, tools.scala:23:33
      rhsReg_6 <= _io_ID_to_BPU_bus_valid_T_3 & InstInfo_1;	// IDU.scala:166:19, :189:41, Lookup.scala:34:39, tools.scala:23:33
      rhsReg_7 <= _memWriteEn_T;	// IDU.scala:169:19, tools.scala:23:33
      if (_GEN_6)	// Lookup.scala:34:39
        rhsReg_8 <= 5'h1;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_9)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h7;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_11)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h8;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_13)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h9;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_15)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h1;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_17)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h6;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_19)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h5;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_21)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h4;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_23)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'hA;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_25)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'hB;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_27)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h11;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_29)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h13;	// Lookup.scala:31:38, tools.scala:23:33
      else if (_InstInfo_T_31)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h15;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_33)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h14;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_35)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h3;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_37)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h5;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_39)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h9;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_41)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h11;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_43)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h2;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_45)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h4;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_47)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h8;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_49)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h10;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_51)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h8;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_53)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h4;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_203)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h2;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_57)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h1;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_59)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h7;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_61)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h2;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_63)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h6;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_65)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h5;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_67)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h4;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_69)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'hA;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_71)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'hB;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_73)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'hC;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_75)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'hD;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_77)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'hE;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_79)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'hF;	// IDU.scala:148:28, tools.scala:23:33
      else if (_InstInfo_T_81)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h10;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_83)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h11;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_85)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h12;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_87)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h13;	// Lookup.scala:31:38, tools.scala:23:33
      else if (_InstInfo_T_89)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h15;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_91)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h14;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_93)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h19;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_95)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h1A;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_97)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h1B;	// Lookup.scala:31:38, tools.scala:23:33
      else if (_InstInfo_T_99)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h1C;	// Lookup.scala:34:39, tools.scala:23:33
      else if (_InstInfo_T_101)	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= 5'h1D;	// Lookup.scala:34:39, tools.scala:23:33
      else	// Lookup.scala:31:38, :34:39
        rhsReg_8 <= _GEN_5;	// Lookup.scala:34:39, tools.scala:23:33
      rhsReg_9 <= {1'h0, InstInfo_1};	// IDU.scala:87:21, Lookup.scala:34:39, tools.scala:23:33
      if (_rs1_data_T)	// IDU.scala:131:15
        rhsReg_10 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
      else if (_rs1_data_T_2)	// IDU.scala:131:15, :132:53
        rhsReg_10 <= io_EX_ALUResult;	// tools.scala:23:33
      else if (_rs1_data_T_4)	// IDU.scala:131:15, :132:53, :133:36
        rhsReg_10 <= io_PMEM_to_ID_forward_bits_ALU_result;	// tools.scala:23:33
      else if (_rs1_data_T_6)	// IDU.scala:131:15, :132:53, :133:36, :134:35
        rhsReg_10 <= io_MEM_to_ID_forward_bits_regWriteData;	// tools.scala:23:33
      else if (_rs1_data_T_8)	// IDU.scala:131:15, :132:53, :133:36, :134:35, :135:35
        rhsReg_10 <= io_WB_to_ID_forward_bits_regWriteData;	// tools.scala:23:33
      else	// IDU.scala:131:15, :132:53, :133:36, :134:35, :135:35
        rhsReg_10 <= _GEN_8;	// Mux.scala:101:16, tools.scala:23:33
      if (_rs2_data_T)	// IDU.scala:139:15
        rhsReg_12 <= 64'h0;	// IDU.scala:114:30, tools.scala:23:33
      else if (_rs2_data_T_2)	// IDU.scala:139:15, :140:53
        rhsReg_12 <= io_EX_ALUResult;	// tools.scala:23:33
      else if (_rs2_data_T_4)	// IDU.scala:139:15, :140:53, :141:36
        rhsReg_12 <= io_PMEM_to_ID_forward_bits_ALU_result;	// tools.scala:23:33
      else if (_rs2_data_T_6)	// IDU.scala:139:15, :140:53, :141:36, :142:35
        rhsReg_12 <= io_MEM_to_ID_forward_bits_regWriteData;	// tools.scala:23:33
      else if (_rs2_data_T_8)	// IDU.scala:139:15, :140:53, :141:36, :142:35, :143:35
        rhsReg_12 <= io_WB_to_ID_forward_bits_regWriteData;	// tools.scala:23:33
      else	// IDU.scala:139:15, :140:53, :141:36, :142:35, :143:35
        rhsReg_12 <= _GEN_9;	// Mux.scala:101:16, tools.scala:23:33
      rhsReg_14 <= io_IF_to_ID_bus_valid & ~_load_use_stall_T_22;	// IDU.scala:209:{79,81}, :223:65, tools.scala:23:33
    end
  end // always @(posedge)
  `ifndef SYNTHESIS	// <stdin>:984:10
    `ifdef FIRRTL_BEFORE_INITIAL	// <stdin>:984:10
      `FIRRTL_BEFORE_INITIAL	// <stdin>:984:10
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_0;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_1;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_2;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_3;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_4;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_5;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_6;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_7;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_8;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_9;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_10;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_11;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_12;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_13;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_14;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_15;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_16;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_17;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_18;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_19;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_20;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_21;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_22;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_23;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_24;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_25;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_26;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_27;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_28;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_29;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_30;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_31;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_32;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_33;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_34;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_35;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_36;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_37;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_38;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_39;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_40;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_41;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_42;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_43;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_44;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_45;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_46;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_47;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_48;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_49;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_50;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_51;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_52;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_53;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_54;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_55;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_56;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_57;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_58;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_59;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_60;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_61;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_62;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_63;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_64;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_65;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_66;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_67;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_68;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_69;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_70;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_71;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_72;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_73;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_74;	// <stdin>:984:10
      automatic logic [31:0] _RANDOM_75;	// <stdin>:984:10
      `ifdef INIT_RANDOM_PROLOG_	// <stdin>:984:10
        `INIT_RANDOM_PROLOG_	// <stdin>:984:10
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// <stdin>:984:10
        _RANDOM_0 = `RANDOM;	// <stdin>:984:10
        _RANDOM_1 = `RANDOM;	// <stdin>:984:10
        _RANDOM_2 = `RANDOM;	// <stdin>:984:10
        _RANDOM_3 = `RANDOM;	// <stdin>:984:10
        _RANDOM_4 = `RANDOM;	// <stdin>:984:10
        _RANDOM_5 = `RANDOM;	// <stdin>:984:10
        _RANDOM_6 = `RANDOM;	// <stdin>:984:10
        _RANDOM_7 = `RANDOM;	// <stdin>:984:10
        _RANDOM_8 = `RANDOM;	// <stdin>:984:10
        _RANDOM_9 = `RANDOM;	// <stdin>:984:10
        _RANDOM_10 = `RANDOM;	// <stdin>:984:10
        _RANDOM_11 = `RANDOM;	// <stdin>:984:10
        _RANDOM_12 = `RANDOM;	// <stdin>:984:10
        _RANDOM_13 = `RANDOM;	// <stdin>:984:10
        _RANDOM_14 = `RANDOM;	// <stdin>:984:10
        _RANDOM_15 = `RANDOM;	// <stdin>:984:10
        _RANDOM_16 = `RANDOM;	// <stdin>:984:10
        _RANDOM_17 = `RANDOM;	// <stdin>:984:10
        _RANDOM_18 = `RANDOM;	// <stdin>:984:10
        _RANDOM_19 = `RANDOM;	// <stdin>:984:10
        _RANDOM_20 = `RANDOM;	// <stdin>:984:10
        _RANDOM_21 = `RANDOM;	// <stdin>:984:10
        _RANDOM_22 = `RANDOM;	// <stdin>:984:10
        _RANDOM_23 = `RANDOM;	// <stdin>:984:10
        _RANDOM_24 = `RANDOM;	// <stdin>:984:10
        _RANDOM_25 = `RANDOM;	// <stdin>:984:10
        _RANDOM_26 = `RANDOM;	// <stdin>:984:10
        _RANDOM_27 = `RANDOM;	// <stdin>:984:10
        _RANDOM_28 = `RANDOM;	// <stdin>:984:10
        _RANDOM_29 = `RANDOM;	// <stdin>:984:10
        _RANDOM_30 = `RANDOM;	// <stdin>:984:10
        _RANDOM_31 = `RANDOM;	// <stdin>:984:10
        _RANDOM_32 = `RANDOM;	// <stdin>:984:10
        _RANDOM_33 = `RANDOM;	// <stdin>:984:10
        _RANDOM_34 = `RANDOM;	// <stdin>:984:10
        _RANDOM_35 = `RANDOM;	// <stdin>:984:10
        _RANDOM_36 = `RANDOM;	// <stdin>:984:10
        _RANDOM_37 = `RANDOM;	// <stdin>:984:10
        _RANDOM_38 = `RANDOM;	// <stdin>:984:10
        _RANDOM_39 = `RANDOM;	// <stdin>:984:10
        _RANDOM_40 = `RANDOM;	// <stdin>:984:10
        _RANDOM_41 = `RANDOM;	// <stdin>:984:10
        _RANDOM_42 = `RANDOM;	// <stdin>:984:10
        _RANDOM_43 = `RANDOM;	// <stdin>:984:10
        _RANDOM_44 = `RANDOM;	// <stdin>:984:10
        _RANDOM_45 = `RANDOM;	// <stdin>:984:10
        _RANDOM_46 = `RANDOM;	// <stdin>:984:10
        _RANDOM_47 = `RANDOM;	// <stdin>:984:10
        _RANDOM_48 = `RANDOM;	// <stdin>:984:10
        _RANDOM_49 = `RANDOM;	// <stdin>:984:10
        _RANDOM_50 = `RANDOM;	// <stdin>:984:10
        _RANDOM_51 = `RANDOM;	// <stdin>:984:10
        _RANDOM_52 = `RANDOM;	// <stdin>:984:10
        _RANDOM_53 = `RANDOM;	// <stdin>:984:10
        _RANDOM_54 = `RANDOM;	// <stdin>:984:10
        _RANDOM_55 = `RANDOM;	// <stdin>:984:10
        _RANDOM_56 = `RANDOM;	// <stdin>:984:10
        _RANDOM_57 = `RANDOM;	// <stdin>:984:10
        _RANDOM_58 = `RANDOM;	// <stdin>:984:10
        _RANDOM_59 = `RANDOM;	// <stdin>:984:10
        _RANDOM_60 = `RANDOM;	// <stdin>:984:10
        _RANDOM_61 = `RANDOM;	// <stdin>:984:10
        _RANDOM_62 = `RANDOM;	// <stdin>:984:10
        _RANDOM_63 = `RANDOM;	// <stdin>:984:10
        _RANDOM_64 = `RANDOM;	// <stdin>:984:10
        _RANDOM_65 = `RANDOM;	// <stdin>:984:10
        _RANDOM_66 = `RANDOM;	// <stdin>:984:10
        _RANDOM_67 = `RANDOM;	// <stdin>:984:10
        _RANDOM_68 = `RANDOM;	// <stdin>:984:10
        _RANDOM_69 = `RANDOM;	// <stdin>:984:10
        _RANDOM_70 = `RANDOM;	// <stdin>:984:10
        _RANDOM_71 = `RANDOM;	// <stdin>:984:10
        _RANDOM_72 = `RANDOM;	// <stdin>:984:10
        _RANDOM_73 = `RANDOM;	// <stdin>:984:10
        _RANDOM_74 = `RANDOM;	// <stdin>:984:10
        _RANDOM_75 = `RANDOM;	// <stdin>:984:10
        GPR_0 = {_RANDOM_0, _RANDOM_1};	// IDU.scala:114:22
        GPR_1 = {_RANDOM_2, _RANDOM_3};	// IDU.scala:114:22
        GPR_2 = {_RANDOM_4, _RANDOM_5};	// IDU.scala:114:22
        GPR_3 = {_RANDOM_6, _RANDOM_7};	// IDU.scala:114:22
        GPR_4 = {_RANDOM_8, _RANDOM_9};	// IDU.scala:114:22
        GPR_5 = {_RANDOM_10, _RANDOM_11};	// IDU.scala:114:22
        GPR_6 = {_RANDOM_12, _RANDOM_13};	// IDU.scala:114:22
        GPR_7 = {_RANDOM_14, _RANDOM_15};	// IDU.scala:114:22
        GPR_8 = {_RANDOM_16, _RANDOM_17};	// IDU.scala:114:22
        GPR_9 = {_RANDOM_18, _RANDOM_19};	// IDU.scala:114:22
        GPR_10 = {_RANDOM_20, _RANDOM_21};	// IDU.scala:114:22
        GPR_11 = {_RANDOM_22, _RANDOM_23};	// IDU.scala:114:22
        GPR_12 = {_RANDOM_24, _RANDOM_25};	// IDU.scala:114:22
        GPR_13 = {_RANDOM_26, _RANDOM_27};	// IDU.scala:114:22
        GPR_14 = {_RANDOM_28, _RANDOM_29};	// IDU.scala:114:22
        GPR_15 = {_RANDOM_30, _RANDOM_31};	// IDU.scala:114:22
        GPR_16 = {_RANDOM_32, _RANDOM_33};	// IDU.scala:114:22
        GPR_17 = {_RANDOM_34, _RANDOM_35};	// IDU.scala:114:22
        GPR_18 = {_RANDOM_36, _RANDOM_37};	// IDU.scala:114:22
        GPR_19 = {_RANDOM_38, _RANDOM_39};	// IDU.scala:114:22
        GPR_20 = {_RANDOM_40, _RANDOM_41};	// IDU.scala:114:22
        GPR_21 = {_RANDOM_42, _RANDOM_43};	// IDU.scala:114:22
        GPR_22 = {_RANDOM_44, _RANDOM_45};	// IDU.scala:114:22
        GPR_23 = {_RANDOM_46, _RANDOM_47};	// IDU.scala:114:22
        GPR_24 = {_RANDOM_48, _RANDOM_49};	// IDU.scala:114:22
        GPR_25 = {_RANDOM_50, _RANDOM_51};	// IDU.scala:114:22
        GPR_26 = {_RANDOM_52, _RANDOM_53};	// IDU.scala:114:22
        GPR_27 = {_RANDOM_54, _RANDOM_55};	// IDU.scala:114:22
        GPR_28 = {_RANDOM_56, _RANDOM_57};	// IDU.scala:114:22
        GPR_29 = {_RANDOM_58, _RANDOM_59};	// IDU.scala:114:22
        GPR_30 = {_RANDOM_60, _RANDOM_61};	// IDU.scala:114:22
        GPR_31 = {_RANDOM_62, _RANDOM_63};	// IDU.scala:114:22
        rhsReg = {_RANDOM_64, _RANDOM_65};	// tools.scala:23:33
        rhsReg_1 = _RANDOM_66;	// tools.scala:23:33
        rhsReg_2 = {_RANDOM_67, _RANDOM_68};	// tools.scala:23:33
        rhsReg_3 = {_RANDOM_69, _RANDOM_70};	// tools.scala:23:33
        rhsReg_4 = _RANDOM_71[4:0];	// tools.scala:23:33
        rhsReg_5 = _RANDOM_71[5];	// tools.scala:23:33
        rhsReg_6 = _RANDOM_71[6];	// tools.scala:23:33
        rhsReg_7 = _RANDOM_71[7];	// tools.scala:23:33
        rhsReg_8 = _RANDOM_71[12:8];	// tools.scala:23:33
        rhsReg_9 = _RANDOM_71[14:13];	// tools.scala:23:33
        rhsReg_10 = {_RANDOM_71[31:15], _RANDOM_72, _RANDOM_73[14:0]};	// tools.scala:23:33
        rhsReg_12 = {_RANDOM_73[31:20], _RANDOM_74, _RANDOM_75[19:0]};	// tools.scala:23:33
        rhsReg_14 = _RANDOM_75[25];	// tools.scala:23:33
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// <stdin>:984:10
      `FIRRTL_AFTER_INITIAL	// <stdin>:984:10
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_IF_to_ID_bus_ready = ~_load_use_stall_T_22;	// <stdin>:984:10, IDU.scala:209:81, :223:65
  assign io_ID_to_EX_bus_valid = rhsReg_14;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_EX_bus_bits_ALU_Data1 = rhsReg_2;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_EX_bus_bits_ALU_Data2 = rhsReg_3;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_EX_bus_bits_futype = rhsReg_9[0];	// <stdin>:984:10, tools.scala:23:33, :25:17
  assign io_ID_to_EX_bus_bits_optype = rhsReg_8;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_EX_bus_bits_rs1_data = rhsReg_10;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_EX_bus_bits_rs2_data = rhsReg_12;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_EX_bus_bits_regWriteID = rhsReg_4;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_EX_bus_bits_regWriteEn = rhsReg_5;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_EX_bus_bits_memWriteEn = rhsReg_7;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_EX_bus_bits_memReadEn = rhsReg_6;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_EX_bus_bits_PC = rhsReg;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_EX_bus_bits_Inst = rhsReg_1;	// <stdin>:984:10, tools.scala:23:33
  assign io_ID_to_BPU_bus_valid = io_IF_to_ID_bus_valid & (_io_ID_to_BPU_bus_valid_T | _io_ID_to_BPU_bus_valid_T_1 |
                _io_ID_to_BPU_bus_valid_T_3 & _io_ID_to_BPU_bus_valid_T_4) & ~_load_use_stall_T_22;	// <stdin>:984:10, IDU.scala:166:19, :167:19, :176:15, :187:104, :209:81, :223:65, :260:{108,133,152}
  assign io_ID_to_BPU_bus_bits_PC = io_IF_to_ID_bus_bits_PC;	// <stdin>:984:10
  assign io_ID_to_BPU_bus_bits_taken = _io_ID_to_BPU_bus_valid_T | (_io_ID_to_BPU_bus_valid_T_1 ? _GEN_10 :
                _io_ID_to_BPU_bus_valid_T_3 & _io_ID_to_BPU_bus_valid_T_4);	// <stdin>:984:10, IDU.scala:166:19, :167:19, :176:15, :187:104, :234:19, :235:34, :244:15, :245:21, :246:31, :247:31, :248:31
  assign io_ID_to_BPU_bus_bits_br_target = _io_ID_to_BPU_bus_valid_T ? io_IF_to_ID_bus_bits_PC + {{44{io_IF_to_ID_bus_bits_Inst[31]}},
                io_IF_to_ID_bus_bits_Inst[19:12], io_IF_to_ID_bus_bits_Inst[20],
                io_IF_to_ID_bus_bits_Inst[30:21], 1'h0} : _io_ID_to_BPU_bus_valid_T_1 & _GEN_10 ?
                io_IF_to_ID_bus_bits_PC + {{52{io_IF_to_ID_bus_bits_Inst[31]}},
                io_IF_to_ID_bus_bits_Inst[7], io_IF_to_ID_bus_bits_Inst[30:25],
                io_IF_to_ID_bus_bits_Inst[11:8], 1'h0} : _io_ID_to_BPU_bus_valid_T_3 &
                _io_ID_to_BPU_bus_valid_T_4 ? _rs1_data_T_13 + {_immI_ret_T_2,
                io_IF_to_ID_bus_bits_Inst[31:20]} : {32'h0, _ALU_Data1_T_5[31:0]};	// <stdin>:984:10, Bitwise.scala:77:12, IDU.scala:104:25, :107:{25,44,66,92}, :108:{48,72,90}, :166:19, :167:19, :176:{15,30}, :187:104, :234:19, :235:34, :252:13, :254:37, :255:{31,50}, :256:{31,58}, Lookup.scala:34:39, Mux.scala:101:16
  assign io_ID_to_BPU_bus_bits_load_use_stall = _load_use_stall_T_22;	// <stdin>:984:10, IDU.scala:223:65
  assign io_ID_stall = _load_use_stall_T_22;	// <stdin>:984:10, IDU.scala:223:65
  assign io_ID_GPR_0 = GPR_0;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_1 = GPR_1;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_2 = GPR_2;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_3 = GPR_3;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_4 = GPR_4;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_5 = GPR_5;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_6 = GPR_6;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_7 = GPR_7;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_8 = GPR_8;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_9 = GPR_9;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_10 = GPR_10;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_11 = GPR_11;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_12 = GPR_12;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_13 = GPR_13;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_14 = GPR_14;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_15 = GPR_15;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_16 = GPR_16;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_17 = GPR_17;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_18 = GPR_18;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_19 = GPR_19;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_20 = GPR_20;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_21 = GPR_21;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_22 = GPR_22;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_23 = GPR_23;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_24 = GPR_24;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_25 = GPR_25;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_26 = GPR_26;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_27 = GPR_27;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_28 = GPR_28;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_29 = GPR_29;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_30 = GPR_30;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_GPR_31 = GPR_31;	// <stdin>:984:10, IDU.scala:114:22
  assign io_ID_unknown_inst = InstInfo_0 == 3'h0 & io_IF_to_ID_bus_valid;	// <stdin>:984:10, IDU.scala:216:{39,47}, Lookup.scala:34:39
endmodule

module EXU(	// <stdin>:1798:10
  input         clock,
                reset,
                io_ID_to_EX_bus_valid,
  input  [63:0] io_ID_to_EX_bus_bits_ALU_Data1,
                io_ID_to_EX_bus_bits_ALU_Data2,
  input         io_ID_to_EX_bus_bits_futype,
  input  [4:0]  io_ID_to_EX_bus_bits_optype,
  input  [63:0] io_ID_to_EX_bus_bits_rs2_data,
  input  [4:0]  io_ID_to_EX_bus_bits_regWriteID,
  input         io_ID_to_EX_bus_bits_regWriteEn,
                io_ID_to_EX_bus_bits_memWriteEn,
                io_ID_to_EX_bus_bits_memReadEn,
  input  [63:0] io_ID_to_EX_bus_bits_PC,
  input  [31:0] io_ID_to_EX_bus_bits_Inst,
  output        io_EX_to_MEM_bus_valid,
  output [31:0] io_EX_to_MEM_bus_bits_Inst,
  output [63:0] io_EX_to_MEM_bus_bits_PC,
                io_EX_to_MEM_bus_bits_ALU_result,
                io_EX_to_MEM_bus_bits_memWriteData,
  output        io_EX_to_MEM_bus_bits_memWriteEn,
                io_EX_to_MEM_bus_bits_memReadEn,
  output [4:0]  io_EX_to_MEM_bus_bits_lsutype,
                io_EX_to_MEM_bus_bits_regWriteID,
  output        io_EX_to_MEM_bus_bits_regWriteEn,
  output [63:0] io_EX_ALUResult_Pass);

  reg  [63:0]       rhsReg;	// tools.scala:15:29
  reg  [31:0]       rhsReg_1;	// tools.scala:15:29
  reg               rhsReg_2;	// tools.scala:15:29
  reg  [4:0]        rhsReg_3;	// tools.scala:15:29
  reg               rhsReg_4;	// tools.scala:15:29
  reg               rhsReg_5;	// tools.scala:15:29
  reg  [63:0]       rhsReg_6;	// tools.scala:15:29
  reg  [63:0]       rhsReg_7;	// tools.scala:15:29
  reg  [4:0]        rhsReg_8;	// tools.scala:15:29
  reg               rhsReg_9;	// tools.scala:15:29
  wire [63:0]       _ALU_result_T_4 = io_ID_to_EX_bus_bits_ALU_Data1 + io_ID_to_EX_bus_bits_ALU_Data2;	// EXU.scala:85:69
  wire [63:0]       _ALU_result_T_7 = io_ID_to_EX_bus_bits_ALU_Data1 - io_ID_to_EX_bus_bits_ALU_Data2;	// EXU.scala:86:43
  wire [63:0]       _ALU_result_T_69 = io_ID_to_EX_bus_bits_ALU_Data1 & io_ID_to_EX_bus_bits_ALU_Data2;	// EXU.scala:87:42
  wire [63:0]       _ALU_result_T_67 = io_ID_to_EX_bus_bits_ALU_Data1 | io_ID_to_EX_bus_bits_ALU_Data2;	// EXU.scala:88:42
  wire [63:0]       _ALU_result_T_65 = io_ID_to_EX_bus_bits_ALU_Data1 ^ io_ID_to_EX_bus_bits_ALU_Data2;	// EXU.scala:89:42
  wire [126:0]      _ALU_result_T_15 = {63'h0, io_ID_to_EX_bus_bits_ALU_Data1} << io_ID_to_EX_bus_bits_ALU_Data2[5:0];	// EXU.scala:62:23, :90:41, tools.scala:15:29
  wire [63:0]       _GEN = {58'h0, io_ID_to_EX_bus_bits_ALU_Data2[5:0]};	// EXU.scala:62:23, :91:41
  wire [63:0]       _GEN_0 = io_ID_to_EX_bus_bits_ALU_Data1 * io_ID_to_EX_bus_bits_ALU_Data2;	// EXU.scala:95:41
  wire [64:0]       _GEN_1 = {io_ID_to_EX_bus_bits_ALU_Data1[63], io_ID_to_EX_bus_bits_ALU_Data1};	// EXU.scala:96:49
  wire [64:0]       _GEN_2 = {io_ID_to_EX_bus_bits_ALU_Data2[63], io_ID_to_EX_bus_bits_ALU_Data2};	// EXU.scala:96:49
  wire [64:0]       _ALU_result_T_33 = $signed(_GEN_1) / $signed(_GEN_2);	// EXU.scala:96:49
  wire [63:0]       _ALU_result_T_78 = io_ID_to_EX_bus_bits_ALU_Data1 / io_ID_to_EX_bus_bits_ALU_Data2;	// EXU.scala:97:41
  wire [63:0]       _ALU_result_T_85 = io_ID_to_EX_bus_bits_ALU_Data1 % io_ID_to_EX_bus_bits_ALU_Data2;	// EXU.scala:99:41
  wire [62:0]       _ALU_result_T_53 = {31'h0, io_ID_to_EX_bus_bits_ALU_Data1[31:0]} << io_ID_to_EX_bus_bits_ALU_Data2[4:0];	// EXU.scala:102:{46,54,62}, tools.scala:15:29
  wire [31:0]       _GEN_3 = {27'h0, io_ID_to_EX_bus_bits_ALU_Data2[4:0]};	// EXU.scala:102:62, :103:54
  wire [31:0]       _ALU_result_ret_T_18 = io_ID_to_EX_bus_bits_ALU_Data1[31:0] >> _GEN_3;	// EXU.scala:102:46, :103:54
  wire [31:0]       _ALU_result_T_62 = $signed($signed(io_ID_to_EX_bus_bits_ALU_Data1[31:0]) >>> _GEN_3);	// EXU.scala:102:46, :103:54, :104:62
  wire [64:0]       _ALU_result_T_75 = $signed(_GEN_1) / $signed(_GEN_2);	// EXU.scala:96:49, :109:55
  wire [63:0]       _ALU_result_T_82 = $signed(io_ID_to_EX_bus_bits_ALU_Data1) % $signed(io_ID_to_EX_bus_bits_ALU_Data2);	// EXU.scala:111:55
  wire [31:0][63:0] _GEN_4 = {{64'h0}, {64'h0}, {{{32{_ALU_result_T_85[31]}}, _ALU_result_T_85[31:0]}},
                {{{32{_ALU_result_T_82[31]}}, _ALU_result_T_82[31:0]}}, {{{32{_ALU_result_T_78[31]}},
                _ALU_result_T_78[31:0]}}, {{{32{_ALU_result_T_75[31]}}, _ALU_result_T_75[31:0]}},
                {{{32{_GEN_0[31]}}, _GEN_0[31:0]}}, {{{32{_ALU_result_T_69[31]}}, _ALU_result_T_69[31:0]}},
                {{{32{_ALU_result_T_67[31]}}, _ALU_result_T_67[31:0]}}, {{{32{_ALU_result_T_65[31]}},
                _ALU_result_T_65[31:0]}}, {{{32{_ALU_result_ret_T_18[31]}}, _ALU_result_ret_T_18}},
                {{{32{_ALU_result_T_62[31]}}, _ALU_result_T_62}}, {{{32{_ALU_result_T_53[31]}},
                _ALU_result_T_53[31:0]}}, {{{32{_ALU_result_T_7[31]}}, _ALU_result_T_7[31:0]}},
                {{{32{_ALU_result_T_4[31]}}, _ALU_result_T_4[31:0]}}, {_ALU_result_T_85},
                {$signed(io_ID_to_EX_bus_bits_ALU_Data1) % $signed(io_ID_to_EX_bus_bits_ALU_Data2)},
                {_ALU_result_T_78}, {_ALU_result_T_33[63:0]}, {_GEN_0}, {{63'h0,
                io_ID_to_EX_bus_bits_ALU_Data1 < io_ID_to_EX_bus_bits_ALU_Data2}}, {{63'h0,
                $signed(io_ID_to_EX_bus_bits_ALU_Data1) < $signed(io_ID_to_EX_bus_bits_ALU_Data2)}},
                {$signed($signed(io_ID_to_EX_bus_bits_ALU_Data1) >>> _GEN)},
                {io_ID_to_EX_bus_bits_ALU_Data1 >> _GEN}, {_ALU_result_T_15[63:0]}, {_ALU_result_T_65},
                {_ALU_result_T_67}, {_ALU_result_T_69}, {64'h0}, {_ALU_result_T_7}, {64'h0}, {64'h0}};	// Bitwise.scala:77:12, Cat.scala:33:92, EXU.scala:85:69, :86:{18,43}, :87:{17,42}, :88:{17,42}, :89:{17,42}, :90:{17,41}, :91:{17,41}, :92:{17,49}, :93:{17,42}, :94:{17,49}, :95:{17,41}, :96:{17,49}, :97:{17,41}, :98:{17,49}, :99:{17,41}, :100:17, :101:17, :102:{17,54}, :103:{17,54}, :104:{17,62}, :105:17, :106:17, :107:17, :108:17, :109:{17,55}, :110:17, :111:{17,55}, :112:17, Mux.scala:101:16, tools.scala:9:{34,45}, :15:29
  wire [63:0]       _GEN_5 = io_ID_to_EX_bus_bits_optype == 5'h1 | io_ID_to_EX_bus_bits_futype ? _ALU_result_T_4 :
                _GEN_4[io_ID_to_EX_bus_bits_optype];	// EXU.scala:85:{18,31,69}, :86:18, :87:17, :88:17, :89:17, :90:17, :91:17, :92:17, :93:17, :94:17, :95:17, :96:17, :97:17, :98:17, :99:17, :100:17, :101:17, :102:17, :103:17, :104:17, :105:17, :106:17, :107:17, :108:17, :109:17, :110:17, :111:17, :112:17, Mux.scala:101:16
  always @(posedge clock) begin
    if (reset) begin
      rhsReg <= 64'h0;	// Mux.scala:101:16, tools.scala:15:29
      rhsReg_1 <= 32'h0;	// Bitwise.scala:77:12, tools.scala:15:29
      rhsReg_2 <= 1'h0;	// EXU.scala:58:22, tools.scala:15:29
      rhsReg_3 <= 5'h0;	// EXU.scala:58:22, tools.scala:15:29
      rhsReg_4 <= 1'h0;	// EXU.scala:58:22, tools.scala:15:29
      rhsReg_5 <= 1'h0;	// EXU.scala:58:22, tools.scala:15:29
      rhsReg_6 <= 64'h0;	// Mux.scala:101:16, tools.scala:15:29
      rhsReg_7 <= 64'h0;	// Mux.scala:101:16, tools.scala:15:29
      rhsReg_8 <= 5'h0;	// EXU.scala:58:22, tools.scala:15:29
      rhsReg_9 <= 1'h0;	// EXU.scala:58:22, tools.scala:15:29
    end
    else begin
      rhsReg <= io_ID_to_EX_bus_bits_PC;	// tools.scala:15:29
      rhsReg_1 <= io_ID_to_EX_bus_bits_Inst;	// tools.scala:15:29
      rhsReg_2 <= io_ID_to_EX_bus_bits_regWriteEn;	// tools.scala:15:29
      rhsReg_3 <= io_ID_to_EX_bus_bits_regWriteID;	// tools.scala:15:29
      rhsReg_4 <= io_ID_to_EX_bus_bits_memWriteEn;	// tools.scala:15:29
      rhsReg_5 <= io_ID_to_EX_bus_bits_memReadEn;	// tools.scala:15:29
      rhsReg_6 <= io_ID_to_EX_bus_bits_rs2_data;	// tools.scala:15:29
      rhsReg_7 <= _GEN_5;	// Mux.scala:101:16, tools.scala:15:29
      if (io_ID_to_EX_bus_bits_futype)
        rhsReg_8 <= io_ID_to_EX_bus_bits_optype;	// tools.scala:15:29
      else
        rhsReg_8 <= 5'h0;	// EXU.scala:58:22, tools.scala:15:29
      rhsReg_9 <= io_ID_to_EX_bus_valid;	// tools.scala:15:29
    end
  end // always @(posedge)
  `ifndef SYNTHESIS	// <stdin>:1798:10
    `ifdef FIRRTL_BEFORE_INITIAL	// <stdin>:1798:10
      `FIRRTL_BEFORE_INITIAL	// <stdin>:1798:10
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// <stdin>:1798:10
      automatic logic [31:0] _RANDOM_0;	// <stdin>:1798:10
      automatic logic [31:0] _RANDOM_1;	// <stdin>:1798:10
      automatic logic [31:0] _RANDOM_2;	// <stdin>:1798:10
      automatic logic [31:0] _RANDOM_3;	// <stdin>:1798:10
      automatic logic [31:0] _RANDOM_4;	// <stdin>:1798:10
      automatic logic [31:0] _RANDOM_5;	// <stdin>:1798:10
      automatic logic [31:0] _RANDOM_6;	// <stdin>:1798:10
      automatic logic [31:0] _RANDOM_7;	// <stdin>:1798:10
      `ifdef INIT_RANDOM_PROLOG_	// <stdin>:1798:10
        `INIT_RANDOM_PROLOG_	// <stdin>:1798:10
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// <stdin>:1798:10
        _RANDOM_0 = `RANDOM;	// <stdin>:1798:10
        _RANDOM_1 = `RANDOM;	// <stdin>:1798:10
        _RANDOM_2 = `RANDOM;	// <stdin>:1798:10
        _RANDOM_3 = `RANDOM;	// <stdin>:1798:10
        _RANDOM_4 = `RANDOM;	// <stdin>:1798:10
        _RANDOM_5 = `RANDOM;	// <stdin>:1798:10
        _RANDOM_6 = `RANDOM;	// <stdin>:1798:10
        _RANDOM_7 = `RANDOM;	// <stdin>:1798:10
        rhsReg = {_RANDOM_0, _RANDOM_1};	// tools.scala:15:29
        rhsReg_1 = _RANDOM_2;	// tools.scala:15:29
        rhsReg_2 = _RANDOM_3[0];	// tools.scala:15:29
        rhsReg_3 = _RANDOM_3[5:1];	// tools.scala:15:29
        rhsReg_4 = _RANDOM_3[6];	// tools.scala:15:29
        rhsReg_5 = _RANDOM_3[7];	// tools.scala:15:29
        rhsReg_6 = {_RANDOM_3[31:8], _RANDOM_4, _RANDOM_5[7:0]};	// tools.scala:15:29
        rhsReg_7 = {_RANDOM_5[31:8], _RANDOM_6, _RANDOM_7[7:0]};	// tools.scala:15:29
        rhsReg_8 = _RANDOM_7[12:8];	// tools.scala:15:29
        rhsReg_9 = _RANDOM_7[13];	// tools.scala:15:29
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// <stdin>:1798:10
      `FIRRTL_AFTER_INITIAL	// <stdin>:1798:10
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_EX_to_MEM_bus_valid = rhsReg_9;	// <stdin>:1798:10, tools.scala:15:29
  assign io_EX_to_MEM_bus_bits_Inst = rhsReg_1;	// <stdin>:1798:10, tools.scala:15:29
  assign io_EX_to_MEM_bus_bits_PC = rhsReg;	// <stdin>:1798:10, tools.scala:15:29
  assign io_EX_to_MEM_bus_bits_ALU_result = rhsReg_7;	// <stdin>:1798:10, tools.scala:15:29
  assign io_EX_to_MEM_bus_bits_memWriteData = rhsReg_6;	// <stdin>:1798:10, tools.scala:15:29
  assign io_EX_to_MEM_bus_bits_memWriteEn = rhsReg_4;	// <stdin>:1798:10, tools.scala:15:29
  assign io_EX_to_MEM_bus_bits_memReadEn = rhsReg_5;	// <stdin>:1798:10, tools.scala:15:29
  assign io_EX_to_MEM_bus_bits_lsutype = rhsReg_8;	// <stdin>:1798:10, tools.scala:15:29
  assign io_EX_to_MEM_bus_bits_regWriteID = rhsReg_3;	// <stdin>:1798:10, tools.scala:15:29
  assign io_EX_to_MEM_bus_bits_regWriteEn = rhsReg_2;	// <stdin>:1798:10, tools.scala:15:29
  assign io_EX_ALUResult_Pass = _GEN_5;	// <stdin>:1798:10, Mux.scala:101:16
endmodule

module MEM_pre_stage(	// <stdin>:2065:10
  input         clock,
                reset,
                io_EX_to_MEM_bus_valid,
  input  [31:0] io_EX_to_MEM_bus_bits_Inst,
  input  [63:0] io_EX_to_MEM_bus_bits_PC,
                io_EX_to_MEM_bus_bits_ALU_result,
                io_EX_to_MEM_bus_bits_memWriteData,
  input         io_EX_to_MEM_bus_bits_memWriteEn,
                io_EX_to_MEM_bus_bits_memReadEn,
  input  [4:0]  io_EX_to_MEM_bus_bits_lsutype,
                io_EX_to_MEM_bus_bits_regWriteID,
  input         io_EX_to_MEM_bus_bits_regWriteEn,
  input  [63:0] axi_lite_readData_bits_data,
  output        io_PMEM_to_MEM_bus_valid,
  output [63:0] io_PMEM_to_MEM_bus_bits_ALU_result,
  output        io_PMEM_to_MEM_bus_bits_regWriteEn,
  output [4:0]  io_PMEM_to_MEM_bus_bits_regWriteID,
  output        io_PMEM_to_MEM_bus_bits_memReadEn,
  output [63:0] io_PMEM_to_MEM_bus_bits_PC,
  output [31:0] io_PMEM_to_MEM_bus_bits_Inst,
  output [63:0] io_PMEM_to_ID_forward_bits_ALU_result,
  output        io_PMEM_to_ID_forward_bits_regWriteEn,
  output [4:0]  io_PMEM_to_ID_forward_bits_regWriteID,
  output        io_PMEM_to_ID_forward_bits_memReadEn,
  output [63:0] io_memReadData,
  output        axi_lite_writeAddr_valid,
  output [31:0] axi_lite_writeAddr_bits_addr,
  output        axi_lite_writeData_valid,
  output [63:0] axi_lite_writeData_bits_data,
  output [7:0]  axi_lite_writeData_bits_strb,
  output        axi_lite_writeResp_ready,
                axi_lite_readAddr_valid,
  output [31:0] axi_lite_readAddr_bits_addr,
  output        axi_lite_readData_ready,
                axi_req_valid);

  reg [4:0]  rhsReg_8;	// tools.scala:15:29
  reg [63:0] rhsReg;	// tools.scala:15:29
  reg [31:0] rhsReg_1;	// tools.scala:15:29
  reg [63:0] rhsReg_2;	// tools.scala:15:29
  reg        rhsReg_3;	// tools.scala:15:29
  reg [4:0]  rhsReg_4;	// tools.scala:15:29
  reg        rhsReg_5;	// tools.scala:15:29
  reg        rhsReg_9;	// tools.scala:15:29
  always @(posedge clock) begin
    if (reset) begin
      rhsReg <= 64'h0;	// PMEM.scala:58:17, tools.scala:15:29
      rhsReg_1 <= 32'h0;	// Bitwise.scala:77:12, tools.scala:15:29
      rhsReg_2 <= 64'h0;	// PMEM.scala:58:17, tools.scala:15:29
      rhsReg_3 <= 1'h0;	// PMEM.scala:47:34, tools.scala:15:29
      rhsReg_4 <= 5'h0;	// PMEM.scala:47:34, tools.scala:15:29
      rhsReg_5 <= 1'h0;	// PMEM.scala:47:34, tools.scala:15:29
      rhsReg_8 <= 5'h0;	// PMEM.scala:47:34, tools.scala:15:29
      rhsReg_9 <= 1'h0;	// PMEM.scala:47:34, tools.scala:15:29
    end
    else begin
      rhsReg <= io_EX_to_MEM_bus_bits_PC;	// tools.scala:15:29
      rhsReg_1 <= io_EX_to_MEM_bus_bits_Inst;	// tools.scala:15:29
      rhsReg_2 <= io_EX_to_MEM_bus_bits_ALU_result;	// tools.scala:15:29
      rhsReg_3 <= io_EX_to_MEM_bus_bits_regWriteEn;	// tools.scala:15:29
      rhsReg_4 <= io_EX_to_MEM_bus_bits_regWriteID;	// tools.scala:15:29
      rhsReg_5 <= io_EX_to_MEM_bus_bits_memReadEn;	// tools.scala:15:29
      rhsReg_8 <= io_EX_to_MEM_bus_bits_lsutype;	// tools.scala:15:29
      rhsReg_9 <= io_EX_to_MEM_bus_valid;	// tools.scala:15:29
    end
  end // always @(posedge)
  `ifndef SYNTHESIS	// <stdin>:2065:10
    `ifdef FIRRTL_BEFORE_INITIAL	// <stdin>:2065:10
      `FIRRTL_BEFORE_INITIAL	// <stdin>:2065:10
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// <stdin>:2065:10
      automatic logic [31:0] _RANDOM_0;	// <stdin>:2065:10
      automatic logic [31:0] _RANDOM_1;	// <stdin>:2065:10
      automatic logic [31:0] _RANDOM_2;	// <stdin>:2065:10
      automatic logic [31:0] _RANDOM_3;	// <stdin>:2065:10
      automatic logic [31:0] _RANDOM_4;	// <stdin>:2065:10
      automatic logic [31:0] _RANDOM_5;	// <stdin>:2065:10
      automatic logic [31:0] _RANDOM_6;	// <stdin>:2065:10
      automatic logic [31:0] _RANDOM_7;	// <stdin>:2065:10
      `ifdef INIT_RANDOM_PROLOG_	// <stdin>:2065:10
        `INIT_RANDOM_PROLOG_	// <stdin>:2065:10
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// <stdin>:2065:10
        _RANDOM_0 = `RANDOM;	// <stdin>:2065:10
        _RANDOM_1 = `RANDOM;	// <stdin>:2065:10
        _RANDOM_2 = `RANDOM;	// <stdin>:2065:10
        _RANDOM_3 = `RANDOM;	// <stdin>:2065:10
        _RANDOM_4 = `RANDOM;	// <stdin>:2065:10
        _RANDOM_5 = `RANDOM;	// <stdin>:2065:10
        _RANDOM_6 = `RANDOM;	// <stdin>:2065:10
        _RANDOM_7 = `RANDOM;	// <stdin>:2065:10
        rhsReg = {_RANDOM_0, _RANDOM_1};	// tools.scala:15:29
        rhsReg_1 = _RANDOM_2;	// tools.scala:15:29
        rhsReg_2 = {_RANDOM_3, _RANDOM_4};	// tools.scala:15:29
        rhsReg_3 = _RANDOM_5[0];	// tools.scala:15:29
        rhsReg_4 = _RANDOM_5[5:1];	// tools.scala:15:29
        rhsReg_5 = _RANDOM_5[6];	// tools.scala:15:29
        rhsReg_8 = _RANDOM_7[12:8];	// tools.scala:15:29
        rhsReg_9 = _RANDOM_7[13];	// tools.scala:15:29
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// <stdin>:2065:10
      `FIRRTL_AFTER_INITIAL	// <stdin>:2065:10
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_PMEM_to_MEM_bus_valid = rhsReg_9;	// <stdin>:2065:10, tools.scala:15:29
  assign io_PMEM_to_MEM_bus_bits_ALU_result = rhsReg_2;	// <stdin>:2065:10, tools.scala:15:29
  assign io_PMEM_to_MEM_bus_bits_regWriteEn = rhsReg_3;	// <stdin>:2065:10, tools.scala:15:29
  assign io_PMEM_to_MEM_bus_bits_regWriteID = rhsReg_4;	// <stdin>:2065:10, tools.scala:15:29
  assign io_PMEM_to_MEM_bus_bits_memReadEn = rhsReg_5;	// <stdin>:2065:10, tools.scala:15:29
  assign io_PMEM_to_MEM_bus_bits_PC = rhsReg;	// <stdin>:2065:10, tools.scala:15:29
  assign io_PMEM_to_MEM_bus_bits_Inst = rhsReg_1;	// <stdin>:2065:10, tools.scala:15:29
  assign io_PMEM_to_ID_forward_bits_ALU_result = io_EX_to_MEM_bus_bits_ALU_result;	// <stdin>:2065:10
  assign io_PMEM_to_ID_forward_bits_regWriteEn = io_EX_to_MEM_bus_bits_regWriteEn;	// <stdin>:2065:10
  assign io_PMEM_to_ID_forward_bits_regWriteID = io_EX_to_MEM_bus_bits_regWriteID;	// <stdin>:2065:10
  assign io_PMEM_to_ID_forward_bits_memReadEn = io_EX_to_MEM_bus_bits_memReadEn;	// <stdin>:2065:10
  assign io_memReadData = rhsReg_8 == 5'h11 ? axi_lite_readData_bits_data : rhsReg_8 == 5'h9 ?
                {{32{axi_lite_readData_bits_data[31]}}, axi_lite_readData_bits_data[31:0]} : rhsReg_8 ==
                5'h5 ? {{48{axi_lite_readData_bits_data[15]}}, axi_lite_readData_bits_data[15:0]} :
                rhsReg_8 == 5'h3 ? {{56{axi_lite_readData_bits_data[7]}}, axi_lite_readData_bits_data[7:0]}
                : rhsReg_8 == 5'h8 ? {32'h0, axi_lite_readData_bits_data[31:0]} : rhsReg_8 == 5'h4 ?
                {48'h0, axi_lite_readData_bits_data[15:0]} : rhsReg_8 == 5'h2 ? {56'h0,
                axi_lite_readData_bits_data[7:0]} : 64'h0;	// <stdin>:2065:10, Bitwise.scala:77:12, Cat.scala:33:92, PMEM.scala:50:20, :58:17, :59:44, :60:30, :61:{30,65}, :62:{30,65}, :63:{30,65}, :64:{30,60}, :65:{30,60}, :66:{30,60}, tools.scala:9:34, :15:29
  assign axi_lite_writeAddr_valid = io_EX_to_MEM_bus_bits_memWriteEn;	// <stdin>:2065:10
  assign axi_lite_writeAddr_bits_addr = io_EX_to_MEM_bus_bits_ALU_result[31:0];	// <stdin>:2065:10, PMEM.scala:85:58
  assign axi_lite_writeData_valid = io_EX_to_MEM_bus_bits_memWriteEn;	// <stdin>:2065:10
  assign axi_lite_writeData_bits_data = io_EX_to_MEM_bus_bits_memWriteData;	// <stdin>:2065:10
  assign axi_lite_writeData_bits_strb = io_EX_to_MEM_bus_bits_lsutype == 5'h10 ? 8'hFF : io_EX_to_MEM_bus_bits_lsutype == 5'h8 ?
                8'hF : io_EX_to_MEM_bus_bits_lsutype == 5'h4 ? 8'h3 : {7'h0, io_EX_to_MEM_bus_bits_lsutype
                == 5'h2};	// <stdin>:2065:10, PMEM.scala:49:11, :50:20, :51:24, :52:24, :53:24, :54:24
  assign axi_lite_writeResp_ready = io_EX_to_MEM_bus_bits_memWriteEn;	// <stdin>:2065:10
  assign axi_lite_readAddr_valid = io_EX_to_MEM_bus_bits_memReadEn;	// <stdin>:2065:10
  assign axi_lite_readAddr_bits_addr = io_EX_to_MEM_bus_bits_ALU_result[31:0];	// <stdin>:2065:10, PMEM.scala:85:58
  assign axi_lite_readData_ready = io_EX_to_MEM_bus_bits_memReadEn;	// <stdin>:2065:10
  assign axi_req_valid = (|io_EX_to_MEM_bus_bits_lsutype) | (|rhsReg_8);	// <stdin>:2065:10, PMEM.scala:47:{34,41,76}, tools.scala:15:29
endmodule

module MEMU(	// <stdin>:2208:10
  input         clock,
                reset,
                io_PMEM_to_MEM_bus_valid,
  input  [63:0] io_PMEM_to_MEM_bus_bits_ALU_result,
  input         io_PMEM_to_MEM_bus_bits_regWriteEn,
  input  [4:0]  io_PMEM_to_MEM_bus_bits_regWriteID,
  input         io_PMEM_to_MEM_bus_bits_memReadEn,
  input  [63:0] io_PMEM_to_MEM_bus_bits_PC,
  input  [31:0] io_PMEM_to_MEM_bus_bits_Inst,
  input  [63:0] io_memReadData,
  output        io_MEM_to_WB_bus_valid,
  output [63:0] io_MEM_to_WB_bus_bits_regWriteData,
  output        io_MEM_to_WB_bus_bits_regWriteEn,
  output [4:0]  io_MEM_to_WB_bus_bits_regWriteID,
  output [63:0] io_MEM_to_WB_bus_bits_PC,
  output [31:0] io_MEM_to_WB_bus_bits_Inst,
  output [63:0] io_MEM_to_ID_forward_bits_regWriteData,
  output        io_MEM_to_ID_forward_bits_regWriteEn,
  output [4:0]  io_MEM_to_ID_forward_bits_regWriteID);

  reg [63:0] rhsReg;	// tools.scala:15:29
  reg [31:0] rhsReg_1;	// tools.scala:15:29
  reg        rhsReg_2;	// tools.scala:15:29
  reg [4:0]  rhsReg_3;	// tools.scala:15:29
  reg [63:0] rhsReg_4;	// tools.scala:15:29
  reg        rhsReg_5;	// tools.scala:15:29
  always @(posedge clock) begin
    if (reset) begin
      rhsReg <= 64'h0;	// tools.scala:15:29
      rhsReg_1 <= 32'h0;	// tools.scala:15:29
      rhsReg_2 <= 1'h0;	// tools.scala:15:29
      rhsReg_3 <= 5'h0;	// tools.scala:15:29
      rhsReg_4 <= 64'h0;	// tools.scala:15:29
      rhsReg_5 <= 1'h0;	// tools.scala:15:29
    end
    else begin
      rhsReg <= io_PMEM_to_MEM_bus_bits_PC;	// tools.scala:15:29
      rhsReg_1 <= io_PMEM_to_MEM_bus_bits_Inst;	// tools.scala:15:29
      rhsReg_2 <= io_PMEM_to_MEM_bus_bits_regWriteEn;	// tools.scala:15:29
      rhsReg_3 <= io_PMEM_to_MEM_bus_bits_regWriteID;	// tools.scala:15:29
      if (io_PMEM_to_MEM_bus_bits_memReadEn)
        rhsReg_4 <= io_memReadData;	// tools.scala:15:29
      else
        rhsReg_4 <= io_PMEM_to_MEM_bus_bits_ALU_result;	// tools.scala:15:29
      rhsReg_5 <= io_PMEM_to_MEM_bus_valid;	// tools.scala:15:29
    end
  end // always @(posedge)
  `ifndef SYNTHESIS	// <stdin>:2208:10
    `ifdef FIRRTL_BEFORE_INITIAL	// <stdin>:2208:10
      `FIRRTL_BEFORE_INITIAL	// <stdin>:2208:10
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// <stdin>:2208:10
      automatic logic [31:0] _RANDOM_0;	// <stdin>:2208:10
      automatic logic [31:0] _RANDOM_1;	// <stdin>:2208:10
      automatic logic [31:0] _RANDOM_2;	// <stdin>:2208:10
      automatic logic [31:0] _RANDOM_3;	// <stdin>:2208:10
      automatic logic [31:0] _RANDOM_4;	// <stdin>:2208:10
      automatic logic [31:0] _RANDOM_5;	// <stdin>:2208:10
      `ifdef INIT_RANDOM_PROLOG_	// <stdin>:2208:10
        `INIT_RANDOM_PROLOG_	// <stdin>:2208:10
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// <stdin>:2208:10
        _RANDOM_0 = `RANDOM;	// <stdin>:2208:10
        _RANDOM_1 = `RANDOM;	// <stdin>:2208:10
        _RANDOM_2 = `RANDOM;	// <stdin>:2208:10
        _RANDOM_3 = `RANDOM;	// <stdin>:2208:10
        _RANDOM_4 = `RANDOM;	// <stdin>:2208:10
        _RANDOM_5 = `RANDOM;	// <stdin>:2208:10
        rhsReg = {_RANDOM_0, _RANDOM_1};	// tools.scala:15:29
        rhsReg_1 = _RANDOM_2;	// tools.scala:15:29
        rhsReg_2 = _RANDOM_3[0];	// tools.scala:15:29
        rhsReg_3 = _RANDOM_3[5:1];	// tools.scala:15:29
        rhsReg_4 = {_RANDOM_3[31:6], _RANDOM_4, _RANDOM_5[5:0]};	// tools.scala:15:29
        rhsReg_5 = _RANDOM_5[6];	// tools.scala:15:29
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// <stdin>:2208:10
      `FIRRTL_AFTER_INITIAL	// <stdin>:2208:10
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_MEM_to_WB_bus_valid = rhsReg_5;	// <stdin>:2208:10, tools.scala:15:29
  assign io_MEM_to_WB_bus_bits_regWriteData = rhsReg_4;	// <stdin>:2208:10, tools.scala:15:29
  assign io_MEM_to_WB_bus_bits_regWriteEn = rhsReg_2;	// <stdin>:2208:10, tools.scala:15:29
  assign io_MEM_to_WB_bus_bits_regWriteID = rhsReg_3;	// <stdin>:2208:10, tools.scala:15:29
  assign io_MEM_to_WB_bus_bits_PC = rhsReg;	// <stdin>:2208:10, tools.scala:15:29
  assign io_MEM_to_WB_bus_bits_Inst = rhsReg_1;	// <stdin>:2208:10, tools.scala:15:29
  assign io_MEM_to_ID_forward_bits_regWriteData = io_PMEM_to_MEM_bus_bits_memReadEn ? io_memReadData : io_PMEM_to_MEM_bus_bits_ALU_result;	// <stdin>:2208:10, MEMU.scala:59:24
  assign io_MEM_to_ID_forward_bits_regWriteEn = io_PMEM_to_MEM_bus_bits_regWriteEn;	// <stdin>:2208:10
  assign io_MEM_to_ID_forward_bits_regWriteID = io_PMEM_to_MEM_bus_bits_regWriteID;	// <stdin>:2208:10
endmodule

module WBU(	// <stdin>:2248:10
  input         io_MEM_to_WB_bus_valid,
  input  [63:0] io_MEM_to_WB_bus_bits_regWriteData,
  input         io_MEM_to_WB_bus_bits_regWriteEn,
  input  [4:0]  io_MEM_to_WB_bus_bits_regWriteID,
  input  [63:0] io_MEM_to_WB_bus_bits_PC,
  input  [31:0] io_MEM_to_WB_bus_bits_Inst,
  output        io_WB_to_ID_forward_valid,
  output [63:0] io_WB_to_ID_forward_bits_regWriteData,
  output        io_WB_to_ID_forward_bits_regWriteEn,
  output [4:0]  io_WB_to_ID_forward_bits_regWriteID,
  output [63:0] io_WB_pc,
  output [31:0] io_WB_Inst);

  assign io_WB_to_ID_forward_valid = io_MEM_to_WB_bus_valid;	// <stdin>:2248:10
  assign io_WB_to_ID_forward_bits_regWriteData = io_MEM_to_WB_bus_bits_regWriteData;	// <stdin>:2248:10
  assign io_WB_to_ID_forward_bits_regWriteEn = io_MEM_to_WB_bus_bits_regWriteEn;	// <stdin>:2248:10
  assign io_WB_to_ID_forward_bits_regWriteID = io_MEM_to_WB_bus_bits_regWriteID;	// <stdin>:2248:10
  assign io_WB_pc = io_MEM_to_WB_bus_bits_PC;	// <stdin>:2248:10
  assign io_WB_Inst = io_MEM_to_WB_bus_bits_Inst;	// <stdin>:2248:10
endmodule

// external module sim_sram

// external module sim

module RAMU(	// <stdin>:2317:10
  input         clock,
                reset,
                axi_lite_writeAddr_valid,
  input  [31:0] axi_lite_writeAddr_bits_addr,
  input         axi_lite_writeData_valid,
  input  [63:0] axi_lite_writeData_bits_data,
  input  [7:0]  axi_lite_writeData_bits_strb,
  input         axi_lite_writeResp_ready,
                axi_lite_readAddr_valid,
  input  [31:0] axi_lite_readAddr_bits_addr,
  input         axi_lite_readData_ready,
  output        axi_lite_readData_valid,
  output [63:0] axi_lite_readData_bits_data,
  output [1:0]  axi_lite_readData_bits_resp);

  wire       _data_ram_arready;	// RAM.scala:34:26
  wire       _data_ram_awready;	// RAM.scala:34:26
  wire       _data_ram_wready;	// RAM.scala:34:26
  wire [1:0] _data_ram_bresp;	// RAM.scala:34:26
  wire       _data_ram_bvalid;	// RAM.scala:34:26
  sim_sram data_ram (	// RAM.scala:34:26
    .pc      (64'h0),	// RAM.scala:37:45
    .aclk    (clock),
    .aresetn (~reset),	// RAM.scala:40:48
    .araddr  (axi_lite_readAddr_bits_addr),
    .arvalid (axi_lite_readAddr_valid),
    .rready  (axi_lite_readData_ready),
    .awaddr  (axi_lite_writeAddr_bits_addr),
    .awvalid (axi_lite_writeAddr_valid),
    .wdata   (axi_lite_writeData_bits_data),
    .wstrb   (axi_lite_writeData_bits_strb),
    .wvalid  (axi_lite_writeData_valid),
    .bready  (axi_lite_writeResp_ready),
    .arready (_data_ram_arready),
    .rdata   (axi_lite_readData_bits_data),
    .rresp   (axi_lite_readData_bits_resp),
    .rvalid  (axi_lite_readData_valid),
    .awready (_data_ram_awready),
    .wready  (_data_ram_wready),
    .bresp   (_data_ram_bresp),
    .bvalid  (_data_ram_bvalid)
  );
endmodule

module AXI_Arbiter(	// <stdin>:2366:10
  input         in_0_writeAddr_valid,
  input  [31:0] in_0_writeAddr_bits_addr,
  input         in_0_writeData_valid,
  input  [63:0] in_0_writeData_bits_data,
  input  [7:0]  in_0_writeData_bits_strb,
  input         in_0_writeResp_ready,
                in_0_readAddr_valid,
  input  [31:0] in_0_readAddr_bits_addr,
  input         in_0_readData_ready,
                in_1_readAddr_valid,
  input  [31:0] in_1_readAddr_bits_addr,
  input         in_1_readData_ready,
                req_0_valid,
                out_readData_valid,
  input  [63:0] out_readData_bits_data,
  input  [1:0]  out_readData_bits_resp,
  output [63:0] in_0_readData_bits_data,
  output        in_1_readData_valid,
  output [63:0] in_1_readData_bits_data,
  output [1:0]  in_1_readData_bits_resp,
  output        req_0_ready,
                req_1_ready,
                out_writeAddr_valid,
  output [31:0] out_writeAddr_bits_addr,
  output        out_writeData_valid,
  output [63:0] out_writeData_bits_data,
  output [7:0]  out_writeData_bits_strb,
  output        out_writeResp_ready,
                out_readAddr_valid,
  output [31:0] out_readAddr_bits_addr,
  output        out_readData_ready);

  assign in_0_readData_bits_data = req_0_valid ? out_readData_bits_data : 64'h77;	// <stdin>:2366:10, RAM.scala:16:37, :22:27, :23:17
  assign in_1_readData_valid = out_readData_valid;	// <stdin>:2366:10
  assign in_1_readData_bits_data = out_readData_bits_data;	// <stdin>:2366:10
  assign in_1_readData_bits_resp = out_readData_bits_resp;	// <stdin>:2366:10
  assign req_0_ready = req_0_valid;	// <stdin>:2366:10
  assign req_1_ready = ~req_0_valid;	// <stdin>:2366:10, RAM.scala:22:27, :26:30
  assign out_writeAddr_valid = req_0_valid & in_0_writeAddr_valid;	// <stdin>:2366:10, RAM.scala:22:27, :23:17
  assign out_writeAddr_bits_addr = req_0_valid ? in_0_writeAddr_bits_addr : 32'h0;	// <stdin>:2366:10, RAM.scala:22:27, :23:17
  assign out_writeData_valid = req_0_valid & in_0_writeData_valid;	// <stdin>:2366:10, RAM.scala:22:27, :23:17
  assign out_writeData_bits_data = req_0_valid ? in_0_writeData_bits_data : 64'h0;	// <stdin>:2366:10, RAM.scala:22:27, :23:17
  assign out_writeData_bits_strb = req_0_valid ? in_0_writeData_bits_strb : 8'h0;	// <stdin>:2366:10, RAM.scala:22:27, :23:17
  assign out_writeResp_ready = req_0_valid & in_0_writeResp_ready;	// <stdin>:2366:10, RAM.scala:22:27, :23:17
  assign out_readAddr_valid = req_0_valid ? in_0_readAddr_valid : in_1_readAddr_valid;	// <stdin>:2366:10, RAM.scala:22:27, :23:17
  assign out_readAddr_bits_addr = req_0_valid ? in_0_readAddr_bits_addr : in_1_readAddr_bits_addr;	// <stdin>:2366:10, RAM.scala:22:27, :23:17
  assign out_readData_ready = req_0_valid ? in_0_readData_ready : in_1_readData_ready;	// <stdin>:2366:10, RAM.scala:22:27, :23:17
endmodule

module top(	// <stdin>:2400:10
  input         clock,
                reset,
  output [63:0] io_ID_npc,
                io_PF_npc,
                io_PF_pc,
                io_PF_axidata,
                io_IF_pc,
                io_ID_pc,
                io_EX_pc,
                io_PMEM_pc,
                io_WB_pc,
  output [31:0] io_WB_Inst,
  output [63:0] io_WB_RegWriteData,
                io_WB_RegWriteID,
  output        io_WB_valid,
  output [63:0] io_MEM_RegWriteData,
  output        io_stall,
                io_BTB_hit,
  output [2:0]  io_BTB_wset,
  output [15:0] io_BTB_wtag,
  output [2:0]  io_BTB_rset,
  output [15:0] io_BTB_rtag,
  output [63:0] io_BTB_rdata,
                io_BTB_wdata,
  output [31:0] io_br_cnt,
                io_bp_fail,
                io_btb_hit_cnt,
  output [63:0] io_bp_npc,
  output        io_bp_taken,
                io_bp_flush,
  output [31:0] io_IF_Inst,
  output        io_IF_valid,
                io_IF_AXIREQ,
                io_MEM_AXIREQ,
  output [63:0] io_ID_ALU_Data1,
                io_ID_ALU_Data2,
                io_ID_Rs1Data,
                io_ID_Rs2Data,
                io_ALUResult);

  wire [63:0] _arb_in_0_readData_bits_data;	// top.scala:153:21
  wire        _arb_in_1_readData_valid;	// top.scala:153:21
  wire [63:0] _arb_in_1_readData_bits_data;	// top.scala:153:21
  wire [1:0]  _arb_in_1_readData_bits_resp;	// top.scala:153:21
  wire        _arb_req_1_ready;	// top.scala:153:21
  wire        _arb_out_writeAddr_valid;	// top.scala:153:21
  wire [31:0] _arb_out_writeAddr_bits_addr;	// top.scala:153:21
  wire        _arb_out_writeData_valid;	// top.scala:153:21
  wire [63:0] _arb_out_writeData_bits_data;	// top.scala:153:21
  wire [7:0]  _arb_out_writeData_bits_strb;	// top.scala:153:21
  wire        _arb_out_writeResp_ready;	// top.scala:153:21
  wire        _arb_out_readAddr_valid;	// top.scala:153:21
  wire [31:0] _arb_out_readAddr_bits_addr;	// top.scala:153:21
  wire        _arb_out_readData_ready;	// top.scala:153:21
  wire        _ram_unit_axi_lite_readData_valid;	// top.scala:152:26
  wire [63:0] _ram_unit_axi_lite_readData_bits_data;	// top.scala:152:26
  wire [1:0]  _ram_unit_axi_lite_readData_bits_resp;	// top.scala:152:26
  wire [63:0] _simulate_inst;	// top.scala:114:26
  wire        _inst_ram_arready;	// top.scala:72:30
  wire [63:0] _inst_ram_rdata;	// top.scala:72:30
  wire [1:0]  _inst_ram_rresp;	// top.scala:72:30
  wire        _inst_ram_rvalid;	// top.scala:72:30
  wire        _inst_ram_awready;	// top.scala:72:30
  wire        _inst_ram_wready;	// top.scala:72:30
  wire [1:0]  _inst_ram_bresp;	// top.scala:72:30
  wire        _inst_ram_bvalid;	// top.scala:72:30
  wire [63:0] _wb_unit_io_WB_to_ID_forward_bits_regWriteData;	// top.scala:70:25
  wire        _wb_unit_io_WB_to_ID_forward_bits_regWriteEn;	// top.scala:70:25
  wire [4:0]  _wb_unit_io_WB_to_ID_forward_bits_regWriteID;	// top.scala:70:25
  wire [31:0] _wb_unit_io_WB_Inst;	// top.scala:70:25
  wire        _mem_unit_io_MEM_to_WB_bus_valid;	// top.scala:69:26
  wire [63:0] _mem_unit_io_MEM_to_WB_bus_bits_regWriteData;	// top.scala:69:26
  wire        _mem_unit_io_MEM_to_WB_bus_bits_regWriteEn;	// top.scala:69:26
  wire [4:0]  _mem_unit_io_MEM_to_WB_bus_bits_regWriteID;	// top.scala:69:26
  wire [63:0] _mem_unit_io_MEM_to_WB_bus_bits_PC;	// top.scala:69:26
  wire [31:0] _mem_unit_io_MEM_to_WB_bus_bits_Inst;	// top.scala:69:26
  wire [63:0] _mem_unit_io_MEM_to_ID_forward_bits_regWriteData;	// top.scala:69:26
  wire        _mem_unit_io_MEM_to_ID_forward_bits_regWriteEn;	// top.scala:69:26
  wire [4:0]  _mem_unit_io_MEM_to_ID_forward_bits_regWriteID;	// top.scala:69:26
  wire        _pre_mem_unit_io_PMEM_to_MEM_bus_valid;	// top.scala:68:30
  wire [63:0] _pre_mem_unit_io_PMEM_to_MEM_bus_bits_ALU_result;	// top.scala:68:30
  wire        _pre_mem_unit_io_PMEM_to_MEM_bus_bits_regWriteEn;	// top.scala:68:30
  wire [4:0]  _pre_mem_unit_io_PMEM_to_MEM_bus_bits_regWriteID;	// top.scala:68:30
  wire        _pre_mem_unit_io_PMEM_to_MEM_bus_bits_memReadEn;	// top.scala:68:30
  wire [63:0] _pre_mem_unit_io_PMEM_to_MEM_bus_bits_PC;	// top.scala:68:30
  wire [31:0] _pre_mem_unit_io_PMEM_to_MEM_bus_bits_Inst;	// top.scala:68:30
  wire [63:0] _pre_mem_unit_io_PMEM_to_ID_forward_bits_ALU_result;	// top.scala:68:30
  wire        _pre_mem_unit_io_PMEM_to_ID_forward_bits_regWriteEn;	// top.scala:68:30
  wire [4:0]  _pre_mem_unit_io_PMEM_to_ID_forward_bits_regWriteID;	// top.scala:68:30
  wire        _pre_mem_unit_io_PMEM_to_ID_forward_bits_memReadEn;	// top.scala:68:30
  wire [63:0] _pre_mem_unit_io_memReadData;	// top.scala:68:30
  wire        _pre_mem_unit_axi_lite_writeAddr_valid;	// top.scala:68:30
  wire [31:0] _pre_mem_unit_axi_lite_writeAddr_bits_addr;	// top.scala:68:30
  wire        _pre_mem_unit_axi_lite_writeData_valid;	// top.scala:68:30
  wire [63:0] _pre_mem_unit_axi_lite_writeData_bits_data;	// top.scala:68:30
  wire [7:0]  _pre_mem_unit_axi_lite_writeData_bits_strb;	// top.scala:68:30
  wire        _pre_mem_unit_axi_lite_writeResp_ready;	// top.scala:68:30
  wire        _pre_mem_unit_axi_lite_readAddr_valid;	// top.scala:68:30
  wire [31:0] _pre_mem_unit_axi_lite_readAddr_bits_addr;	// top.scala:68:30
  wire        _pre_mem_unit_axi_lite_readData_ready;	// top.scala:68:30
  wire        _pre_mem_unit_axi_req_valid;	// top.scala:68:30
  wire        _excute_unit_io_EX_to_MEM_bus_valid;	// top.scala:67:29
  wire [31:0] _excute_unit_io_EX_to_MEM_bus_bits_Inst;	// top.scala:67:29
  wire [63:0] _excute_unit_io_EX_to_MEM_bus_bits_PC;	// top.scala:67:29
  wire [63:0] _excute_unit_io_EX_to_MEM_bus_bits_ALU_result;	// top.scala:67:29
  wire [63:0] _excute_unit_io_EX_to_MEM_bus_bits_memWriteData;	// top.scala:67:29
  wire        _excute_unit_io_EX_to_MEM_bus_bits_memWriteEn;	// top.scala:67:29
  wire        _excute_unit_io_EX_to_MEM_bus_bits_memReadEn;	// top.scala:67:29
  wire [4:0]  _excute_unit_io_EX_to_MEM_bus_bits_lsutype;	// top.scala:67:29
  wire [4:0]  _excute_unit_io_EX_to_MEM_bus_bits_regWriteID;	// top.scala:67:29
  wire        _excute_unit_io_EX_to_MEM_bus_bits_regWriteEn;	// top.scala:67:29
  wire [63:0] _excute_unit_io_EX_ALUResult_Pass;	// top.scala:67:29
  wire        _inst_decode_unit_io_IF_to_ID_bus_ready;	// top.scala:66:34
  wire        _inst_decode_unit_io_ID_to_EX_bus_valid;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_to_EX_bus_bits_ALU_Data1;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_to_EX_bus_bits_ALU_Data2;	// top.scala:66:34
  wire        _inst_decode_unit_io_ID_to_EX_bus_bits_futype;	// top.scala:66:34
  wire [4:0]  _inst_decode_unit_io_ID_to_EX_bus_bits_optype;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_to_EX_bus_bits_rs2_data;	// top.scala:66:34
  wire [4:0]  _inst_decode_unit_io_ID_to_EX_bus_bits_regWriteID;	// top.scala:66:34
  wire        _inst_decode_unit_io_ID_to_EX_bus_bits_regWriteEn;	// top.scala:66:34
  wire        _inst_decode_unit_io_ID_to_EX_bus_bits_memWriteEn;	// top.scala:66:34
  wire        _inst_decode_unit_io_ID_to_EX_bus_bits_memReadEn;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_to_EX_bus_bits_PC;	// top.scala:66:34
  wire [31:0] _inst_decode_unit_io_ID_to_EX_bus_bits_Inst;	// top.scala:66:34
  wire        _inst_decode_unit_io_ID_to_BPU_bus_valid;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_to_BPU_bus_bits_PC;	// top.scala:66:34
  wire        _inst_decode_unit_io_ID_to_BPU_bus_bits_taken;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_to_BPU_bus_bits_br_target;	// top.scala:66:34
  wire        _inst_decode_unit_io_ID_to_BPU_bus_bits_load_use_stall;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_0;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_1;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_2;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_3;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_4;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_5;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_6;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_7;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_8;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_9;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_10;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_11;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_12;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_13;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_14;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_15;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_16;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_17;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_18;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_19;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_20;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_21;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_22;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_23;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_24;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_25;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_26;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_27;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_28;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_29;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_30;	// top.scala:66:34
  wire [63:0] _inst_decode_unit_io_ID_GPR_31;	// top.scala:66:34
  wire        _inst_decode_unit_io_ID_unknown_inst;	// top.scala:66:34
  wire        _inst_fetch_unit_io_IF_to_ID_bus_valid;	// top.scala:65:33
  wire [63:0] _inst_fetch_unit_io_IF_to_ID_bus_bits_PC;	// top.scala:65:33
  wire [31:0] _inst_fetch_unit_io_IF_to_ID_bus_bits_Inst;	// top.scala:65:33
  wire [63:0] _inst_fetch_unit_io_PF_pc;	// top.scala:65:33
  wire        _inst_fetch_unit_io_PF_valid;	// top.scala:65:33
  wire [63:0] _inst_fetch_unit_io_axidata;	// top.scala:65:33
  wire        _inst_fetch_unit_axi_lite_readAddr_valid;	// top.scala:65:33
  wire [31:0] _inst_fetch_unit_axi_lite_readAddr_bits_addr;	// top.scala:65:33
  wire        _inst_fetch_unit_axi_lite_readData_ready;	// top.scala:65:33
  wire        _bp_unit_io_bp_taken;	// top.scala:64:33
  wire        _bp_unit_io_bp_flush;	// top.scala:64:33
  wire [63:0] _bp_unit_io_bp_npc;	// top.scala:64:33
  BPU bp_unit (	// top.scala:64:33
    .clock                                (clock),
    .reset                                (reset),
    .io_PF_pc                             (_inst_fetch_unit_io_PF_pc),	// top.scala:65:33
    .io_PF_inst                           (_inst_fetch_unit_io_axidata[31:0]),	// top.scala:65:33, :124:45
    .io_PF_valid                          (_inst_fetch_unit_io_PF_valid),	// top.scala:65:33
    .io_ID_to_BPU_bus_valid               (_inst_decode_unit_io_ID_to_BPU_bus_valid),	// top.scala:66:34
    .io_ID_to_BPU_bus_bits_PC             (_inst_decode_unit_io_ID_to_BPU_bus_bits_PC),	// top.scala:66:34
    .io_ID_to_BPU_bus_bits_taken          (_inst_decode_unit_io_ID_to_BPU_bus_bits_taken),	// top.scala:66:34
    .io_ID_to_BPU_bus_bits_br_target      (_inst_decode_unit_io_ID_to_BPU_bus_bits_br_target),	// top.scala:66:34
    .io_ID_to_BPU_bus_bits_load_use_stall (_inst_decode_unit_io_ID_to_BPU_bus_bits_load_use_stall),	// top.scala:66:34
    .io_bp_taken                          (_bp_unit_io_bp_taken),
    .io_bp_flush                          (_bp_unit_io_bp_flush),
    .io_bp_npc                            (_bp_unit_io_bp_npc),
    .io_BTB_wset                          (io_BTB_wset),
    .io_BTB_wtag                          (io_BTB_wtag),
    .io_BTB_rset                          (io_BTB_rset),
    .io_BTB_rtag                          (io_BTB_rtag),
    .io_BTB_rdata                         (io_BTB_rdata),
    .io_BTB_wdata                         (io_BTB_wdata),
    .io_BTB_hit                           (io_BTB_hit),
    .io_br_cnt                            (io_br_cnt),
    .io_bp_fail                           (io_bp_fail),
    .io_hit_cnt                           (io_btb_hit_cnt)
  );
  IFU inst_fetch_unit (	// top.scala:65:33
    .clock                       (clock),
    .reset                       (reset),
    .io_IF_to_ID_bus_ready       (_inst_decode_unit_io_IF_to_ID_bus_ready),	// top.scala:66:34
    .io_bp_flush                 (_bp_unit_io_bp_flush),	// top.scala:64:33
    .io_bp_taken                 (_bp_unit_io_bp_taken),	// top.scala:64:33
    .io_bp_npc                   (_bp_unit_io_bp_npc),	// top.scala:64:33
    .axi_lite_readData_valid     (_arb_in_1_readData_valid),	// top.scala:153:21
    .axi_lite_readData_bits_data (_arb_in_1_readData_bits_data),	// top.scala:153:21
    .axi_lite_readData_bits_resp (_arb_in_1_readData_bits_resp),	// top.scala:153:21
    .axi_req_ready               (_arb_req_1_ready),	// top.scala:153:21
    .io_IF_to_ID_bus_valid       (_inst_fetch_unit_io_IF_to_ID_bus_valid),
    .io_IF_to_ID_bus_bits_PC     (_inst_fetch_unit_io_IF_to_ID_bus_bits_PC),
    .io_IF_to_ID_bus_bits_Inst   (_inst_fetch_unit_io_IF_to_ID_bus_bits_Inst),
    .io_PF_npc                   (io_PF_npc),
    .io_PF_pc                    (_inst_fetch_unit_io_PF_pc),
    .io_PF_valid                 (_inst_fetch_unit_io_PF_valid),
    .io_axidata                  (_inst_fetch_unit_io_axidata),
    .axi_lite_readAddr_valid     (_inst_fetch_unit_axi_lite_readAddr_valid),
    .axi_lite_readAddr_bits_addr (_inst_fetch_unit_axi_lite_readAddr_bits_addr),
    .axi_lite_readData_ready     (_inst_fetch_unit_axi_lite_readData_ready)
  );
  IDU inst_decode_unit (	// top.scala:66:34
    .clock                                  (clock),
    .reset                                  (reset),
    .io_IF_to_ID_bus_valid                  (_inst_fetch_unit_io_IF_to_ID_bus_valid),	// top.scala:65:33
    .io_IF_to_ID_bus_bits_PC                (_inst_fetch_unit_io_IF_to_ID_bus_bits_PC),	// top.scala:65:33
    .io_IF_to_ID_bus_bits_Inst              (_inst_fetch_unit_io_IF_to_ID_bus_bits_Inst),	// top.scala:65:33
    .io_WB_to_ID_forward_bits_regWriteData  (_wb_unit_io_WB_to_ID_forward_bits_regWriteData),	// top.scala:70:25
    .io_WB_to_ID_forward_bits_regWriteEn    (_wb_unit_io_WB_to_ID_forward_bits_regWriteEn),	// top.scala:70:25
    .io_WB_to_ID_forward_bits_regWriteID    (_wb_unit_io_WB_to_ID_forward_bits_regWriteID),	// top.scala:70:25
    .io_PMEM_to_ID_forward_bits_ALU_result  (_pre_mem_unit_io_PMEM_to_ID_forward_bits_ALU_result),	// top.scala:68:30
    .io_PMEM_to_ID_forward_bits_regWriteEn  (_pre_mem_unit_io_PMEM_to_ID_forward_bits_regWriteEn),	// top.scala:68:30
    .io_PMEM_to_ID_forward_bits_regWriteID  (_pre_mem_unit_io_PMEM_to_ID_forward_bits_regWriteID),	// top.scala:68:30
    .io_PMEM_to_ID_forward_bits_memReadEn   (_pre_mem_unit_io_PMEM_to_ID_forward_bits_memReadEn),	// top.scala:68:30
    .io_MEM_to_ID_forward_bits_regWriteData (_mem_unit_io_MEM_to_ID_forward_bits_regWriteData),	// top.scala:69:26
    .io_MEM_to_ID_forward_bits_regWriteEn   (_mem_unit_io_MEM_to_ID_forward_bits_regWriteEn),	// top.scala:69:26
    .io_MEM_to_ID_forward_bits_regWriteID   (_mem_unit_io_MEM_to_ID_forward_bits_regWriteID),	// top.scala:69:26
    .io_EX_ALUResult                        (_excute_unit_io_EX_ALUResult_Pass),	// top.scala:67:29
    .io_IF_to_ID_bus_ready                  (_inst_decode_unit_io_IF_to_ID_bus_ready),
    .io_ID_to_EX_bus_valid                  (_inst_decode_unit_io_ID_to_EX_bus_valid),
    .io_ID_to_EX_bus_bits_ALU_Data1         (_inst_decode_unit_io_ID_to_EX_bus_bits_ALU_Data1),
    .io_ID_to_EX_bus_bits_ALU_Data2         (_inst_decode_unit_io_ID_to_EX_bus_bits_ALU_Data2),
    .io_ID_to_EX_bus_bits_futype            (_inst_decode_unit_io_ID_to_EX_bus_bits_futype),
    .io_ID_to_EX_bus_bits_optype            (_inst_decode_unit_io_ID_to_EX_bus_bits_optype),
    .io_ID_to_EX_bus_bits_rs1_data          (io_ID_Rs1Data),
    .io_ID_to_EX_bus_bits_rs2_data          (_inst_decode_unit_io_ID_to_EX_bus_bits_rs2_data),
    .io_ID_to_EX_bus_bits_regWriteID        (_inst_decode_unit_io_ID_to_EX_bus_bits_regWriteID),
    .io_ID_to_EX_bus_bits_regWriteEn        (_inst_decode_unit_io_ID_to_EX_bus_bits_regWriteEn),
    .io_ID_to_EX_bus_bits_memWriteEn        (_inst_decode_unit_io_ID_to_EX_bus_bits_memWriteEn),
    .io_ID_to_EX_bus_bits_memReadEn         (_inst_decode_unit_io_ID_to_EX_bus_bits_memReadEn),
    .io_ID_to_EX_bus_bits_PC                (_inst_decode_unit_io_ID_to_EX_bus_bits_PC),
    .io_ID_to_EX_bus_bits_Inst              (_inst_decode_unit_io_ID_to_EX_bus_bits_Inst),
    .io_ID_to_BPU_bus_valid                 (_inst_decode_unit_io_ID_to_BPU_bus_valid),
    .io_ID_to_BPU_bus_bits_PC               (_inst_decode_unit_io_ID_to_BPU_bus_bits_PC),
    .io_ID_to_BPU_bus_bits_taken            (_inst_decode_unit_io_ID_to_BPU_bus_bits_taken),
    .io_ID_to_BPU_bus_bits_br_target        (_inst_decode_unit_io_ID_to_BPU_bus_bits_br_target),
    .io_ID_to_BPU_bus_bits_load_use_stall   (_inst_decode_unit_io_ID_to_BPU_bus_bits_load_use_stall),
    .io_ID_stall                            (io_stall),
    .io_ID_GPR_0                            (_inst_decode_unit_io_ID_GPR_0),
    .io_ID_GPR_1                            (_inst_decode_unit_io_ID_GPR_1),
    .io_ID_GPR_2                            (_inst_decode_unit_io_ID_GPR_2),
    .io_ID_GPR_3                            (_inst_decode_unit_io_ID_GPR_3),
    .io_ID_GPR_4                            (_inst_decode_unit_io_ID_GPR_4),
    .io_ID_GPR_5                            (_inst_decode_unit_io_ID_GPR_5),
    .io_ID_GPR_6                            (_inst_decode_unit_io_ID_GPR_6),
    .io_ID_GPR_7                            (_inst_decode_unit_io_ID_GPR_7),
    .io_ID_GPR_8                            (_inst_decode_unit_io_ID_GPR_8),
    .io_ID_GPR_9                            (_inst_decode_unit_io_ID_GPR_9),
    .io_ID_GPR_10                           (_inst_decode_unit_io_ID_GPR_10),
    .io_ID_GPR_11                           (_inst_decode_unit_io_ID_GPR_11),
    .io_ID_GPR_12                           (_inst_decode_unit_io_ID_GPR_12),
    .io_ID_GPR_13                           (_inst_decode_unit_io_ID_GPR_13),
    .io_ID_GPR_14                           (_inst_decode_unit_io_ID_GPR_14),
    .io_ID_GPR_15                           (_inst_decode_unit_io_ID_GPR_15),
    .io_ID_GPR_16                           (_inst_decode_unit_io_ID_GPR_16),
    .io_ID_GPR_17                           (_inst_decode_unit_io_ID_GPR_17),
    .io_ID_GPR_18                           (_inst_decode_unit_io_ID_GPR_18),
    .io_ID_GPR_19                           (_inst_decode_unit_io_ID_GPR_19),
    .io_ID_GPR_20                           (_inst_decode_unit_io_ID_GPR_20),
    .io_ID_GPR_21                           (_inst_decode_unit_io_ID_GPR_21),
    .io_ID_GPR_22                           (_inst_decode_unit_io_ID_GPR_22),
    .io_ID_GPR_23                           (_inst_decode_unit_io_ID_GPR_23),
    .io_ID_GPR_24                           (_inst_decode_unit_io_ID_GPR_24),
    .io_ID_GPR_25                           (_inst_decode_unit_io_ID_GPR_25),
    .io_ID_GPR_26                           (_inst_decode_unit_io_ID_GPR_26),
    .io_ID_GPR_27                           (_inst_decode_unit_io_ID_GPR_27),
    .io_ID_GPR_28                           (_inst_decode_unit_io_ID_GPR_28),
    .io_ID_GPR_29                           (_inst_decode_unit_io_ID_GPR_29),
    .io_ID_GPR_30                           (_inst_decode_unit_io_ID_GPR_30),
    .io_ID_GPR_31                           (_inst_decode_unit_io_ID_GPR_31),
    .io_ID_unknown_inst                     (_inst_decode_unit_io_ID_unknown_inst)
  );
  EXU excute_unit (	// top.scala:67:29
    .clock                              (clock),
    .reset                              (reset),
    .io_ID_to_EX_bus_valid              (_inst_decode_unit_io_ID_to_EX_bus_valid),	// top.scala:66:34
    .io_ID_to_EX_bus_bits_ALU_Data1     (_inst_decode_unit_io_ID_to_EX_bus_bits_ALU_Data1),	// top.scala:66:34
    .io_ID_to_EX_bus_bits_ALU_Data2     (_inst_decode_unit_io_ID_to_EX_bus_bits_ALU_Data2),	// top.scala:66:34
    .io_ID_to_EX_bus_bits_futype        (_inst_decode_unit_io_ID_to_EX_bus_bits_futype),	// top.scala:66:34
    .io_ID_to_EX_bus_bits_optype        (_inst_decode_unit_io_ID_to_EX_bus_bits_optype),	// top.scala:66:34
    .io_ID_to_EX_bus_bits_rs2_data      (_inst_decode_unit_io_ID_to_EX_bus_bits_rs2_data),	// top.scala:66:34
    .io_ID_to_EX_bus_bits_regWriteID    (_inst_decode_unit_io_ID_to_EX_bus_bits_regWriteID),	// top.scala:66:34
    .io_ID_to_EX_bus_bits_regWriteEn    (_inst_decode_unit_io_ID_to_EX_bus_bits_regWriteEn),	// top.scala:66:34
    .io_ID_to_EX_bus_bits_memWriteEn    (_inst_decode_unit_io_ID_to_EX_bus_bits_memWriteEn),	// top.scala:66:34
    .io_ID_to_EX_bus_bits_memReadEn     (_inst_decode_unit_io_ID_to_EX_bus_bits_memReadEn),	// top.scala:66:34
    .io_ID_to_EX_bus_bits_PC            (_inst_decode_unit_io_ID_to_EX_bus_bits_PC),	// top.scala:66:34
    .io_ID_to_EX_bus_bits_Inst          (_inst_decode_unit_io_ID_to_EX_bus_bits_Inst),	// top.scala:66:34
    .io_EX_to_MEM_bus_valid             (_excute_unit_io_EX_to_MEM_bus_valid),
    .io_EX_to_MEM_bus_bits_Inst         (_excute_unit_io_EX_to_MEM_bus_bits_Inst),
    .io_EX_to_MEM_bus_bits_PC           (_excute_unit_io_EX_to_MEM_bus_bits_PC),
    .io_EX_to_MEM_bus_bits_ALU_result   (_excute_unit_io_EX_to_MEM_bus_bits_ALU_result),
    .io_EX_to_MEM_bus_bits_memWriteData (_excute_unit_io_EX_to_MEM_bus_bits_memWriteData),
    .io_EX_to_MEM_bus_bits_memWriteEn   (_excute_unit_io_EX_to_MEM_bus_bits_memWriteEn),
    .io_EX_to_MEM_bus_bits_memReadEn    (_excute_unit_io_EX_to_MEM_bus_bits_memReadEn),
    .io_EX_to_MEM_bus_bits_lsutype      (_excute_unit_io_EX_to_MEM_bus_bits_lsutype),
    .io_EX_to_MEM_bus_bits_regWriteID   (_excute_unit_io_EX_to_MEM_bus_bits_regWriteID),
    .io_EX_to_MEM_bus_bits_regWriteEn   (_excute_unit_io_EX_to_MEM_bus_bits_regWriteEn),
    .io_EX_ALUResult_Pass               (_excute_unit_io_EX_ALUResult_Pass)
  );
  MEM_pre_stage pre_mem_unit (	// top.scala:68:30
    .clock                                 (clock),
    .reset                                 (reset),
    .io_EX_to_MEM_bus_valid                (_excute_unit_io_EX_to_MEM_bus_valid),	// top.scala:67:29
    .io_EX_to_MEM_bus_bits_Inst            (_excute_unit_io_EX_to_MEM_bus_bits_Inst),	// top.scala:67:29
    .io_EX_to_MEM_bus_bits_PC              (_excute_unit_io_EX_to_MEM_bus_bits_PC),	// top.scala:67:29
    .io_EX_to_MEM_bus_bits_ALU_result      (_excute_unit_io_EX_to_MEM_bus_bits_ALU_result),	// top.scala:67:29
    .io_EX_to_MEM_bus_bits_memWriteData    (_excute_unit_io_EX_to_MEM_bus_bits_memWriteData),	// top.scala:67:29
    .io_EX_to_MEM_bus_bits_memWriteEn      (_excute_unit_io_EX_to_MEM_bus_bits_memWriteEn),	// top.scala:67:29
    .io_EX_to_MEM_bus_bits_memReadEn       (_excute_unit_io_EX_to_MEM_bus_bits_memReadEn),	// top.scala:67:29
    .io_EX_to_MEM_bus_bits_lsutype         (_excute_unit_io_EX_to_MEM_bus_bits_lsutype),	// top.scala:67:29
    .io_EX_to_MEM_bus_bits_regWriteID      (_excute_unit_io_EX_to_MEM_bus_bits_regWriteID),	// top.scala:67:29
    .io_EX_to_MEM_bus_bits_regWriteEn      (_excute_unit_io_EX_to_MEM_bus_bits_regWriteEn),	// top.scala:67:29
    .axi_lite_readData_bits_data           (_arb_in_0_readData_bits_data),	// top.scala:153:21
    .io_PMEM_to_MEM_bus_valid              (_pre_mem_unit_io_PMEM_to_MEM_bus_valid),
    .io_PMEM_to_MEM_bus_bits_ALU_result    (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_ALU_result),
    .io_PMEM_to_MEM_bus_bits_regWriteEn    (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_regWriteEn),
    .io_PMEM_to_MEM_bus_bits_regWriteID    (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_regWriteID),
    .io_PMEM_to_MEM_bus_bits_memReadEn     (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_memReadEn),
    .io_PMEM_to_MEM_bus_bits_PC            (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_PC),
    .io_PMEM_to_MEM_bus_bits_Inst          (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_Inst),
    .io_PMEM_to_ID_forward_bits_ALU_result (_pre_mem_unit_io_PMEM_to_ID_forward_bits_ALU_result),
    .io_PMEM_to_ID_forward_bits_regWriteEn (_pre_mem_unit_io_PMEM_to_ID_forward_bits_regWriteEn),
    .io_PMEM_to_ID_forward_bits_regWriteID (_pre_mem_unit_io_PMEM_to_ID_forward_bits_regWriteID),
    .io_PMEM_to_ID_forward_bits_memReadEn  (_pre_mem_unit_io_PMEM_to_ID_forward_bits_memReadEn),
    .io_memReadData                        (_pre_mem_unit_io_memReadData),
    .axi_lite_writeAddr_valid              (_pre_mem_unit_axi_lite_writeAddr_valid),
    .axi_lite_writeAddr_bits_addr          (_pre_mem_unit_axi_lite_writeAddr_bits_addr),
    .axi_lite_writeData_valid              (_pre_mem_unit_axi_lite_writeData_valid),
    .axi_lite_writeData_bits_data          (_pre_mem_unit_axi_lite_writeData_bits_data),
    .axi_lite_writeData_bits_strb          (_pre_mem_unit_axi_lite_writeData_bits_strb),
    .axi_lite_writeResp_ready              (_pre_mem_unit_axi_lite_writeResp_ready),
    .axi_lite_readAddr_valid               (_pre_mem_unit_axi_lite_readAddr_valid),
    .axi_lite_readAddr_bits_addr           (_pre_mem_unit_axi_lite_readAddr_bits_addr),
    .axi_lite_readData_ready               (_pre_mem_unit_axi_lite_readData_ready),
    .axi_req_valid                         (_pre_mem_unit_axi_req_valid)
  );
  MEMU mem_unit (	// top.scala:69:26
    .clock                                  (clock),
    .reset                                  (reset),
    .io_PMEM_to_MEM_bus_valid               (_pre_mem_unit_io_PMEM_to_MEM_bus_valid),	// top.scala:68:30
    .io_PMEM_to_MEM_bus_bits_ALU_result     (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_ALU_result),	// top.scala:68:30
    .io_PMEM_to_MEM_bus_bits_regWriteEn     (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_regWriteEn),	// top.scala:68:30
    .io_PMEM_to_MEM_bus_bits_regWriteID     (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_regWriteID),	// top.scala:68:30
    .io_PMEM_to_MEM_bus_bits_memReadEn      (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_memReadEn),	// top.scala:68:30
    .io_PMEM_to_MEM_bus_bits_PC             (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_PC),	// top.scala:68:30
    .io_PMEM_to_MEM_bus_bits_Inst           (_pre_mem_unit_io_PMEM_to_MEM_bus_bits_Inst),	// top.scala:68:30
    .io_memReadData                         (_pre_mem_unit_io_memReadData),	// top.scala:68:30
    .io_MEM_to_WB_bus_valid                 (_mem_unit_io_MEM_to_WB_bus_valid),
    .io_MEM_to_WB_bus_bits_regWriteData     (_mem_unit_io_MEM_to_WB_bus_bits_regWriteData),
    .io_MEM_to_WB_bus_bits_regWriteEn       (_mem_unit_io_MEM_to_WB_bus_bits_regWriteEn),
    .io_MEM_to_WB_bus_bits_regWriteID       (_mem_unit_io_MEM_to_WB_bus_bits_regWriteID),
    .io_MEM_to_WB_bus_bits_PC               (_mem_unit_io_MEM_to_WB_bus_bits_PC),
    .io_MEM_to_WB_bus_bits_Inst             (_mem_unit_io_MEM_to_WB_bus_bits_Inst),
    .io_MEM_to_ID_forward_bits_regWriteData (_mem_unit_io_MEM_to_ID_forward_bits_regWriteData),
    .io_MEM_to_ID_forward_bits_regWriteEn   (_mem_unit_io_MEM_to_ID_forward_bits_regWriteEn),
    .io_MEM_to_ID_forward_bits_regWriteID   (_mem_unit_io_MEM_to_ID_forward_bits_regWriteID)
  );
  WBU wb_unit (	// top.scala:70:25
    .io_MEM_to_WB_bus_valid                (_mem_unit_io_MEM_to_WB_bus_valid),	// top.scala:69:26
    .io_MEM_to_WB_bus_bits_regWriteData    (_mem_unit_io_MEM_to_WB_bus_bits_regWriteData),	// top.scala:69:26
    .io_MEM_to_WB_bus_bits_regWriteEn      (_mem_unit_io_MEM_to_WB_bus_bits_regWriteEn),	// top.scala:69:26
    .io_MEM_to_WB_bus_bits_regWriteID      (_mem_unit_io_MEM_to_WB_bus_bits_regWriteID),	// top.scala:69:26
    .io_MEM_to_WB_bus_bits_PC              (_mem_unit_io_MEM_to_WB_bus_bits_PC),	// top.scala:69:26
    .io_MEM_to_WB_bus_bits_Inst            (_mem_unit_io_MEM_to_WB_bus_bits_Inst),	// top.scala:69:26
    .io_WB_to_ID_forward_valid             (io_WB_valid),
    .io_WB_to_ID_forward_bits_regWriteData (_wb_unit_io_WB_to_ID_forward_bits_regWriteData),
    .io_WB_to_ID_forward_bits_regWriteEn   (_wb_unit_io_WB_to_ID_forward_bits_regWriteEn),
    .io_WB_to_ID_forward_bits_regWriteID   (_wb_unit_io_WB_to_ID_forward_bits_regWriteID),
    .io_WB_pc                              (io_WB_pc),
    .io_WB_Inst                            (_wb_unit_io_WB_Inst)
  );
  sim_sram inst_ram (	// top.scala:72:30
    .pc      (64'h0),	// top.scala:153:21
    .aclk    (1'h0),	// top.scala:153:21
    .aresetn (1'h0),	// top.scala:153:21
    .araddr  (32'h0),	// top.scala:153:21
    .arvalid (1'h0),	// top.scala:153:21
    .rready  (1'h0),	// top.scala:153:21
    .awaddr  (32'h0),	// top.scala:153:21
    .awvalid (1'h0),	// top.scala:153:21
    .wdata   (64'h0),	// top.scala:153:21
    .wstrb   (8'h0),	// top.scala:153:21
    .wvalid  (1'h0),	// top.scala:153:21
    .bready  (1'h0),	// top.scala:153:21
    .arready (_inst_ram_arready),
    .rdata   (_inst_ram_rdata),
    .rresp   (_inst_ram_rresp),
    .rvalid  (_inst_ram_rvalid),
    .awready (_inst_ram_awready),
    .wready  (_inst_ram_wready),
    .bresp   (_inst_ram_bresp),
    .bvalid  (_inst_ram_bvalid)
  );
  RAMU ram_unit (	// top.scala:152:26
    .clock                        (clock),
    .reset                        (reset),
    .axi_lite_writeAddr_valid     (_arb_out_writeAddr_valid),	// top.scala:153:21
    .axi_lite_writeAddr_bits_addr (_arb_out_writeAddr_bits_addr),	// top.scala:153:21
    .axi_lite_writeData_valid     (_arb_out_writeData_valid),	// top.scala:153:21
    .axi_lite_writeData_bits_data (_arb_out_writeData_bits_data),	// top.scala:153:21
    .axi_lite_writeData_bits_strb (_arb_out_writeData_bits_strb),	// top.scala:153:21
    .axi_lite_writeResp_ready     (_arb_out_writeResp_ready),	// top.scala:153:21
    .axi_lite_readAddr_valid      (_arb_out_readAddr_valid),	// top.scala:153:21
    .axi_lite_readAddr_bits_addr  (_arb_out_readAddr_bits_addr),	// top.scala:153:21
    .axi_lite_readData_ready      (_arb_out_readData_ready),	// top.scala:153:21
    .axi_lite_readData_valid      (_ram_unit_axi_lite_readData_valid),
    .axi_lite_readData_bits_data  (_ram_unit_axi_lite_readData_bits_data),
    .axi_lite_readData_bits_resp  (_ram_unit_axi_lite_readData_bits_resp)
  );
  AXI_Arbiter arb (	// top.scala:153:21
    .in_0_writeAddr_valid     (_pre_mem_unit_axi_lite_writeAddr_valid),	// top.scala:68:30
    .in_0_writeAddr_bits_addr (_pre_mem_unit_axi_lite_writeAddr_bits_addr),	// top.scala:68:30
    .in_0_writeData_valid     (_pre_mem_unit_axi_lite_writeData_valid),	// top.scala:68:30
    .in_0_writeData_bits_data (_pre_mem_unit_axi_lite_writeData_bits_data),	// top.scala:68:30
    .in_0_writeData_bits_strb (_pre_mem_unit_axi_lite_writeData_bits_strb),	// top.scala:68:30
    .in_0_writeResp_ready     (_pre_mem_unit_axi_lite_writeResp_ready),	// top.scala:68:30
    .in_0_readAddr_valid      (_pre_mem_unit_axi_lite_readAddr_valid),	// top.scala:68:30
    .in_0_readAddr_bits_addr  (_pre_mem_unit_axi_lite_readAddr_bits_addr),	// top.scala:68:30
    .in_0_readData_ready      (_pre_mem_unit_axi_lite_readData_ready),	// top.scala:68:30
    .in_1_readAddr_valid      (_inst_fetch_unit_axi_lite_readAddr_valid),	// top.scala:65:33
    .in_1_readAddr_bits_addr  (_inst_fetch_unit_axi_lite_readAddr_bits_addr),	// top.scala:65:33
    .in_1_readData_ready      (_inst_fetch_unit_axi_lite_readData_ready),	// top.scala:65:33
    .req_0_valid              (_pre_mem_unit_axi_req_valid),	// top.scala:68:30
    .out_readData_valid       (_ram_unit_axi_lite_readData_valid),	// top.scala:152:26
    .out_readData_bits_data   (_ram_unit_axi_lite_readData_bits_data),	// top.scala:152:26
    .out_readData_bits_resp   (_ram_unit_axi_lite_readData_bits_resp),	// top.scala:152:26
    .in_0_readData_bits_data  (_arb_in_0_readData_bits_data),
    .in_1_readData_valid      (_arb_in_1_readData_valid),
    .in_1_readData_bits_data  (_arb_in_1_readData_bits_data),
    .in_1_readData_bits_resp  (_arb_in_1_readData_bits_resp),
    .req_0_ready              (io_MEM_AXIREQ),
    .req_1_ready              (_arb_req_1_ready),
    .out_writeAddr_valid      (_arb_out_writeAddr_valid),
    .out_writeAddr_bits_addr  (_arb_out_writeAddr_bits_addr),
    .out_writeData_valid      (_arb_out_writeData_valid),
    .out_writeData_bits_data  (_arb_out_writeData_bits_data),
    .out_writeData_bits_strb  (_arb_out_writeData_bits_strb),
    .out_writeResp_ready      (_arb_out_writeResp_ready),
    .out_readAddr_valid       (_arb_out_readAddr_valid),
    .out_readAddr_bits_addr   (_arb_out_readAddr_bits_addr),
    .out_readData_ready       (_arb_out_readData_ready)
  );
  assign io_ID_npc = _inst_decode_unit_io_ID_to_BPU_bus_bits_br_target;	// <stdin>:2400:10, top.scala:66:34
  assign io_PF_pc = _inst_fetch_unit_io_PF_pc;	// <stdin>:2400:10, top.scala:65:33
  assign io_PF_axidata = _inst_fetch_unit_io_axidata;	// <stdin>:2400:10, top.scala:65:33
  assign io_IF_pc = _inst_fetch_unit_io_IF_to_ID_bus_bits_PC;	// <stdin>:2400:10, top.scala:65:33
  assign io_ID_pc = _inst_decode_unit_io_ID_to_EX_bus_bits_PC;	// <stdin>:2400:10, top.scala:66:34
  assign io_EX_pc = _excute_unit_io_EX_to_MEM_bus_bits_PC;	// <stdin>:2400:10, top.scala:67:29
  assign io_PMEM_pc = _pre_mem_unit_io_PMEM_to_MEM_bus_bits_PC;	// <stdin>:2400:10, top.scala:68:30
  assign io_WB_Inst = _wb_unit_io_WB_Inst;	// <stdin>:2400:10, top.scala:70:25
  assign io_WB_RegWriteData = _wb_unit_io_WB_to_ID_forward_bits_regWriteData;	// <stdin>:2400:10, top.scala:70:25
  assign io_WB_RegWriteID = {59'h0, _wb_unit_io_WB_to_ID_forward_bits_regWriteID};	// <stdin>:2400:10, top.scala:70:25, :102:24
  assign io_MEM_RegWriteData = _arb_in_0_readData_bits_data;	// <stdin>:2400:10, top.scala:153:21
  assign io_bp_npc = _bp_unit_io_bp_npc;	// <stdin>:2400:10, top.scala:64:33
  assign io_bp_taken = _bp_unit_io_bp_taken;	// <stdin>:2400:10, top.scala:64:33
  assign io_bp_flush = _bp_unit_io_bp_flush;	// <stdin>:2400:10, top.scala:64:33
  assign io_IF_Inst = _inst_fetch_unit_io_IF_to_ID_bus_bits_Inst;	// <stdin>:2400:10, top.scala:65:33
  assign io_IF_valid = _inst_fetch_unit_io_IF_to_ID_bus_valid;	// <stdin>:2400:10, top.scala:65:33
  assign io_IF_AXIREQ = _arb_req_1_ready;	// <stdin>:2400:10, top.scala:153:21
  assign io_ID_ALU_Data1 = _inst_decode_unit_io_ID_to_EX_bus_bits_ALU_Data1;	// <stdin>:2400:10, top.scala:66:34
  assign io_ID_ALU_Data2 = _inst_decode_unit_io_ID_to_EX_bus_bits_ALU_Data2;	// <stdin>:2400:10, top.scala:66:34
  assign io_ID_Rs2Data = _inst_decode_unit_io_ID_to_EX_bus_bits_rs2_data;	// <stdin>:2400:10, top.scala:66:34
  assign io_ALUResult = _excute_unit_io_EX_to_MEM_bus_bits_ALU_result;	// <stdin>:2400:10, top.scala:67:29
endmodule


// ----- 8< ----- FILE "./build/sim_sram.v" ----- 8< -----

import "DPI-C" function void dci_pmem_write(input longint waddr, input longint wdata, input byte wmask);
import "DPI-C" function void dci_pmem_read(input longint raddr, output longint rdata, input byte rmask);

module sim_sram(
    input       [63:0]      pc          ,         //for debug
    input                   aresetn     ,
    input                   aclk        ,
    //ar
    input       [31:0]      araddr      ,
    input                   arvalid     ,
    output                  arready     ,
    //r
    output      [63:0]      rdata       ,
    output      [1: 0]      rresp       ,
    output                  rvalid      ,
    input                   rready      ,
    //aw
    input       [31:0]      awaddr      ,
    input                   awvalid     ,
    output                  awready     , 
    //w
    input       [63:0]      wdata       , 
    input       [7: 0]      wstrb       ,
    input                   wvalid      ,
    output                  wready      ,
    //b
    output      [1: 0]      bresp       ,
    output                  bvalid      ,
    input                   bready
);

    reg arready_r, rvalid_r, awready_r, wready_r, bvalid_r;
    reg [1:0] rresp_r, bresp_r;
    reg [63:0] rdata_r;
    reg [31:0] awaddr_r;
 
    assign arready = arready_r;
    assign rvalid = rvalid_r;
    assign awready = awready_r;
    assign wready = wready_r;
    assign bvalid = bvalid_r;
    assign rresp = rresp_r;
    assign bresp = bresp_r;
    assign rdata = rdata_r;

    //ar      
    always@(posedge aclk) begin
        if(!aresetn) begin
            arready_r <= 1'b1;
        end
        else if(arvalid) begin
            arready_r <= 1'b1;
        end
        else 
            arready_r <= 1'b1;
    end

    //rresp
    always@(posedge aclk) begin
        if(!aresetn) begin
            rvalid_r <= 1'b0;
            rresp_r  <= 2'b0;
        end
        else begin
            if(arready_r & arvalid) begin
                rvalid_r <= 1'b1;
                rresp_r  <= 2'b00;
            end
            else if(rvalid_r & rready) begin
                rvalid_r <= 1'b0;
            end
        end 
    end

    //r
    always@(posedge aclk) begin
        if(!aresetn) begin
            rdata_r = 64'b0;
        end
        else begin
            if(arready_r & arvalid) begin
                dci_pmem_read({32'H0000, araddr}, rdata_r, 8'HFF);
                // $display("raddr:0x%x rdata:0x%x", araddr, rdata);
            end
        end
        // $display("addr:0x%x, rdata:0x%x", araddr_r, rdata_r);
    end

    //aw
    always@(posedge aclk) begin
        if(!aresetn) begin
            awready_r <= 1'b1;
            awaddr_r <= 32'b0;
        end
        else begin
            if(awvalid) begin
                awaddr_r <= awaddr;
                awready_r <= 1'b1;
            end
        end
    end

    //w
    always@(posedge aclk) begin
        if(!aresetn) begin
            wready_r <= 1'b1;
        end
        else begin
            if(wvalid & awvalid)  begin
                dci_pmem_write({32'H0000, awaddr}, wdata, wstrb);
            end
        end
    end

    //b
    always@(posedge aclk) begin
        if(!aresetn) begin
            bvalid_r <= 1'b0;
            bresp_r  <= 2'b00;
        end
        else begin
            if(wready_r & wvalid & wready_r) begin
                bvalid_r <= 1'b1;
                bresp_r  <= 2'b00;
            end
            else if(bready & bvalid_r)
                bvalid_r <= 1'b0;
        end
    end

endmodule

// ----- 8< ----- FILE "./build/sim.v" ----- 8< -----

import "DPI-C" function void set_gpr_ptr(input logic [63:0] a []);
import "DPI-C" function void unknown_inst();
import "DPI-C" function void ebreak(input longint halt_ret);

module sim(input[63:0] IF_pc, input [63:0] GPR [31:0], input unknown_inst_flag, input[31:0] WB_Inst);

   initial begin
      if ($test$plusargs("trace") != 0) begin
         $display("[%0t] Tracing to logs/vlt_dump.vcd...\n", $time);
         $dumpfile("logs/vlt_dump.vcd");
         $dumpvars();
      end
      $display("[%0t] Model running...\n", $time);
   end

   initial set_gpr_ptr(GPR);    // rf为通用寄存器的二维数组变量

  always@(*) begin
      reg [63:0] i = GPR[10][63:0];
      if(unknown_inst_flag) unknown_inst();
      if(WB_Inst[31:0] == 32'h00100073) begin
        ebreak(i);
        $finish();
      end
  end

endmodule

// ----- 8< ----- FILE "firrtl_black_box_resource_files.f" ----- 8< -----

