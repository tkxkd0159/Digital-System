`timescale 10ns/1ps

module JK_tb2();

	reg J, K, CLK;
	wire Q, NQ;
	
JK_FF U5(J, K, CLK, Q, NQ);

	always begin
		CLK = 1'b0;
		#3;
		CLK = 1'b1;
		#3;
		
	end
	
	always @(negedge CLK) begin
		
		J<=0; K<=0;
		#10 J<=1; K<=0;
		#10 J<=0; K<=1;
		#10 J<=1; K<=1;
		#10;

	
	end
	
	
	
endmodule
	
	