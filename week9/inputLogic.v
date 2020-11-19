module inputLogic(
    input [3:0] Bdata,
    input [1:0] S1,
    output [3:0] Bout
);

MUX4to1 LogicMux(4'b1111, {Bdata^4'b1111}, Bdata, 4'b0000, S1, Bout);

endmodule