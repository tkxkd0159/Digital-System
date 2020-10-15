module REG_(CLK, D, Q);
    input [3:0] D;
    input CLK;
    output [3:0] Q;
    D_FF F1(.CLK(CLK), .D(D[0]), .Q(Q[0]), .NQ());
    D_FF F2(.CLK(CLK), .D(D[1]), .Q(Q[1]), .NQ());
    D_FF F3(.CLK(CLK), .D(D[2]), .Q(Q[2]), .NQ());
    D_FF F4(.CLK(CLK), .D(D[3]), .Q(Q[3]), .NQ());
endmodule