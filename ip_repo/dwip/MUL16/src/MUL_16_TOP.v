`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/26 16:44:38
// Design Name: 
// Module Name: MUL_TOP
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


module MUL_TOP( A, B, TC,
CLK, PRODUCT );
//parameter A_width = 16;
//parameter B_width = 16;
input [15 : 0] A;
input [15 : 0] B;
input TC;
input CLK;
output [31 : 0] PRODUCT;

mul_16
U1 ( .A(A), .B(B), .TC(TC),
.CLK(CLK), .PRODUCT(PRODUCT) );
endmodule
