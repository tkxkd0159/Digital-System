`timescale 10ns/1ps

module CU_tb;

reg CLK;
reg [3:0] aData;
wire [1:0] DA, AA, BA;
wire muxB, muxD, RW, MW;
wire [3:0] FS, constant, instMemAddr;
wire [12:0] instIO;

ControlUnit CU00(CLK, aData, DA, AA, BA, muxB, FS, muxD, RW, MW, constant, instMemAddr, instIO);

initial
begin
    CLK <= 0; aData <=4'b0110;
    forever
    begin
        #5 CLK = ~CLK;
    end

end

endmodule