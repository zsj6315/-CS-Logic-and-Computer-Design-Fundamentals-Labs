module decoder_2_4 (
    input wire [1 : 0] s,
    output wire [3 : 0] outp
);
    assign outp[0] = ~s[0] & ~s[1];
    assign outp[1] = s[0] & ~s[1];
    assign outp[2] = ~s[0] & s[1];
    assign outp[3] = s[0] & s[1];

endmodule

module Mux_4_1_b4 (
    input wire [1 : 0] s,
    input wire [3 : 0] I0, I1, I2, I3,
    output wire [3 : 0] o
);
    wire [3 : 0] Muxer;
    decoder_2_4 Decoder(.s(s), .outp(Muxer));
    assign o[0] = (Muxer[0] & I0[0]) | (Muxer[1] & I1[0]) | (Muxer[2] & I2[0]) | (Muxer[3] & I3[0]);
    assign o[1] = (Muxer[0] & I0[1]) | (Muxer[1] & I1[1]) | (Muxer[2] & I2[1]) | (Muxer[3] & I3[1]);
    assign o[2] = (Muxer[0] & I0[2]) | (Muxer[1] & I1[2]) | (Muxer[2] & I2[2]) | (Muxer[3] & I3[2]);
    assign o[3] = (Muxer[0] & I0[3]) | (Muxer[1] & I1[3]) | (Muxer[2] & I2[3]) | (Muxer[3] & I3[3]);
endmodule