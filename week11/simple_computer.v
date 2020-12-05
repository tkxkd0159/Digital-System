module simple_computer(
    input CLK,
	 output [3:0] outData,
	 output [3:0] reg0, reg1, reg2, reg3,
	 output [12:0] ControlWord,
	 output [3:0] AddressOut, DataOut, ConstantIn,
	 output [3:0] DataIn,
	 output [3:0] instMemAddr 
);

wire MW;

ControlUnit C1(CLK, AddressOut, ControlWord[12:11], ControlWord[10:9], ControlWord[8:7], ControlWord[6], ControlWord[5:2], ControlWord[1], ControlWord[0], MW, ConstantIn, instMemAddr);
datapath D1(CLK, ControlWord, ConstantIn, DataIn, AddressOut, DataOut, reg0, reg1, reg2, reg3);
DataMemory M1(CLK, MW, AddressOut, DataOut, DataIn);

assign outData = DataIn;

endmodule
