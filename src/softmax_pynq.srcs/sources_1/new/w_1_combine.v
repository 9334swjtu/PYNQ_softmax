`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/26 17:10:55
// Design Name: 
// Module Name: 16to32
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


module w1_combine(
    input wire [15:0] din,
    output wire [31:0] dout
    );
    assign dout = {16'b0,din[15:0]};
endmodule
