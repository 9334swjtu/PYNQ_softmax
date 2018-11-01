`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/07 15:01:31
// Design Name: 
// Module Name: get_result
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



module get_result(
                  alldone,
                  result_in,
                  result_out,
                  clk,
                  rst,
                  ready
    );


   input              clk;
   input              alldone;
   input              rst;
   input [127:0]      result_in;
   output reg [127:0] result_out;

   reg [1:0]          cnt;
   reg                flag;

   output wire        ready;

   assign ready = cnt[1] & ~cnt[0];

   always @ (posedge alldone or posedge rst)
     begin
        if(rst)
          begin

          end
        else
          begin

          end
     end // always @ (posedge alldone or posedge rst)

   always @ (negedge alldone or posedge rst or posedge alldone or posedge ready)
     begin
        if(rst)
          begin
             flag <= 0;
          end
        else
          begin
             if(!alldone && !ready)
               begin
                  flag <= 1;
               end
             else
               begin
                  flag <= 0;
               end
          end
     end // always @ (negedge alldone or posedge rst or posedge alldone)

   always @ (posedge clk or posedge rst)
     begin
        if(rst)
          begin
             cnt <= 0;
          end
        else
          begin
             if(flag)
               cnt <= cnt + 1;
             else
               cnt <= 0;
          end
     end // always @ (posedge clk or posedge rst)

   always @ (posedge ready)
     begin
        result_out <= result_in;
     end
endmodule

