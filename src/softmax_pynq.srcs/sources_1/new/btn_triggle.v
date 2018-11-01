`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/25 16:31:05
// Design Name: 
// Module Name: button_single
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


module button_single(
    input wire but_in,
    input wire rst_n,
    input wire clk,
    output reg single
    );
    
    always @ (posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            single <= 1;
        else
            if(but_in == 0)
                single <= 0;
            else
                single <= single;
    end  
    
    
endmodule
