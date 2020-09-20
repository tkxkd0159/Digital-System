module BIN_BCD2(
	input A0, A1, A2, A3,
	output B0, B1, B2, B3, B4
);



		assign B0 = A0;
		assign B1 = (~A3 & A1) | (~A1 & A2 & A3);
		assign B2 = A2 & (A1 | ~A3);
		assign B3 = A3 & ~A2 & ~A1;
		assign B4 = A3 & (A2 | A1);
	
	endmodule
	