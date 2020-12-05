module InstructionMemory(
    input CLK, WR,
    input [3:0] instMemAddr,  //from program counter
    input [12:0] instIn,
    output [12:0] instOut
);

reg [12:0] SRAM [15:0];

initial
begin
    SRAM[0] = 13'b1100000_100111; // BRZ
	 SRAM[1] = 13'b0000010_111100; // ADD R3 <- R3+R0
	 SRAM[2] = 13'b0000110_010101; // DECREMENT R1 <- R1-1
	 SRAM[3] = 13'b1110000_001000; // JUMP to R2
	 
	 SRAM[5] = 13'b1000010_000000; // ADD Immediate R0 <- R0 + 0
	 SRAM[6] = 13'b1000010_010101; // ADD Immediate R1 <- R1 + 0
	 SRAM[7] = 13'b0010000_000000; // LOAD R0,  R0 <- M(R0)
	 SRAM[8] = 13'b0010000_010100; // LOAD R1,  R0 <- M(R1)
	 SRAM[9] = 13'b1000010_101000; // ADD Immediate R2 <- R2 + 0
	 SRAM[10] = 13'b1110000_001000; // JUMP to R2
	 SRAM[11] = 13'b0100000_001011; // STORE M(R2) <- R3
end

always@(posedge CLK)
begin
    if(WR) SRAM[instMemAddr] <= instIn;
end

assign instOut = SRAM[instMemAddr];

endmodule
