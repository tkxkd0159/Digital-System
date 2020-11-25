module functionUnit(
    input [3:0] Adata, Bdata,
    input [3:0] FS,   //  {S, [1:0]S1, Cin}
    output [3:0] Fout
);



wire [3:0] ArithOut;
wire [3:0] Cout;
wire [3:0] LogicOut;

arithmeticCircuit CIRCUIT1(Adata, Bdata, FS[2:1],FS[0], ArithOut, Cout);
logicCircuit CIRCUIT2(Adata, Bdata, FS[2:1], LogicOut);

MUX2to1 ALUMux(LogicOut, ArithOut, FS[3], Fout);

endmodule