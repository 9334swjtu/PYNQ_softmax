module DW_div_pipe_inst(clk, rst_n, en, a, b,
                        quotient, remainder, divide_by_0 );

  parameter inst_a_width = 64;
  parameter inst_b_width = 32;
  parameter inst_tc_mode = 0;
  parameter inst_rem_mode = 1;
  parameter inst_num_stages = 64;
  parameter inst_stall_mode = 1;
  parameter inst_rst_mode = 1;
  parameter inst_op_iso_mode = 0;

  input clk;
  input rst_n;
  input en;
  input [inst_a_width-1 : 0] a;
  input [inst_b_width-1 : 0] b;
  output [inst_a_width-1 : 0] quotient;
  output [inst_b_width-1 : 0] remainder;
  output divide_by_0;

  // Instance of DW_div_pipe
//  DW_div_pipe #(inst_a_width,   inst_b_width,   inst_tc_mode,  inst_rem_mode,
//                inst_num_stages,   inst_stall_mode,   inst_rst_mode,   inst_op_iso_mode) 
//    U1 (.clk(clk),   .rst_n(rst_n),   .en(en),
//        .a(a),   .b(b),   .quotient(quotient),
//        .remainder(remainder),   .divide_by_0(divide_by_0) );
endmodule