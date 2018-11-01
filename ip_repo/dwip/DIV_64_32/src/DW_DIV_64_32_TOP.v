module DIV_64_32(clk, rst_n, en, a, b,
                        quotient, remainder, divide_by_0 );

  input clk;
  input rst_n;
  input en;
  input [63 : 0] a;
  input [31 : 0] b;
  output [63 : 0] quotient;
  output [31 : 0] remainder;
  output divide_by_0;

  // Instance of DW_div_pipe
  DW_div_pipe_inst
    U1 (.clk(clk),   .rst_n(rst_n),   .en(en),
        .a(a),   .b(b),   .quotient(quotient),
        .remainder(remainder),   .divide_by_0(divide_by_0) );
endmodule