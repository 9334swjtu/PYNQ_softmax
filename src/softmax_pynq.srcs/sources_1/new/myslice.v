`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/05 21:32:47
// Design Name: 
// Module Name: myslice
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


module myslice
#(
    parameter integer IN_BITS = 1,
    parameter integer OUT_BITS = 1,
    parameter integer SLICE_BIT_HIGH = 1,
    parameter integer SLICE_BIT_LOW = 1
)
(
    input wire [IN_BITS:0] din,
    output wire [OUT_BITS:0] dout
    );
    
    assign dout = din[SLICE_BIT_HIGH:SLICE_BIT_LOW];
endmodule
