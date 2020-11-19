module logicCircuit(
    input [3:0] Adata, Bdata,
    input [1:0] S1,
    output [3:0] Gout
);


wire [3:0] logic0, logic1, logic2, logic3;
assign logic0 = Adata&Bdata;
assign logic1 = Adata|Bdata;
assign logic2 = Adata^Bdata;
assign logic3 = ~Adata;

MUX4to1 logicSel(logic3,logic2,logic1,logic0, S1, Gout);

endmodule