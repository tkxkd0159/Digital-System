module InstructionDecoder(
    input [12:0] instIn,
    output [1:0] DA, AA, BA,
    output muxB,
    output [3:0] FS,
    output muxD,
    output wire RW, MW, PL, JB, BC
);


assign DA = instIn[5:4];
assign AA = instIn[3:2];
assign BA = instIn[1:0];

assign muxB = instIn[12];
assign muxD = instIn[10];

assign RW = ~(instIn[11]); // destination reg write bit
assign MW = ~(instIn[12]) & instIn[11]; // Data Memory write bit

// PC operation
assign PL = instIn[12] & instIn[11];
assign JB = instIn[10];
assign BC = instIn[6];

assign FS = {instIn[9:7], instIn[6] & ~PL};

endmodule
