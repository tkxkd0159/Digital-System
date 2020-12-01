module InstructionMemory(
    input CLK, WR,
    input [3:0] instMemAddr,  //from datapath module
    input [12:0] instIn,
    output [12:0] instOut
);

reg [12:0] SRAM [15:0];

initial
begin
    SRAM[0] = 13'b1000010011011; // R1 = R2 + 3
    SRAM[1] = 13'b0010000100100; // R2 = M(R1)
    SRAM[2] = 13'b1110000001100; // PC = R3;
end

always@(posedge CLK)
begin
    if(WR) SRAM[instMemAddr] <= instIn;
end

assign instOut = SRAM[instMemAddr];

endmodule
