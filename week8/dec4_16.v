module dec4_16 (
    input [3:0] bin_in,         // 4 bit binary input
    input enable,         // Enable bit for decoder
    output reg [15:0] dec_out // 16 bit decoder output
);


always @(enable or bin_in)
begin
    dec_out = 0;
    if (enable)
    begin
        case (bin_in)
         4'h0 : dec_out = 16'h0001;
         4'h1 : dec_out = 16'h0002;
         4'h2 : dec_out = 16'h0004;
         4'h3 : dec_out = 16'h0008;
         4'h4 : dec_out = 16'h0010;
         4'h5 : dec_out = 16'h0020;
         4'h6 : dec_out = 16'h0040;
         4'h7 : dec_out = 16'h0080;
         4'h8 : dec_out = 16'h0100;
         4'h9 : dec_out = 16'h0200;
         4'hA : dec_out = 16'h0400;
         4'hB : dec_out = 16'h0800;
         4'hC : dec_out = 16'h1000;
         4'hD : dec_out = 16'h2000;
         4'hE : dec_out = 16'h4000;
         4'hF : dec_out = 16'h8000;
        endcase
    end
end

endmodule
