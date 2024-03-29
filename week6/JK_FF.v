module JK_FF(
	input J, K, CLK,
	output Q, NQ
	);

	
    wire JK;
    assign JK = (J & NQ) | (~K & Q);
    D_FF F1(.CLK(~CLK), .D(JK), .Q(Q), .NQ(NQ));
	 
endmodule
