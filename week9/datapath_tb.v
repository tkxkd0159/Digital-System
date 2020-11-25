`timescale 10ns/1ps

module datapath_tb;

reg CLK;
reg [12:0] CW; // DA,AA,BA,muxB,{S, [1:0] S1, Cin}, muxD, write
reg [3:0] CONSTANT;
reg [3:0] DATA;
wire [3:0] reg0, reg1, reg2, reg3;

datapath RES0(CLK, CW, CONSTANT, DATA, reg0, reg1, reg2, reg3);

initial
 begin
     CW<=13'b0000000000000; CONSTANT<=4'b0000; DATA<=4'b0000;
     #10 DATA<=4'b0100; CW<=13'b0000000000011; //reg0
     #10 DATA<=4'b0101; CW<=13'b0100000000011; //reg1
     #10 DATA<=4'b0110; CW<=13'b1000000000011; //reg2
     #10 DATA<=4'b0111; CW<=13'b1100000000011; //reg3

     #20 CW<=13'b1100010001001;  // R3 = R0+R1 -> 9
     #20 CW<=13'b1011010010101;DATA<=4'b0011;  // R2 = R3-R1 -> 4

 end


 always
  begin
      CLK = 1'b0;
      #5;
      CLK = 1'b1;
      #5;
  end

endmodule
