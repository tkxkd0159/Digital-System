module Shift_REG(CLK, SI, SO);
    input SI, CLK;
    output [3:0] SO;
    wire [3:0] SO;
   
    D_FF F1(.CLK(CLK), .D(SI),   .Q(SO[0]), .NQ());
    D_FF F2(.CLK(CLK), .D(SO[0]),.Q(SO[1]), .NQ());
    D_FF F3(.CLK(CLK), .D(SO[1]),.Q(SO[2]), .NQ());
    D_FF F4(.CLK(CLK), .D(SO[2]),.Q(SO[3]), .NQ());
endmodule