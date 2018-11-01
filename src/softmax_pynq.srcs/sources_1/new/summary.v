`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2018/05/27 20:14:25
// Design Name:
// Module Name: summary
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


module summary(
               input wire        clk,
               input wire        rst,
               input wire        en,
               input wire [31:0] data_in,
               input wire [1:0] cur_state,
               output reg [63:0] sum
    );
    
    reg [31:0] temp;
    wire temp2;
    assign temp2 = (!cur_state[1]) &  (cur_state[0]);
    
    always @ (posedge clk or negedge rst)
    begin
        if(rst == 0)
            temp <= 0;
        else
            temp <= data_in;
    end 
    
   always @ (posedge clk or negedge rst)
     begin
        if(rst == 0)
          begin
             sum <= 0;
          end
        else
          begin
             if(en & temp2)
               sum <= sum + temp;
             else
               sum <= sum;
          end
     end

endmodule
