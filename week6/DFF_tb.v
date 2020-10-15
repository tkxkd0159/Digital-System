`timescale 10ns/1ps

module DFF_tb();

	reg D, CLK;
	wire Q, NQ;
	
D_FF U2(CLK, D, Q, NQ);

	always begin
		CLK = 1'b0;
		#3;
		CLK = 1'b1;
		#3;
		
	end
	
	always @(posedge CLK) begin
		
		D<=0;
		#10 D<=1;
		#10;

	
	end
	
	
	
endmodule
	
	