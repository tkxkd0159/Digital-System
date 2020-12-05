module ProgramCounter(
    input CLK, PL, JB, BC,
    input [1:0] lAddr, rAddr,
    input [3:0] aData,         // From datapath
    output reg [3:0] instMemAddr
);

initial begin
    instMemAddr = 4'b0101;
end

always @(posedge CLK)
begin
    if(PL == 0) instMemAddr = instMemAddr + 1;
    else if(JB == 1) instMemAddr = aData;
    else if(BC == 1)
    begin
        if(aData < 0) instMemAddr = {lAddr, rAddr};
        else instMemAddr = instMemAddr + 1;
    end
    else if(BC == 0)
    begin
        if(aData == 0) instMemAddr = {lAddr, rAddr};
        else instMemAddr = instMemAddr + 1;
    end
end

endmodule
