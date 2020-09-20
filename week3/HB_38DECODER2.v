module HB_38DECODER2(
	input A2, A1, A0,
	output D7,D6, D5, D4, D3, D2, D1, D0
);


wire W3, W2, W1, W0;

assign W0 = ~A1 & ~A0;
assign W1 = ~A1 & A0;
assign W2 = A1 & ~A0;
assign W3 = A1 & A0;

assign D0 = ~A2 & W0;
assign D1 = ~A2 & W1;
assign D2 = ~A2 & W2;
assign D3 = ~A2 & W3;
assign D4 = A2 & W0;
assign D5 = A2 & W1;
assign D6 = A2 & W2;
assign D7 = A2 & W3;

endmodule
