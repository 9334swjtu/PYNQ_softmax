`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/06 18:55:49
// Design Name: 
// Module Name: data_distribute
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


module data_distribute(
    input [15:0]      n,
    output [3:0]      out_1,
    output [3:0]      out_2,
    output [3:0]      out_3,
    output [3:0]      out_4,

    input             clk,
    input             rst,
    output reg        mul4_rst
    );


   reg [15:0]        input_reg;


   assign out_1 = n[15:12];
   assign out_2 = n[11:8];
   assign out_3 = n[7:4];
   assign out_4 = n[3:0];

   always @ (posedge clk or posedge rst)
     begin
        if(rst)
          begin
             input_reg <= 0;
          end
        else
          begin
             if(n != input_reg)
               begin
                  input_reg <= n;
                  mul4_rst <= 1;
               end
             else
               mul4_rst <= 0;
          end
     end
endmodule
