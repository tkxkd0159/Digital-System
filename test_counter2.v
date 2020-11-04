module test_counter(
	input RST, CLK,
	output Q1, Q2, Q4, Q8
	);

	reg [3:0] Q;
	
	
	

	always @(negedge CLK) begin
		if(RST) begin 
		Q = 4'b0000;
			end
		else begin
			if(Q >= 4'b1111) Q = 4'b0000;
			else Q = Q+1;
			end
	end

  assign {Q8, Q4, Q2, Q1} = Q;
		

endmodule
