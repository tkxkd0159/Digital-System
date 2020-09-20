module half_adder(
	input X, Y,
	output C, S
	);

	xor(S, X, Y);
	and(C, X, Y);

endmodule

