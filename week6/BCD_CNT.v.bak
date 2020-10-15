module BCD_CNT(CLK, Q1, Q2, Q4, Q8);
    input CLK;
    output Q1, Q2, Q4, Q8;
    wire NQ8;
    supply1 p;	
    JK_FF F1(.J(p), .K(p), .CLK(CLK), .Q(Q1), .NQ());
    JK_FF F2(.J(NQ8), .K(p), .CLK(Q1), .Q(Q2), .NQ());
    JK_FF F3(.J(p), .K(p), .CLK(Q2), .Q(Q4), .NQ());
    JK_FF F4(.J(Q2&Q4), .K(p), .CLK(Q1), .Q(Q8), .NQ(NQ8));
endmodule