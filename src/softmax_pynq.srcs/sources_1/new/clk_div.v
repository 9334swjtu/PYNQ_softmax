`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/07 21:53:25
// Design Name: 
// Module Name: div_part_clk_control
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


module div_part_clk_control(
    input wire sys_clk,
    input wire [1:0] state,
    output wire clk_out
);
// state[2] = 2'b10  
assign clk_out = ((state[1])&(!state[0]))?sys_clk:1'b0;
endmodule
