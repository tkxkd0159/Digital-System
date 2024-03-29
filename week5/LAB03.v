module LAB03(
	CLK,
	I3,I2,I1,I0,
	N_Reset,
	SEG_COM, SEG_DATA
);

input CLK,I3,I2,I1,I0,N_Reset;
output [7:0] SEG_COM;
output [6:0] SEG_DATA;

wire T9,T8,T7,T6,T5,T4,T3,T2,T1,T0;
wire A1,B1,C1,D1,E1,F1,G1,A2,B2,C2,D2,E2,F2,G2;


BIN_to_BCD u1(I3,I2,I1,I0, T9,T8,T7,T6,T5,T4,T3,T2,T1,T0);

BCDto7 u2_1(T3,T2,T1,T0,	A1,B1,C1,D1,E1,F1,G1); // units
BCDto7 u2_2(T7,T6,T5,T4,	A2,B2,C2,D2,E2,F2,G2); // tens

SevenSeg_CTRL u3(CLK, N_Reset, {A1,B1,C1,D1,E1,F1,G1},{A2,B2,C2,D2,E2,F2,G2},0,0,0,0,0,0, SEG_COM, SEG_DATA);

endmodule