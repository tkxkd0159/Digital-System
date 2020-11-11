module mem4_16(
    input CLK, WR, RD, enable,
    input N_Reset,
    input [3:0] A,
    input [9:0] D_IN,
    output [3:0] Q,
    output [7:0] SEG_COM,
    output [6:0] SEG_DATA
);

reg [3:0] SRAM [15:0];
wire [15:0] mem_addr;
wire A1,B1,C1,D1,E1,F1,G1;

dec4_16 U0(A, enable, mem_addr);

always @(posedge CLK)
begin
 if(WR)
  begin
      case (D_IN)
       10'b0000000001 : SRAM[mem_addr] <= 4'b0000;
       10'b0000000010 : SRAM[mem_addr] <= 4'b0001;
       10'b0000000100 : SRAM[mem_addr] <= 4'b0010;
       10'b0000001000 : SRAM[mem_addr] <= 4'b0011;
       10'b0000010000 : SRAM[mem_addr] <= 4'b0100;
       10'b0000100000 : SRAM[mem_addr] <= 4'b0101;
       10'b0001000000 : SRAM[mem_addr] <= 4'b0110;
       10'b0010000000 : SRAM[mem_addr] <= 4'b0111;
       10'b0100000000 : SRAM[mem_addr] <= 4'b1000;
       10'b1000000000 : SRAM[mem_addr] <= 4'b1001;
       default: SRAM[mem_addr] <= 4'bz;
      endcase
  end
end

assign Q = (RD) ? SRAM[mem_addr] : 4'bz;
BCDto7 U1(Q[3],Q[2],Q[1],Q[0],	A1,B1,C1,D1,E1,F1,G1);
SevenSeg_CTRL u3(CLK, N_Reset, {A1,B1,C1,D1,E1,F1,G1},0,0,0,0,0,0,0, SEG_COM, SEG_DATA);

endmodule
