`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/21 21:43:34
// Design Name: 
// Module Name: fix_shift
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


module fix_shift(
                input [31:0]   input_data,
                input wire clk,
                input wire rst,
                 output [4:0] befor_point,
                 output [3:0] after_point_0,
                 output [3:0] after_point_1,
                 output [3:0] after_point_2,
                 output [3:0] after_point_3
    );
   wire [25:0]                temp;
   reg [31:0]      data_reg;
   wire [15:0]     fix_num;
   wire  [2:0]      point_position;
   
   assign fix_num = {data_reg[12:0],3'b0};
   assign point_position = data_reg[15:13];
   
   assign temp = {5'b00000,fix_num,5'b00000} << point_position;
   assign {befor_point,after_point_0,after_point_1,after_point_2,after_point_3} = temp[25:5];
   
   always @ (posedge clk or negedge rst)
   begin
        if(rst == 0)
        begin
            data_reg <= 0;
        end 
        else
            data_reg <= input_data;
   end  
   // always @ (fix_num or point_position)
   //   begin

       // case(point_position)
       //   3'b000:
       //     begin
       //        befor_point = 0;
       //        after_point_0 = fix_num[3:0];
       //        after_point_1 = fix_num[7:4];
       //        after_point_2 = fix_num[11:8];
       //        after_point_3 = fix_num[15:12];
       //     end
       //   3'b001:
       //     begin
       //        befor_point = fix_num[15];
       //        after_point_0 = {0,fix_num[2:0]};
       //        after_point_1 = fix_num[6:3];
       //        after_point_2 = fix_num[10:7];
       //        after_point_3 = fix_num[14:11];
       //     end
       //   3'b010:
       //     begin
       //        befor_point = fix_num[15,14];
       //        after_point_0 = {0,0,fix_num[1:0]};
       //        after_point_1 = fix_num[5:2];
       //        after_point_2 = fix_num[9:6];
       //        after_point_3 = fix_num[13:10];
       //     end
       //   3'b011:
       //     begin
       //        befor_point = fix_num[15,14,13];
       //        after_point_0 = {0,0,0,fix_num[0]};
       //        after_point_1 = fix_num[4:1];
       //        after_point_2 = fix_num[8:5];
       //        after_point_3 = fix_num[12:9];
       //     end
       //   3'b100:
       //     begin
       //        befor_point = fix_num[15,14,13,12];
       //        after_point_0 = {0,0,0,0};
       //        after_point_1 = fix_num[3:0];
       //        after_point_2 = fix_num[7:4];
       //        after_point_3 = fix_num[11:8];
       //     end
       //   3'b101:
       //     begin
       //        befor_point = fix_num[15,14,13,12,11];
       //        after_point_0 = {0,0,0,0};
       //        after_point_1 = {0,fix_num[2:0]};
       //        after_point_2 = fix_num[6:3];
       //        after_point_3 = fix_num[10:7];
       //     end
       // endcase
       //end

endmodule
