`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/31 18:45:40
// Design Name: 
// Module Name: custom_register
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


module custom_register
  #(
    parameter integer bits = 1
    )
   (
    input wire          clk,
    input wire          rst,
    input wire [bits:0] data_in,
    output reg [bits:0] data_out
    );

   always @ (posedge clk or negedge rst)
     begin
        if(rst == 0)
          begin
             data_out <= 0;
          end
        else
          begin
             data_out <= data_in;
          end
     end
endmodule
