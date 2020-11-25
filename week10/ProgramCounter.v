module ProgramCounter(
    input CLK, PL, JB, BC,
    input [1:0] lAddr, rAddr,
    input [3:0] aData,         // From datapath
    output reg [3:0] memAddr
);

initial begin
    memAddr = 4'b0000;
end

always @(posedge CLK)
begin
    if(PL == 0) memAddr = memAddr + 1;
    else if(JB == 1) memAddr = aData;
    else if(BC == 1)
    begin
        if(aData < 0) memAddr = {lAddr, rAddr};
        else memAddr = memAddr + 1;
    end
    else if(BC == 0)
    begin
        if(aData == 0) memAddr = {lAddr, rAddr};
        else memAddr = memAddr + 1;
    end
end

endmodule
