module SR_LATCH(S, R, Q, NQ);
    input S, R;
    output Q, NQ;
    wire S, R;
	
	assign Q = ~(S & NQ);
	assign NQ = ~(R & Q);
		
endmodule