module arithmeticCircuit(
    input [3:0] Adata, Bdata,
    input [1:0] S1,
    input Cin,
    output [3:0] Gout,
    output Cout
);


wire [3:0] LogicOut;

inputLogic L0(Bdata, S1, LogicOut);
adder_4bit add0(Cout, Gout, Adata, LogicOut, Cin);

endmodule