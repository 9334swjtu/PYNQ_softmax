`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/27 03:44:04
// Design Name: 
// Module Name: switch_16_8
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


module switch_16_8(
    input wire [31:0] din,
    input wire switch,
    output wire [31:0] dout
    );
    assign dout = switch?din:{24'b0,din[15:8]};
endmodule
