`timescale 10ns/1ns
module deisgn2(

               );

   

   wire [31:0]P_0;
   wire [63:0]sum_0;
   reg        clk_0;
   reg [15:0] fix_num_0;
   reg [2:0]  point_position_0;
   reg        rst_n_0;

   reg [15:0] reg1;
   reg [15:0] reg2;
   reg [15:0] reg3;
   reg [15:0] reg4;
   reg        en_0;
   
   integer    file;
   
   reg [63:0] sum_test;

   initial
     begin
        sum_test = 0;
        clk_0 <= 1;
        fix_num_0 <= 16'h8000;
        point_position_0 <= 3'b000;
        en_0 = 1;
        rst_n_0 <= 0;
        #5;
        rst_n_0 <= 1;
        file = $fopen("data.txt","w");
     end

   always #5
     clk_0 <= ~clk_0;

   always #10
      begin
         fix_num_0 <= fix_num_0 + 1;
         reg1 <= fix_num_0;
         reg2 <= reg1;
         reg3 <= reg2;
         reg4 <= reg3;
         sum_test <= sum_test + P_0;
         $fdisplay(file,"%h,%h",reg3,P_0);
         if(reg3 == 16'h9000)
           begin
              $fclose(file);
              $stop;
           end
      end

design_2_wrapper mydesign2
  (P_0,
    clk_0,
    en_0,
    fix_num_0,
    point_position_0,
    rst_n_0,
    sum_0);

endmodule
