module half_adder(
    output C,S,
    input X,Y
);


	xor x0(S, X, Y);
	and a0(C, X, Y);

endmodule