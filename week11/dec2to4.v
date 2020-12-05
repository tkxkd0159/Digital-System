module dec2to4(
    input [1:0] A,
    output reg [3:0] D
);


always @(A)
begin
 case(A)
  2'b00: D <= 4'b0001;
  2'b01: D <= 4'b0010;
  2'b10: D <= 4'b0100;
  2'b11: D <= 4'b1000;
 endcase
end

endmodule