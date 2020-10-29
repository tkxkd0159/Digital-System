module test_counter(
	input RST, CLK,
	output reg Q1, Q2, Q4, Q8
	);

	
	

	always begin
		if(RST) begin 
			Q1<=1'b0;
			Q2<=1'b0;
			Q4<=1'b0;
			Q8<=1'b0;
			end
		
		@(negedge CLK); 
			Q1 <= ~Q1;

		
		@(negedge Q1);
			Q2 <= ~Q2;
	
	
		@(negedge Q2);
			Q4 <= ~Q4;

		
		@(negedge Q4);
			Q8 <= ~Q8;
							
				
	end
		


endmodule
