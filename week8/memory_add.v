
module mux_2to1 (A, B , SEL, OUT);
input [3:0] A, B;
input SEL;
output [3:0] OUT;

assign OUT = (!SEL) ? A : B;

endmodule

module memory_add(CLK,WR,RD,A1,A2,D_IN,oS_COM,oS_ENS);

	input CLK,WR,RD;
	input [8:0]D_IN;
	input [2:0] A1, A2;
	output [7:0] oS_COM;
	output [6:0] oS_ENS;
	reg [3:0]SRAM[7:0];
	wire P9,P8,P7,P6,P5,P4,P3,P2,P1,P0,a0,a1,a2,a3,a4,a5,a6,b0,b1,b2,b3,b4,b5,b6;
	wire [3:0] Q;

	always @(posedge CLK)
		begin
			if(WR)
				begin
					case(D_IN)
					     9'b000000001 : SRAM[A1]<=4'b0001;
						  9'b000000010 : SRAM[A1]<=4'b0010;
						  9'b000000100 : SRAM[A1]<=4'b0011;
						  9'b000001000 : SRAM[A1]<=4'b0100;
						  9'b000010000 : SRAM[A1]<=4'b0101;
						  9'b000100000 : SRAM[A1]<=4'b0110;
						  9'b001000000 : SRAM[A1]<=4'b0111;
						  9'b010000000 : SRAM[A1]<=4'b1000;
						  9'b100000000 : SRAM[A1]<=4'b1001;
						  default:		SRAM[A1]<=4'b0000;
					endcase
				end
		end 

	mux_2to1 U0( 4'bz , (SRAM[A1]+SRAM[A2]), RD, Q);
	
	binary_to_BCD U1(Q[3],Q[2],Q[1],Q[0],P9,P8,P7,P6,P5,P4,P3,P2,P1,P0);
	BCD_to_7segment U2(P3,P2,P1,P0,a0,a1,a2,a3,a4,a5,a6);
	BCD_to_7segment U3(P7,P6,P5,P4,b0,b1,b2,b3,b4,b5,b6);
	SevenSeg_CTRL U4(CLK,0,0,0,0,0,0,0,{b0,b1,b2,b3,b4,b5,b6},{a0,a1,a2,a3,a4,a5,a6},oS_COM,oS_ENS);
endmodule






module SevenSeg_CTRL(
	iCLK,
	nRST,
	iSEG7,
	iSEG6,
	iSEG5,
	iSEG4,
	iSEG3,
	iSEG2,
	iSEG1,
	iSEG0,
	oS_COM,
	oS_ENS
);
// I/O definition------------------------------------------	
input iCLK, nRST;
input [6:0] iSEG7, iSEG6, iSEG5, iSEG4,iSEG3, iSEG2, iSEG1, iSEG0;
output [7:0] oS_COM;
output [6:0] oS_ENS; /* a,b,c,d, e,f,g,dp */
reg [7:0] oS_COM;
reg [6:0] oS_ENS;
integer CNT_SCAN; 

/*
   [a]
[f]   [b]
   [g]
[e]   [c]
   [d]   [dp]
*/


always @(posedge iCLK)
begin
	if (nRST)
	  begin
		oS_COM <= 8'b00000000;
		oS_ENS <= 0;
	    CNT_SCAN = 0;
	  end
	else
	  begin
	  	if (CNT_SCAN >= 7)
	  	  CNT_SCAN = 0;
	  	else
	  	  CNT_SCAN = CNT_SCAN + 1;
	  	  	  	
	  	case (CNT_SCAN)
	  	  0 : 
	  	    begin
				oS_COM <= 8'b11111110;
				oS_ENS <= iSEG0;
	  	    end
	  	  1 : 
	  	    begin
				oS_COM <= 8'b11111101;
				oS_ENS <= iSEG1;
	  	    end
	  	  2 : 
	  	    begin
				oS_COM <= 8'b11111011;
				oS_ENS <= iSEG2;
	  	    end
	  	  3 : 
	  	    begin
				oS_COM <= 8'b11110111;
				oS_ENS <= iSEG3;
	  	    end
	  	  4 : 
	  	    begin
				oS_COM <= 8'b11101111;
				oS_ENS <= iSEG4;
	  	    end
	  	  5 : 
	  	    begin
				oS_COM <= 8'b11011111;
				oS_ENS <= iSEG5;
	  	    end
	  	  6 : 
	  	    begin
				oS_COM <= 8'b10111111;
				oS_ENS <= iSEG6;
	  	    end
	  	  7 : 
	  	    begin
				oS_COM <= 8'b01111111;
				oS_ENS <= iSEG7;
	  	    end			 
	  	  default : 
	  	    begin
	  	      oS_COM <= 8'b11111111;
				oS_ENS <= iSEG7;
	  	    end
	  	endcase
      end
end

endmodule


module linedecoder(
	A3,A2,A1,A0,
	S3,S2,S1,S0
);

input A3,A2,A1,A0;
output S3,S2,S1,S0;

reg [3:0] out; 

always @(A3,A2,A1,A0)
begin
case({A3,A2,A1,A0})
4'b0000 : out <= 4'b0000; //0
4'b0001 : out <= 4'b0001; //1
4'b0010 : out <= 4'b0010; //2
4'b0011 : out <= 4'b0011; //3
4'b0100 : out <= 4'b0100; //4
4'b0101 : out <= 4'b1000; //5
4'b0110 : out <= 4'b1001; //6
4'b0111 : out <= 4'b1010; //7
4'b1000 : out <= 4'b1011; //8
4'b1001 : out <= 4'b1100; //9
default : out <= 4'b0000; //NULL
endcase 
end

assign {S3,S2,S1,S0} = out;

endmodule


module binary_to_BCD(
		B3,B2,B1,B0, 
		P9,P8,P7,P6,P5,P4,P3,P2,P1,P0
		);
		
input B3,B2,B1,B0;
output P9,P8,P7,P6,P5,P4,P3,P2,P1,P0;
wire T10,T9,T8,T7,T6,T5,T4,T3,T2,T1,T0;

assign P0 = B0;
linedecoder C1(0,0,0,B3,		T3,T2,T1,T0);
linedecoder C2(T2,T1,T0,B2,	T7,T6,T5,T4);
linedecoder C3(0,0,0,T3,		P9,T10,T9,T8);
linedecoder C4(T6,T5,T4,B1,	P4,P3,P2,P1);
linedecoder C5(T10,T9,T8,T7,	P8,P7,P6,P5);

endmodule


module BCD_to_7segment(
	D3,D2,D1,D0,
	A,B,C,D,E,F,G
);

/*
   [a]
[f]   [b]
   [g]
[e]   [c]
   [d]   [dp]
*/

input D3,D2,D1,D0;
output A,B,C,D,E,F,G;

reg [7:0] out; 

always @(D3,D2,D1,D0)
begin
case({D3,D2,D1,D0})
	4'b0000 : out <= 7'b1111110; //0
	4'b0001 : out <= 7'b0110000; //1
	4'b0010 : out <= 7'b1101101; //2
	4'b0011 : out <= 7'b1111001; //3
	4'b0100 : out <= 7'b0110011; //4
	4'b0101 : out <= 7'b1011011; //5
	4'b0110 : out <= 7'b1011111; //6
	4'b0111 : out <= 7'b1110010; //7
	4'b1000 : out <= 7'b1111111; //8
	4'b1001 : out <= 7'b1111011; //9
	default : out <= 7'b0000000; //NULL
endcase 
end

assign {A,B,C,D,E,F,G} = out;

endmodule
