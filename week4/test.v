module test(
	input inp1, inp2, inp3, inp4,
	output result
);


	assign t1 = inp1 & inp2;
	assign t2 = inp3 & inp4;
	assign result = ~(t1|t2);
	
endmodule
	