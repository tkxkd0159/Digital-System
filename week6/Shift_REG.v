module Shift_REG(CLK, SI, S1, S2, S3, S4);
    input SI, CLK;
    output S1, S2, S3, S4;
    wire S1, S2, S3, S4;
   
    D_FF F1(.CLK(CLK), .D(SI),   .Q(S1), .NQ());
    D_FF F2(.CLK(CLK), .D(S1),.Q(S2), .NQ());
    D_FF F3(.CLK(CLK), .D(S2),.Q(S3), .NQ());
    D_FF F4(.CLK(CLK), .D(S3),.Q(S4), .NQ());
endmodule
