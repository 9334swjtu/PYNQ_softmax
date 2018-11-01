module reg64
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
	reg [BITS:0] reg6;
	reg [BITS:0] reg7;
	reg [BITS:0] reg8;
	reg [BITS:0] reg9;
	
	reg [BITS:0] reg10;
	reg [BITS:0] reg11;
	reg [BITS:0] reg12;
	reg [BITS:0] reg13;
	reg [BITS:0] reg14;
	reg [BITS:0] reg15;
	reg [BITS:0] reg16;
	reg [BITS:0] reg17;
	reg [BITS:0] reg18;
	reg [BITS:0] reg19;

	
	reg [BITS:0] reg20;
	reg [BITS:0] reg21;
	reg [BITS:0] reg22;
	reg [BITS:0] reg23;
	reg [BITS:0] reg24;
	reg [BITS:0] reg25;
	reg [BITS:0] reg26;
	reg [BITS:0] reg27;
	reg [BITS:0] reg28;
	reg [BITS:0] reg29;

	reg [BITS:0] reg30;
	reg [BITS:0] reg31;
	reg [BITS:0] reg32;
	reg [BITS:0] reg33;
	reg [BITS:0] reg34;
	reg [BITS:0] reg35;
	reg [BITS:0] reg36;
	reg [BITS:0] reg37;
	reg [BITS:0] reg38;
	reg [BITS:0] reg39;

	reg [BITS:0] reg40;
	reg [BITS:0] reg41;
	reg [BITS:0] reg42;
	reg [BITS:0] reg43;
	reg [BITS:0] reg44;
	reg [BITS:0] reg45;
	reg [BITS:0] reg46;
	reg [BITS:0] reg47;
	reg [BITS:0] reg48;
	reg [BITS:0] reg49;

	reg [BITS:0] reg50;
	reg [BITS:0] reg51;
	reg [BITS:0] reg52;
	reg [BITS:0] reg53;
	reg [BITS:0] reg54;
	reg [BITS:0] reg55;
	reg [BITS:0] reg56;
	reg [BITS:0] reg57;
	reg [BITS:0] reg58;
	reg [BITS:0] reg59;

	reg [BITS:0] reg60;	
	reg [BITS:0] reg61;
	reg [BITS:0] reg62;
	reg [BITS:0] reg63;
	reg [BITS:0] reg64;
    reg [BITS:0] reg65;
	
	assign dout = reg65;
	
	always @ (posedge clk or negedge rst)
	begin
		if(rst == 0)
		begin
			reg1 <= 0;
			reg2 <= 0;
			reg3 <= 0;
			reg4 <= 0;
			reg5 <= 0;
			reg6 <= 0;
			reg7 <= 0;
			reg8 <= 0;
			reg9 <= 0;		
			reg10 <= 0;
			reg11 <= 0;
			reg12 <= 0;
			reg13 <= 0;
			reg14 <= 0;
			reg15 <= 0;
			reg16 <= 0;
			reg17 <= 0;
			reg18 <= 0;
			reg19 <= 0;	
			reg20 <= 0;
			reg21 <= 0;
			reg22 <= 0;
			reg23 <= 0;
			reg24 <= 0;
			reg25 <= 0;
			reg26 <= 0;
			reg27 <= 0;
			reg28 <= 0;
			reg29 <= 0;		
			reg30 <= 0;
			reg31 <= 0;
			reg32 <= 0;
			reg33 <= 0;
			reg34 <= 0;
			reg35 <= 0;
			reg36 <= 0;
			reg37 <= 0;
			reg38 <= 0;
			reg39 <= 0;		
			reg40 <= 0;
			reg41 <= 0;
			reg42 <= 0;
			reg43 <= 0;
			reg44 <= 0;
			reg45 <= 0;
			reg46 <= 0;
			reg47 <= 0;
			reg48 <= 0;
			reg49 <= 0;		
			reg50 <= 0;
			reg51 <= 0;
			reg52 <= 0;
			reg53 <= 0;
			reg54 <= 0;
			reg55 <= 0;
			reg56 <= 0;
			reg57 <= 0;
			reg58 <= 0;
			reg59 <= 0;		
			reg60 <= 0;
			reg61 <= 0;
			reg62 <= 0;
			reg63 <= 0;
			reg64 <= 0;
			reg65 <= 0;
		end
		else
		begin			
			reg1   <= din         ;
			reg2   <=  reg1       ;
			reg3   <=  reg2       ;
			reg4   <=  reg3       ;
			reg5   <=  reg4       ;
			reg6   <=  reg5       ;
			reg7   <=  reg6       ;
			reg8   <=  reg7       ;
			reg9   <=  reg8       ;
			reg10  <=  reg9       ;
			reg11  <=  reg10      ;
			reg12  <=  reg11      ;
			reg13  <=  reg12      ;
			reg14  <=  reg13      ;
			reg15  <=  reg14      ;
			reg16  <=  reg15      ;
			reg17  <=  reg16      ;
			reg18  <=  reg17      ;
			reg19  <=  reg18      ;
			reg20  <=  reg19      ;
			reg21  <=  reg20      ;
			reg22  <=  reg21      ;
			reg23  <=  reg22      ;
			reg24  <=  reg23      ;
			reg25  <=  reg24      ;
			reg26  <=  reg25      ;
			reg27  <=  reg26      ;
			reg28  <=  reg27      ;
			reg29  <=  reg28      ;
			reg30  <=  reg29      ;
			reg31  <=  reg30      ;
			reg32  <=  reg31      ;
			reg33  <=  reg32      ;
			reg34  <=  reg33      ;
			reg35  <=  reg34      ;
			reg36  <=  reg35      ;
			reg37  <=  reg36      ;
			reg38  <=  reg37      ;
			reg39  <=  reg38      ;
			reg40  <=  reg39      ;
			reg41  <=  reg40      ;
			reg42  <=  reg41      ;
			reg43  <=  reg42      ;
			reg44  <=  reg43      ;
			reg45  <=  reg44      ;
			reg46  <=  reg45      ;
			reg47  <=  reg46      ;
			reg48  <=  reg47      ;
			reg49  <=  reg48      ;
			reg50  <=  reg49      ;
			reg51  <=  reg50      ;
			reg52  <=  reg51      ;
			reg53  <=  reg52      ;
			reg54  <=  reg53      ;
			reg55  <=  reg54      ;
			reg56  <=  reg55      ;
			reg57  <=  reg56      ;
			reg58  <=  reg57      ;
			reg59  <=  reg58      ;
			reg60  <=  reg59      ;
			reg61  <=  reg60      ;
			reg62  <=  reg61      ;
			reg63  <=  reg62      ;
			reg64  <=  reg63	  ;
			reg65 <= reg64;
			
		end
	end

endmodule


