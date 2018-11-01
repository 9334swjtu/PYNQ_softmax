`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/06 20:24:00
// Design Name: 
// Module Name: capture_local_result
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



module capture_local_result(
            done0,
            done1,
            done2,
            done3,
            in0,
            in1,
            in2,
            in3,
            reg0,
            reg1,
            reg2,
            reg3,
            rst,
            alldone
    );
   input         done0,
                 done1,
                 done2,
                 done3;

   input [31:0]  in0;
   input [31:0]  in1;
   input [31:0]  in2;
   input [31:0]  in3;

   input         rst;
   output        alldone;

   output reg [31:0] reg0,
                     reg1,
                     reg2,
                     reg3;
   reg [3:0]         done_reg;

   assign alldone = ~(done_reg[3] & done_reg[2] & done_reg[1] & done_reg[0]);

   always @ (*)
     begin
        if(rst)
          begin
             reg0 <= 0;
             reg1 <= 0;
             reg2 <= 0;
             reg3 <= 0;
             done_reg <= 4'b0000;
          end
        else
          begin
             if(done0)
               begin
                  reg0 <= in0;
                  done_reg[0] <= 1;
               end
             else
               begin end
             if(done1)
               begin
                  reg1 <= in1;
                  done_reg[1] <= 1;
               end
             else
               begin end
             if(done2)
               begin
                  reg2 <= in2;
                  done_reg[2] <= 1;
               end
             else
               begin end
             if(done3)
               begin
                  reg3 <= in3;
                  done_reg[3] <= 1;
               end
             else
               begin end
          end
     end

   // always @ (posedge done0)
   //   reg0 <= in0;
   // always @ (posedge done1)
   //   reg1 <= in1;
   // always @ (posedge done2)
   //   reg2 <= in2;
   // always @ (posedge done3)
   //   reg3 <= in3;

endmodule