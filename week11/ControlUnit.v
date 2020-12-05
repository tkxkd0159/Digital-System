module ControlUnit(
    input CLK,
    input [3:0] aData,     // from datapath
    output [1:0] DA, AA, BA,
    output muxB,
    output [3:0] FS,
    output muxD,
    output RW, MW,
    output [3:0] constant,
    output wire [3:0] instMemAddr
);

wire PL, JB, BC;
wire [12:0] instIO;

InstructionMemory CU0(CLK, 0, instMemAddr, 0, instIO);
InstructionDecoder CU1(instIO, DA, AA, BA, muxB, FS, muxD, RW, MW, PL, JB, BC);
ProgramCounter CU2(CLK, PL, JB, BC, DA, BA, aData, instMemAddr);

assign constant = {2'b00, instIO[1:0]};

endmodule