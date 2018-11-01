`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/21 22:48:32
// Design Name: 
// Module Name: substrate
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


module substrate
  #(
   parameter BIT_NUM = 5'b00000,
   parameter RESULT_00 = 16'b0,
   parameter RESULT_01 = 16'b0,
   parameter RESULT_02 = 16'b0,
   parameter RESULT_03 = 16'b0,
   parameter RESULT_04 = 16'b0,
   parameter RESULT_05 = 16'b0,
   parameter RESULT_06 = 16'b0,
   parameter RESULT_07 = 16'b0,
   parameter RESULT_08 = 16'b0,
   parameter RESULT_09 = 16'b0,
   parameter RESULT_10 = 16'b0,
   parameter RESULT_11 = 16'b0,
   parameter RESULT_12 = 16'b0,
   parameter RESULT_13 = 16'b0,
   parameter RESULT_14 = 16'b0,
   parameter RESULT_15 = 16'b0
   )
  (
   input [BIT_NUM:0] cur_substrate,
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
             case(cur_substrate)
             endcase
          end
     end

endmodule
