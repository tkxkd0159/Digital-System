`timescale 10ns/1ps


module BCD_CNT_tb();


	reg CLK;
	reg RST = 1;

	wire Q1, Q2, Q4, Q8;

	

 BCD_CNT U0(CLK, RST, Q1, Q2, Q4, Q8);
 

	

	always begin
		CLK = 1'b0;
		#5;
		CLK = 1'b1;
		#5;
		
	end
	
	initial begin
	#20 RST = 0;
	end
	

	

	
	
endmodule
	

