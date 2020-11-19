module regFile(
    input CLK,
    input Write,
    input [3:0] Ddata,
    input [1:0] Daddr, Aaddr, Baddr,
    output [3:0] Adata, Bdata,
    output [3:0] Reg0,Reg1,Reg2,Reg3  // for debug
);


reg[3:0] R0, R1, R2, R3;
wire[3:0] L0;

dec2to4 DECODER(Daddr, L0);

always @(posedge CLK)
begin
	if(Write)
		begin
			if(L0[0])
				R0 = Ddata;
			else if(L0[1])
				R1 = Ddata;
			else if(L0[2])
				R2 = Ddata;
			else if(L3[3])
				R3 = Ddata;
		end
end

MUX4to1 MUX1(R3,R2,R1,R0,Aaddr, Adata);
MUX4to1 MUX2(R3,R2,R1,R0,Baddr, Bdata);

assign Reg0 = R0;
assign Reg1 = R1;
assign Reg2 = R2;
assign Reg3 = R3;