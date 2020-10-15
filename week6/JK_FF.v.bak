module JK_FF(J, K, CLK, Q, NQ);
    input CLK, J, K;
    output Q, NQ;
    wire JK;
    assign JK = (J & NQ) | (~K & Q);
    D_FF F1(.CLK(~CLK), .D(JK), .Q(Q), .NQ(NQ));
endmodule