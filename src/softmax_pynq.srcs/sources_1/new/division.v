`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2018/05/27 21:17:26
// Design Name:
// Module Name: division
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


module division(
                input wire [31:0] A,
                input wire [63:0] B,
                input wire clk,
                input wire rst,
                output reg [31:0] result
    );

   always @ (posedge clk or negedge rst)
     begin
        if(rst == 0)
          begin
             result <= 32'b0;
          end
        else
          begin
            result <= {A,32'h00000000} / B;
//            result <= 32'b00001111;
          end
     end

endmodule
