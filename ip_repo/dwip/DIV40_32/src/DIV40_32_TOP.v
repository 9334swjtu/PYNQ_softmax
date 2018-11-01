`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/26 22:21:58
// Design Name: 
// Module Name: DIV40_32_TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DIV40_32_TOP(clk, rst_n, en, a, b,
                        quotient, remainder, divide_by_0 );

  parameter inst_a_width = 40;
  parameter inst_b_width = 32;
  parameter inst_tc_mode = 0;
  parameter inst_rem_mode = 1;
  parameter inst_num_stages = 64;
  parameter inst_stall_mode = 1;
  parameter inst_rst_mode = 1;
  parameter inst_op_iso_mode = 0;

  input clk;
  input rst_n;
  input en;
  input [39 : 0] a;
  input [31 : 0] b;
  output [39 : 0] quotient;
  output [31 : 0] remainder;
  output divide_by_0;


  DW_div_pipe_inst 
    U1 (.clk(clk),   .rst_n(rst_n),   .en(en),
        .a(a),   .b(b),   .quotient(quotient),
        .remainder(remainder),   .divide_by_0(divide_by_0) );
endmodule
