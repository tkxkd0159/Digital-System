module DataMemory(
    input CLK, WR,
	 input [3:0] addressIn, dataIn,
	 output [3:0] Q
);

reg [3:0] SRAM [15:0];

initial begin
SRAM[0] = 4'b0010;
SRAM[1] = 4'b0011;
end


always @(posedge CLK)
begin
 if(WR)
  begin
  SRAM[addressIn] <= dataIn;
  end
end


assign Q = SRAM[addressIn];

endmodule
