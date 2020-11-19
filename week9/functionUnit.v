module functionUnit(
    input [3:0] Adata, Bdata,
    input [3:0] FS,   //  {Cin, S, S1}
    output [3:0] Fout
);



wire [3:0] ArithOut;
wire [3:0] Cout;
wire [3:0] LogicOut;

arithmeticCircuit CIRCUIT1(Adata, Bdata, FS[1:0],FS[3], ArithOut, Cout);
logicCircuit CIRCUIT2(Adata, Bdata, FS[1:0], LogicOut);

MUX2to1 ALUMux(LogicOut, ArithOut, FS[2], Fout);

endmodule