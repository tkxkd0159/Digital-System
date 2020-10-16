module test_JK(J, K, CLK, Q, NQ);


    input CLK, J, K;
    output Q, NQ;
	 
	 
    wire JK, q, q_bar, RST;
	 
	
	 
	 assign RST = Q === 1'bx ? 1'b1 : 1'b0;
	 assign q = RST ? Q !== 1'b0 : Q;  // 1'bX => 1
	 assign q_bar = RST ? NQ === 1'b1 : NQ;  // 1'bX => 0
	 assign RST = (q && 1'b1) | (q && 1'b0) ? 1'b0 : 1'b1;
			
	 
	 
	 

	 
	 
    assign JK = (J & q_bar) | (~K & q);
    D_FF F1(.CLK(~CLK), .D(JK), .Q(Q), .NQ(NQ));
	 

endmodule


