module UPDN_CNT(
    input RST, CLK, UPDN,
    output reg [3:0] Q
);


always @(posedge RST or posedge CLK)
 begin
  if (RST) Q = 4'b000;
  else if (UPDN)
   if (Q == 4'b1111 ) Q = 4'b0000;
   else Q = Q + 1;
  else if (~UPDN)
   if (Q == 4'b0000 ) Q = 4'b1111;
   else Q = Q - 1;
 end
endmodule