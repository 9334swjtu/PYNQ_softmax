//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Jun  5 23:37:49 2018
//Host        : DESKTOP-RQ40L4D running 64-bit major release  (build 9200)
//Command     : generate_target design_2.bd
//Design      : design_2
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_2,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=20,numReposBlks=20,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=14,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=6,synth_mode=Global}" *) (* HW_HANDOFF = "design_2.hwdef" *) 
module design_2
   (P_0,
    clk_0,
    en_0,
    fix_num_0,
    point_position_0,
    rst_n_0,
    sum_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.P_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.P_0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value FALSE}}}} DATA_WIDTH 32}" *) output [31:0]P_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_n_0, CLK_DOMAIN design_2_clk_0, FREQ_HZ 100000000, PHASE 0.000" *) input clk_0;
  input en_0;
  input [15:0]fix_num_0;
  input [2:0]point_position_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_N_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_N_0, POLARITY ACTIVE_LOW" *) input rst_n_0;
  output [63:0]sum_0;

  wire clk_0_1;
  wire en_0_1;
  wire [15:0]fix_num_0_1;
  wire [3:0]fix_shift_0_after_point_0;
  wire [3:0]fix_shift_0_after_point_1;
  wire [3:0]fix_shift_0_after_point_2;
  wire [3:0]fix_shift_0_after_point_3;
  wire [4:0]fix_shift_0_befor_point;
  wire [31:0]mult_gen_0_P;
  wire [63:0]multiply32_32_0_outdata;
  wire [63:0]multiply32_32_1_outdata;
  wire [63:0]multiply32_32_2_outdata;
  wire [63:0]multiply32_32_3_outdata;
  wire [31:0]myrom4bit_4_cur_result;
  wire [31:0]myrom4bit_5_cur_result;
  wire [31:0]myrom4bit_6_cur_result;
  wire [31:0]myrom4bit_7_cur_result;
  wire [31:0]myrom5bit_1_cur_result;
  wire [31:0]myslice_0_dout;
  wire [31:0]myslice_1_dout;
  wire [31:0]myslice_2_dout;
  wire not_gate_0_b;
  wire [2:0]point_position_0_1;
  wire [31:0]reg5_0_dout;
  wire [31:0]reg5_1_dout;
  wire rst_n_0_1;
  wire [63:0]summary_0_sum;
  wire [31:0]xlconcat_0_dout;
  wire [12:0]xlconstant_0_dout;

  assign P_0[31:0] = mult_gen_0_P;
  assign clk_0_1 = clk_0;
  assign en_0_1 = en_0;
  assign fix_num_0_1 = fix_num_0[15:0];
  assign point_position_0_1 = point_position_0[2:0];
  assign rst_n_0_1 = rst_n_0;
  assign sum_0[63:0] = summary_0_sum;
  design_2_fix_shift_0_0 fix_shift_0
       (.after_point_0(fix_shift_0_after_point_0),
        .after_point_1(fix_shift_0_after_point_1),
        .after_point_2(fix_shift_0_after_point_2),
        .after_point_3(fix_shift_0_after_point_3),
        .befor_point(fix_shift_0_befor_point),
        .clk(clk_0_1),
        .input_data(xlconcat_0_dout),
        .rst(rst_n_0_1));
  design_2_multiply32_32_0_0 multiply32_32_0
       (.clk(clk_0_1),
        .dataA(myrom4bit_4_cur_result),
        .dataB(myrom4bit_5_cur_result),
        .outdata(multiply32_32_0_outdata),
        .rst(not_gate_0_b));
  design_2_multiply32_32_0_1 multiply32_32_1
       (.clk(clk_0_1),
        .dataA(myrom4bit_6_cur_result),
        .dataB(myrom4bit_7_cur_result),
        .outdata(multiply32_32_1_outdata),
        .rst(not_gate_0_b));
  design_2_multiply32_32_0_2 multiply32_32_2
       (.clk(clk_0_1),
        .dataA(myslice_2_dout),
        .dataB(reg5_1_dout),
        .outdata(multiply32_32_2_outdata),
        .rst(not_gate_0_b));
  design_2_multiply32_32_2_0 multiply32_32_3
       (.clk(clk_0_1),
        .dataA(myslice_0_dout),
        .dataB(myslice_1_dout),
        .outdata(multiply32_32_3_outdata),
        .rst(not_gate_0_b));
  design_2_myrom4bit_0_2 myrom4bit_4
       (.clk(clk_0_1),
        .cur_result(myrom4bit_4_cur_result),
        .cur_substrate_N(fix_shift_0_after_point_0),
        .rst_n(rst_n_0_1));
  design_2_myrom4bit_1_1 myrom4bit_5
       (.clk(clk_0_1),
        .cur_result(myrom4bit_5_cur_result),
        .cur_substrate_N(fix_shift_0_after_point_1),
        .rst_n(rst_n_0_1));
  design_2_myrom4bit_2_1 myrom4bit_6
       (.clk(clk_0_1),
        .cur_result(myrom4bit_6_cur_result),
        .cur_substrate_N(fix_shift_0_after_point_2),
        .rst_n(rst_n_0_1));
  design_2_myrom4bit_3_0 myrom4bit_7
       (.clk(clk_0_1),
        .cur_result(myrom4bit_7_cur_result),
        .cur_substrate_N(fix_shift_0_after_point_3),
        .rst_n(rst_n_0_1));
  design_2_myrom5bit_0_1 myrom5bit_1
       (.clk(clk_0_1),
        .cur_result(myrom5bit_1_cur_result),
        .cur_substrate_N(fix_shift_0_befor_point),
        .rst_n(rst_n_0_1));
  design_2_myslice_0_0 myslice_0
       (.din(multiply32_32_0_outdata),
        .dout(myslice_0_dout));
  design_2_myslice_0_1 myslice_1
       (.din(multiply32_32_1_outdata),
        .dout(myslice_1_dout));
  design_2_myslice_1_0 myslice_2
       (.din(multiply32_32_3_outdata),
        .dout(myslice_2_dout));
  design_2_myslice_2_0 myslice_3
       (.din(multiply32_32_2_outdata),
        .dout(mult_gen_0_P));
  design_2_not_gate_0_0 not_gate_0
       (.a(rst_n_0_1),
        .b(not_gate_0_b));
  design_2_reg5_0_0 reg5_0
       (.clk(clk_0_1),
        .din(myrom5bit_1_cur_result),
        .dout(reg5_0_dout),
        .rst(rst_n_0_1));
  design_2_reg5_0_1 reg5_1
       (.clk(clk_0_1),
        .din(reg5_0_dout),
        .dout(reg5_1_dout),
        .rst(rst_n_0_1));
  design_2_summary_0_0 summary_0
       (.clk(clk_0_1),
        .cur_state({1'b0,1'b0}),
        .data_in(mult_gen_0_P),
        .en(en_0_1),
        .rst(rst_n_0_1),
        .sum(summary_0_sum));
  design_2_xlconcat_0_0 xlconcat_0
       (.In0(fix_num_0_1),
        .In1(xlconstant_0_dout),
        .In2(point_position_0_1),
        .dout(xlconcat_0_dout));
  design_2_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
