module reg5
#(
	parameter integer BITS = 1
)
(
	input wire clk,
	input wire rst,
	input wire [BITS:0] din,
	output wire [BITS:0] dout
);
	reg [BITS:0] reg1;
	reg [BITS:0] reg2;
	reg [BITS:0] reg3;
	reg [BITS:0] reg4;
	reg [BITS:0] reg5;
	
	assign dout = reg5;
	
	always @ (posedge clk or negedge rst)
	begin
		if(rst == 0)
		begin
			reg1 <= 0;
			reg2 <= 0;
			reg3 <= 0;
			reg4 <= 0;
			reg5 <= 0;
		end
		else
		begin
			reg1 <= din;
			reg2 <= reg1;
			reg3 <= reg2;
			reg4 <= reg3;
			reg5 <= reg4;
		end
	end

endmodule


