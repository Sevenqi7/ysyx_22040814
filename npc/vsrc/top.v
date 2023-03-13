module top(
  input        clk,
  input        rst,
  input        ps2_clk,
  input        ps2_data,
  input  [7:0] io_sw,
  output [6:0] io_seg_0,
  output [6:0] io_seg_1,
  output [6:0] io_seg_2,
  output [6:0] io_seg_3,
  output [6:0] io_seg_4,
  output [6:0] io_seg_5,
  output [6:0] io_seg_6,
  output [6:0] io_seg_7
);
  wire [7:0] seg0decoder_io_in; // @[top.scala 26:29]
  wire [6:0] seg0decoder_io_out; // @[top.scala 26:29]
  wire [7:0] seg1decoder_io_in; // @[top.scala 27:29]
  wire [6:0] seg1decoder_io_out; // @[top.scala 27:29]
  wire [7:0] seg3decoder_io_in;
  wire [6:0] seg3decoder_io_out;
  wire [7:0] seg4decoder_io_in;
  wire [6:0] seg4decoder_io_out;
  wire [7:0] seg6decoder_io_in;
  wire [6:0] seg6decoder_io_out;
  wire [7:0] seg7decoder_io_in;
  wire [6:0] seg7decoder_io_out;
  wire  keyboard_io_ps2_clk; // @[top.scala 29:26]
  wire  keyboard_io_ps2_data; // @[top.scala 29:26]
  wire [7:0] keyboard_io_data; // @[top.scala 29:26]
  wire [1:0] keyboard_io_state;
  wire [7:0] keyboard_io_push_cnt;

  reg [7:0] scan_to_ascii [255:0];

  DE10HexDecoder seg0decoder ( // @[top.scala 26:29]
    .io_in(seg0decoder_io_in),
    .io_out(seg0decoder_io_out)
  );
  DE10HexDecoder seg1decoder ( // @[top.scala 27:29]
    .io_in(seg1decoder_io_in),
    .io_out(seg1decoder_io_out)
  );
  DE10HexDecoder seg3decoder ( // @[top.scala 27:29]
    .io_in(seg3decoder_io_in),
    .io_out(seg3decoder_io_out)
  );
  DE10HexDecoder seg4decoder ( // @[top.scala 27:29]
    .io_in(seg4decoder_io_in),
    .io_out(seg4decoder_io_out)
  );
  DE10HexDecoder seg6decoder ( // @[top.scala 27:29]
    .io_in(seg6decoder_io_in),
    .io_out(seg6decoder_io_out)
  );
  DE10HexDecoder seg7decoder ( // @[top.scala 27:29]
    .io_in(seg7decoder_io_in),
    .io_out(seg7decoder_io_out)
  );
  ps2_keyboard keyboard ( // @[top.scala 29:26]
    .clk(clk),
    .resetn(~rst),
    .ps2_clk(keyboard_io_ps2_clk),
    .ps2_data(keyboard_io_ps2_data),
    .data(keyboard_io_data),
    .state(keyboard_io_state),
    .push_cnt(keyboard_io_push_cnt)
  );

  wire [7:0] ascii = scan_to_ascii[keyboard_io_data];


  assign io_seg_0 = seg0decoder_io_out; // @[top.scala 35:15]
  assign io_seg_1 = seg1decoder_io_out; // @[top.scala 36:15]
  assign io_seg_2 = 7'h7f; // @[top.scala 44:15]
  assign io_seg_3 = seg3decoder_io_out;// @[top.scala 38:15]
  assign io_seg_4 = seg4decoder_io_out; // @[top.scala 39:15]
  assign io_seg_5 = 7'h7f; // @[top.scala 43:15]
  assign io_seg_6 = seg6decoder_io_out;
  assign io_seg_7 = seg7decoder_io_out;
  assign seg6decoder_io_in = {{4'd0}, keyboard_io_push_cnt[3:0]}; // @[top.scala 40:15]
  assign seg7decoder_io_in = {{4'd0}, keyboard_io_push_cnt[7:4]}; // @[top.scala 41:15]
  assign seg0decoder_io_in = keyboard_io_state == 2'b00 ? 8'b11111111 : {{4'd0}, keyboard_io_data[3:0]}; // @[top.scala 31:23]
  assign seg1decoder_io_in = keyboard_io_state == 2'b00 ? 8'b11111111 : {{4'd0}, keyboard_io_data[7:4]}; // @[top.scala 32:23]
  assign seg3decoder_io_in = keyboard_io_state == 2'b00 ? 8'b11111111 : {{4'd0}, ascii[3:0]}; // @[top.scala 31:23]
  assign seg4decoder_io_in = keyboard_io_state == 2'b00 ? 8'b11111111 : {{4'd0}, ascii[7:4]}; // @[top.scala 31:23]

  assign keyboard_io_ps2_clk = ps2_clk; // @[top.scala 33:25]
  assign keyboard_io_ps2_data = ps2_data; // @[top.scala 34:26]

/************LUT*************/
  always@(posedge clk) begin
      if(rst) begin
    // Numbers
          scan_to_ascii[8'h16] <="1";
          scan_to_ascii[8'h1E] <="2";
          scan_to_ascii[8'h26] <="3";
          scan_to_ascii[8'h25] <="4";
          scan_to_ascii[8'h2E] <="5";
          scan_to_ascii[8'h36] <="6";
          scan_to_ascii[8'h3D] <="7";
          scan_to_ascii[8'h3E] <="8";
          scan_to_ascii[8'h46] <="9";
          scan_to_ascii[8'h45] <="0";
          // Letters (lowercase)
          scan_to_ascii[8'h1C] <="a";
          scan_to_ascii[8'h32] <="b";
          scan_to_ascii[8'h21] <="c";
          scan_to_ascii[8'h23] <="d";
          scan_to_ascii[8'h24] <="e";
          scan_to_ascii[8'h2B] <="f";
          scan_to_ascii[8'h34] <="g";
          scan_to_ascii[8'h33] <="h";
          scan_to_ascii[8'h43] <="i";
          scan_to_ascii[8'h3B] <="j";
          scan_to_ascii[8'h42] <="k";
          scan_to_ascii[8'h4B] <="l";
          scan_to_ascii[8'h3A] <="m";
          scan_to_ascii[8'h31] <="n";
          scan_to_ascii[8'h44] <="o";
          scan_to_ascii[8'h4D] <="p";
          scan_to_ascii[8'h15] <="q";
          scan_to_ascii[8'h2D] <="r";
          scan_to_ascii[8'h1B] <="s";
          scan_to_ascii[8'h2C] <="t";
          scan_to_ascii[8'h3C] <="u";
          scan_to_ascii[8'h2A] <="v";
          scan_to_ascii[8'h1D] <="w";
          scan_to_ascii[8'h22] <="x";
          scan_to_ascii[8'h35] <="y";
          scan_to_ascii[8'h1A] <="z";
          $display("scanto:%x", scan_to_ascii[8'h1e]);
      end
  end
  

/************LUT*************/
endmodule
