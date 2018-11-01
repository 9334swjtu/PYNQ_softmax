`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/26 22:34:33
// Design Name: 
// Module Name: shift_r2
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


module shift_r2(
    input wire [31:0] din,
    output wire [39:0] dout_high,
    output wire [39:0] dout_low
    );
    assign dout_high = {din[31:16],24'b0};
    assign dout_low = {din[15:0],24'b0};
endmodule
