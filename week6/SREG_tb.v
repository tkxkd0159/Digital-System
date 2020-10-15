`timescale 10ns/1ps


module SREG_tb();

reg CLK, SI;
wire S1, S2, S3, S4;

Shift_REG U7(CLK, SI, S1, S2, S3, S4);


	always
	begin
	CLK = 1'b0;
	#5 CLK = 1'b1;
	#5;
	end
	
	initial
	begin
	SI = 1'b1;
	#10 SI = 1'b0;
	end
	
	
	always @(posedge CLK)
	begin

	end
	
endmodule
