module test_counter(
	input RST, CLK,
	output reg Q1, Q2, Q4, Q8
	);

	
	

	always @(negedge CLK) begin
		if(RST) begin 
			Q1<=1'b0;
			end
		else begin
			Q1 <= ~Q1;
			end
	end

	always @(negedge Q1) begin
		if(RST) begin 
		  Q2<=1'b0;
		  end
		else begin
			Q2 <= ~Q2;
			end
	end
		
	always @(negedge Q2) begin
		if(RST) begin
			Q4<=1'b0;
			end
		else begin
			Q4 <= ~Q4;
			end
	end
	always @(negedge Q4) begin
		if(RST) begin
			Q8 <= 1'b0;
			end
		else begin
			Q8 <= ~Q8;
			end
	end
	
		

							
				

		


endmodule
