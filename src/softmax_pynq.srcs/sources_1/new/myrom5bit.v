`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 20:07:15
// Design Name: 
// Module Name: myrom5bit
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

module myrom5bit
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
    parameter RESULT_15 = 16'h0,
    parameter RESULT_16 = 16'h0,
    parameter RESULT_17 = 16'h0,
    parameter RESULT_18 = 16'h0,
    parameter RESULT_19 = 16'h0,
    parameter RESULT_20 = 16'h0,
    parameter RESULT_21 = 16'h0,
    parameter RESULT_22 = 16'h0,
    parameter RESULT_23 = 16'h0,
    parameter RESULT_24 = 16'h0,
    parameter RESULT_25 = 16'h0,
    parameter RESULT_26 = 16'h0,
    parameter RESULT_27 = 16'h0,
    parameter RESULT_28 = 16'h0,
    parameter RESULT_29 = 16'h0,
    parameter RESULT_30 = 16'h0,
    parameter RESULT_31 = 16'h0
    )
   (
    input [4:0] cur_substrate_N,
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
               5'd16:cur_result <= RESULT_16;
               5'd17:cur_result <= RESULT_17;
               5'd18:cur_result <= RESULT_18;
               5'd19:cur_result <= RESULT_19;
               5'd20:cur_result <= RESULT_20;
               5'd21:cur_result <= RESULT_21;
               5'd22:cur_result <= RESULT_22;
               5'd23:cur_result <= RESULT_23;
               5'd24:cur_result <= RESULT_24;
               5'd25:cur_result <= RESULT_25;
               5'd26:cur_result <= RESULT_26;
               5'd27:cur_result <= RESULT_27;
               5'd28:cur_result <= RESULT_28;
               5'd29:cur_result <= RESULT_29;
               5'd30:cur_result <= RESULT_30;
               5'd31:cur_result <= RESULT_31;
               default:cur_result <= 0;
             endcase
          end
     end

endmodule
