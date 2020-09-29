	module test(
	input [3:0] A,
	output S3,
	output S2,
	output S1,
	output S0
);


reg [3:0] out;

always @(A)
begin
case({A})
4'b0000 : out <= 4'b0000; //0
4'b0001 : out <= 4'b0001; //1
4'b0010 : out <= 4'b0010; //2
4'b0011 : out <= 4'b0011; //3
4'b0100 : out <= 4'b0100; //4
4'b0101 : out <= 4'b0101; //5
4'b0110 : out <= 4'b0110; //6
4'b0111 : out <= 4'b0111; //7
4'b1000 : out <= 4'b1000; //8
4'b1001 : out <= 4'b1001; //9
default : out <= 4'b0000; //NULL
endcase 
end

assign {S3,S2,S1,S0} = out;

endmodule