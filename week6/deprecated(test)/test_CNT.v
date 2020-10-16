module test_CNT(
	input CLK,
	output Q1, Q2, Q4, Q8
);

	 
    supply1 p;
	 wire NQ8;
	 
	 



			test_JK F1(.J(p), .K(p), .CLK(CLK), .Q(Q1), .NQ());
		   test_JK F2(.J(NQ8), .K(p), .CLK(Q1), .Q(Q2), .NQ());
		   test_JK F3(.J(p), .K(p), .CLK(Q2), .Q(Q4), .NQ());
		   test_JK F4(.J(Q2&Q4), .K(p), .CLK(Q1), .Q(Q8), .NQ(NQ8));


endmodule
