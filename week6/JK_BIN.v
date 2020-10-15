module JK_BIN(
	input  J, K, CLK, RST,
	output reg Q
);

  always @(negedge CLK) 
  begin
	if(RST)
		Q <= 1'b0;
	else begin
    case({J,K})
      2'b00 : Q <= Q;
      2'b01 : Q <= 1'b0;
      2'b10 : Q <= 1'b1;
      2'b11 : Q <= ~Q;
    endcase
  end
  end

endmodule
