`timescale 10ns/1ps

module LAB04_TB;

reg X, Y;
wire C, S;

half_adder U1(X, Y, C, S);


initial begin

			X<=0; Y<=0;
	#10	X<=1; Y<=0;
	#10	X<=0; Y<=1;
	#10	X<=1; Y<=1;

	
end

endmodule
