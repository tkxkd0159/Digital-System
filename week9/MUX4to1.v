module MUX4to1(
    input [3:0] D3,D2,D1,D0,
    input [1:0] S1,
    output reg [3:0] OUT
);


always @(D3 or D2 or D1 or D0 or S1)
begin
    case(S1)
     2'b00 : OUT = D0;
     2'b01 : OUT = D1;
     2'b10 : OUT = D2;
     2'b11 : OUT = D3;
     default : OUT = 0;
    endcase
end
endmodule