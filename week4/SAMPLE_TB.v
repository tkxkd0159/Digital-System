`timescale 10ns/1ps

module LAB04_TB;

reg A, B, C, D;
wire X;

test U1(A, B, C, D, X);


initial begin

			A<=0; B<=0; C<=0; D<=0;
	#10	A<=1; C<=1;
	#10	B<=1; D<=1;

	
end

endmodule
