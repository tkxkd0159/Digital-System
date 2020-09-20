module HB_38DECODER(
	input A2,
	input A1,
	input A0,
	output D7,
	output D6,
	output D5,
	output D4,
	output D3,
	output D2,
	output D1,
	output D0
);


wire b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15;

assign b0 = (~ A1) & (~ A0);
assign b1 = ~ A2;
assign b2 = (~ A1) & A0;   
assign b3 = ~ A2;           
assign b4 = A1 & (~ A0);   
assign b5 = ~ A2; 
assign b6 = A1 & A0;
assign b7 = ~ A2;
assign b8 = (~ A1) & (~ A0);
assign b9 = A2;
assign b10 = (~ A1) & A0;
assign b11 = A2;
assign b12 = A1 & (~ A0);
assign b13 = A2;
assign b14 = A1 & A0;
assign b15 = A2;
assign D0 = b0 & b1;
assign D1 = b2 & b3;
assign D2 = b4 & b5;
assign D3 = b6 & b7;
assign D4 = b8 & b9;
assign D5 = b10 & b11;
assign D6 = b12 & b13;
assign D7 = b14 & b15;

endmodule
