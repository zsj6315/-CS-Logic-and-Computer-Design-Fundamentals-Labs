module display_sync (
    input wire [3 : 0] I0, I1, I2, I3, points, LES,
    input wire [1 : 0] scan,
    output wire [3 : 0] Hex, AN,
    output wire p, LE
);
    Mux_4_1_b4 Muxb4(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .s(scan), .o(Hex));

    wire [3 : 0] M;
    decoder_2_4 d24_1(.s(scan), .outp(M));
    assign p = (M[0] & points[0]) | (M[1] & points[1]) | (M[2] & points[2]) | (M[3] & points[3]);
    assign LE = (M[0] & LES[0]) | (M[1] & LES[1]) | (M[2] & LES[2]) | (M[3] & LES[3]);
    assign AN = ~M;
    
endmodule