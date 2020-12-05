module datapath(
    input CLK,
    input [12:0] ControlWord, // DA,AA,BA,muxB,{Cin, S, [1:0] S1}, muxD, write
    input [3:0] ConstantIn, // from Control Unit
	 input [3:0] DataIn, // from Data Memory
	 output [3:0] AddressOut, DataOut,    // to Data Memory
    output [3:0] Reg0, Reg1, Reg2, Reg3 // D Register
);

wire [3:0] Ddata, Adata, Bdata;
wire [3:0] MUXBout, Fout;


regFile R0(CLK, ControlWord[0], Ddata, ControlWord[12:11], ControlWord[10:9], ControlWord[8:7], Adata, Bdata, Reg0, Reg1, Reg2, Reg3);
MUX2to1 MUXB(ConstantIn, Bdata, ControlWord[6], MUXBout);
functionUnit F0(Adata, MUXBout, ControlWord[5:2], Fout);
MUX2to1 MUXD(DataIn, Fout, ControlWord[1], Ddata);

assign AddressOut = Adata;
assign DataOut = MUXBout;

endmodule