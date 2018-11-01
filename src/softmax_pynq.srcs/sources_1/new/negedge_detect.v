`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/30 21:26:24
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


module negedge_detect(
    input wire clk,
    input wire asignal,
    input wire rst,
    output wire aout
    );
    
    reg reg0;
    reg reg1;
    
    assign aout = ~reg0 & reg1;
    
    always @ (posedge clk) 
    begin
        if(rst == 0)
        begin
            reg0 <= 0;
            reg1 <= 0;
        end
        else
        begin
            reg0 <= asignal;
            reg1 <= reg0;
        end 
    end 
    
    
    
endmodule
