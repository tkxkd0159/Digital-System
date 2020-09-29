module rc_adder4(
 input [3:0] A, B,
 input Cin,
 output [3:0] Sum,
 output Cout
 );


	wire [2:0] cw;

	full_adder f0(.C(cw[0]), .S(Sum[0]), .X(A[0]), .Y(B[0]), .Z(Cin));
	full_adder f1(.C(cw[1]), .S(Sum[1]), .X(A[1]), .Y(B[1]), .Z(cw[0]));
	full_adder f2(.C(cw[2]), .S(Sum[2]), .X(A[2]), .Y(B[2]), .Z(cw[1]));
	full_adder f3(.C(Cout), .S(Sum[3]), .X(A[3]), .Y(B[3]), .Z(cw[2]));

endmodule
