`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/06 19:09:32
// Design Name: 
// Module Name: myconcat
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


module myconcat32_127(
    input wire[31:0] data_high,
    output  wire[127:0] dataout
    );
    
    assign dataout = {32'h00000000,32'h00000000,data_high,32'h00000000};
endmodule
