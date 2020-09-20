module addsub_4bit(Cout,Sum,A,B,Is_Sub);

	input [3:0] A, B;
	input Is_Sub;
	output [3:0] Sum;
	output Cout;
	wire [3:0] cmpl = B^{4{Is_Sub}};

	rc_adder4 ADDER(Cout,Sum,A,cmpl,Is_Sub);

endmodule
