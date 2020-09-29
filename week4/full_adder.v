module full_adder(
	input X,Y,Z,
	output C, S
);

	wire C0, C1;
	wire S0;

	// First half adder instance
	half_adder h0(X, Y, C0, S0);
	// Second half adder instance
	half_adder h1(S0, Z, C1, S);
	// Carry
	or(C, C1, C0);

endmodule
