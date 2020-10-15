`timescale 10ns/1ps

module JK_tb();

	reg J, K, CLK;
	wire Q, NQ;
	integer i;
	
JK_FF U1(J, K, CLK, Q, NQ);

	always begin
		CLK = 1'b0;
		#3;
		CLK = 1'b1;
		#3;
		
	end
	
	initial begin
		i = 0;
	end
	
	always @(negedge CLK) begin
		case(i%4)
			0: begin
				J<=0; K<=0;
				i = i+1;
			end
			1: begin
				J<=1; K<=0;
				i = i+1;
			end
			2: begin
				J<=0; K<=1;
				i = i+1;
			end
		
			3: begin
				J<=1; K<=1;
				i = i+1;
			end
		endcase
	
	end
	
	
	
endmodule
	
	