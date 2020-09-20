module HB_12DECODER(
	input A0,
	output D0,
	output D1
);


wire b0,b1

assign b0 = ~A0;
assign b1 = A0;
assign D0 = b0;
assign D1 = b1;


endmodule
