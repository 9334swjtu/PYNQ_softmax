`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 20:21:17
// Design Name: 
// Module Name: myrom4bit
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


module myrom4bit
  #(
    parameter RESULT_00 = 16'h0,
    parameter RESULT_01 = 16'h0,
    parameter RESULT_02 = 16'h0,
    parameter RESULT_03 = 16'h0,
    parameter RESULT_04 = 16'h0,
    parameter RESULT_05 = 16'h0,
    parameter RESULT_06 = 16'h0,
    parameter RESULT_07 = 16'h0,
    parameter RESULT_08 = 16'h0,
    parameter RESULT_09 = 16'h0,
    parameter RESULT_10 = 16'h0,
    parameter RESULT_11 = 16'h0,
    parameter RESULT_12 = 16'h0,
    parameter RESULT_13 = 16'h0,
    parameter RESULT_14 = 16'h0,
    parameter RESULT_15 = 16'h0
    )
   (
    input [3:0] cur_substrate_N,
    input             clk,
    input             rst_n,
    output reg [15:0] cur_result
    );

   always @ (posedge clk or negedge rst_n)
     begin
        if(rst_n == 0)
          begin
             cur_result <= 0;
          end
        else
          begin
             case(cur_substrate_N)
               5'd0:cur_result <= RESULT_00;
               5'd1:cur_result <= RESULT_01;
               5'd2:cur_result <= RESULT_02;
               5'd3:cur_result <= RESULT_03;
               5'd4:cur_result <= RESULT_04;
               5'd5:cur_result <= RESULT_05;
               5'd6:cur_result <= RESULT_06;
               5'd7:cur_result <= RESULT_07;
               5'd8:cur_result <= RESULT_08;
               5'd9:cur_result <= RESULT_09;
               5'd10:cur_result <= RESULT_10;
               5'd11:cur_result <= RESULT_11;
               5'd12:cur_result <= RESULT_12;
               5'd13:cur_result <= RESULT_13;
               5'd14:cur_result <= RESULT_14;
               5'd15:cur_result <= RESULT_15;
               default:cur_result <= 0;
             endcase
          end
     end

endmodule
