module HB_24DECODER2(
	input A1, A0,
	output D3, D2, D1, D0
);




assign D0 = ~A1 & ~A0;
assign D1 = ~A1 & A0;
assign D2 = A1 & ~A0;
assign D3 = A1 & A0;

endmodule
