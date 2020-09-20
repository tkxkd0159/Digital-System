module multi41(Cout,Sum,A,B,C);

	input A;
	input [3:0] B,C;
	output [3:0] Sum;
	output Cout;
	
	wire [3:0] D;

	and(D[0],A,B[0]);
	and(D[1],A,B[1]);
	and(D[2],A,B[2]);
	and(D[3],A,B[3]);

	rc_adder4 U1(Cout,Sum,D,C,0);

endmodule
