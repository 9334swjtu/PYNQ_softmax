`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/22 22:30:51
// Design Name: 
// Module Name: myresigter
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


module myresigter(
                  input             clk,
                  input             rst_n,
                  input [31:0]      data_in,
                  output reg [31:0] data_out
    );

   always @ (posedge clk or negedge rst_n)
     begin
        if(rst_n == 0)
          begin
             data_out <= 0;
          end
        else
          begin
             data_out <= data_in;
          end
     end
endmodule
