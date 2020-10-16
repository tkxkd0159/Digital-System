`timescale 10ns/1ps


module testbench;


reg CLK;
wire Q1, Q2, Q4, Q8;

test_CNT U1_1(.CLK(CLK), .Q1(Q1), .Q2(Q2), .Q4(Q4), .Q8(Q8));






always
	begin
		CLK = 1'b0;
		# 5 CLK = 1'b1;
		# 5;
	end

always @(negedge CLK)
	begin
	$display("Negative Edge occur");
	end
				

endmodule
