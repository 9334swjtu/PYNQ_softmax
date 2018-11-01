module mul_16( A, B, TC,
CLK, PRODUCT );
//parameter A_width = 16;
//parameter B_width = 16;
input [15 : 0] A;
input [15 : 0] B;
input TC;
input CLK;
output [31 : 0] PRODUCT;
// Instance of DW02_mult_4_stage
//DW02_mult_4_stage #(A_width, B_width)
//U1 ( .A(A), .B(B), .TC(TC),
//.CLK(CLK), .PRODUCT(PRODUCT) );
endmodule