`timescale 10ns/1ps

module HB_CNT_tb();

	reg CLK;
	wire[3:0] Q;
	
HB_CNT U3(CLK, Q);

	always begin
		CLK = 1'b0;
		#5;
		CLK = 1'b1;
		#5;
		
	end
	

	
	
endmodule
	
	