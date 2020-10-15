module BIN_to_BCD(
		B3,B2,B1,B0, 
		P9,P8,P7,P6,P5,P4,P3,P2,P1,P0
		);
		
input B3,B2,B1,B0;
output P9,P8,P7,P6,P5,P4,P3,P2,P1,P0;
wire T10,T9,T8,T7,T6,T5,T4,T3,T2,T1,T0;

assign P0 = B0;
add3 C1(0,0,0,B3,		T3,T2,T1,T0);
add3 C2(T2,T1,T0,B2,	T7,T6,T5,T4);
add3 C3(0,0,0,T3,		P9,T10,T9,T8);
add3 C4(T6,T5,T4,B1,	P4,P3,P2,P1);
add3 C5(T10,T9,T8,T7,	P8,P7,P6,P5);

endmodule