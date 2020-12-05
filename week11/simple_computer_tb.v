`timescale 10ns/1ps

module simple_computer_tb;

reg CLK;

wire [3:0] outData, reg0, reg1, reg2, reg3, busA, busB, ConstantIn, DataMemoryOut, PC;
wire [12:0] ControlWord;

simple_computer S1(CLK, outData, reg0, reg1, reg2, reg3, ControlWord, busA, busB, ConstantIn, DataMemoryOut, PC);


initial begin
CLK<=0;
 forever
 begin
  #5 CLK = ~CLK;
 end
end


endmodule
