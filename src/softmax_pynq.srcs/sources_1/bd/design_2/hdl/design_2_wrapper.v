//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Jun  5 23:37:49 2018
//Host        : DESKTOP-RQ40L4D running 64-bit major release  (build 9200)
//Command     : generate_target design_2_wrapper.bd
//Design      : design_2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_2_wrapper
   (P_0,
    clk_0,
    en_0,
    fix_num_0,
    point_position_0,
    rst_n_0,
    sum_0);
  output [31:0]P_0;
  input clk_0;
  input en_0;
  input [15:0]fix_num_0;
  input [2:0]point_position_0;
  input rst_n_0;
  output [63:0]sum_0;

  wire [31:0]P_0;
  wire clk_0;
  wire en_0;
  wire [15:0]fix_num_0;
  wire [2:0]point_position_0;
  wire rst_n_0;
  wire [63:0]sum_0;

  design_2 design_2_i
       (.P_0(P_0),
        .clk_0(clk_0),
        .en_0(en_0),
        .fix_num_0(fix_num_0),
        .point_position_0(point_position_0),
        .rst_n_0(rst_n_0),
        .sum_0(sum_0));
endmodule
