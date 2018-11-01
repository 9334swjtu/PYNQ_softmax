`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2018/05/07 15:36:12
// Design Name:
// Module Name: edge_detect
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


module edge_detect(
                   input wire  clk,
                   input wire  rst,
                   input wire  my_signal,
                   output wire edge_out
    );
   reg                         reg0;
   reg                         reg1;

   assign edge_out = reg0 + reg1;

   always @ (posedge clk or posedge rst)
     begin
        if(rst)
          begin
             reg0 <= 0;
             reg1 <= 0;
          end
        else
          begin
             reg0 <= my_signal;
             reg1 <= reg0;
          end
     end
endmodule
