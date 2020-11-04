module TF_SIM(
    input RST, CLK,
    output reg [3:0] N_CAR,   //북쪽 차량 신호등 직 / 좌 / 황 /청
    output reg [1:0] WALK_N,  // 북쪽 보행자 신호등  청 / 적
    output [3:0] Q
);

supply1 p;

UPDN_CNT C0(RST, CLK, p, Q);

always @(Q)
begin
	if (RST)					// RST --> 모든 불 켬
		begin
		 N_CAR<=4'b1111;
		 WALK_N<=2'b11;
		end
	else
	if (Q<4'b0101 && Q>=4'b0000)  // 0 <= Q < 5 - 차량: 직/좌 보행자: 적
		begin
		 N_CAR<=4'b1100;
		 WALK_N<=2'b01;
		end
	else if (Q<4'b0111 && Q>=4'b0101) // 5<=Q<7 - 차량: 황 보행자: 적
		begin
		 N_CAR<=4'b0010;
		 WALK_N<=2'b01;
		end
	else
		begin
		 N_CAR<=4'b0001;
		 WALK_N<=2'b10;
		end
end

endmodule