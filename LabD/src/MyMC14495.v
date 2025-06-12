module MyMC14495 (
    input wire D0, D1, D2, D3,
    input wire LE, point,
    output wire a, b, c, d, e, f, g, p
);

    assign D0n = ~D0;
    assign D1n = ~D1;
    assign D2n = ~D2;
    assign D3n = ~D3;

    assign a = LE | ((D3n & D2n & D1n & D0) | (D3n & D2 & D1n & D0n) | (D3 & D2n & D1 & D0) | (D3 & D2 & D1n & D0));
    assign b = LE | ((D3n & D2 & D1n & D0) | (D2 & D1 & D0n) | (D3 & D2 & D0n) | (D3 & D1 & D0));
    assign c = LE | ((D3n & D2n & D1 & D0n) | (D3 & D2 & D0n) | (D3 & D2 & D1));
    assign d = LE | ((D3n & D2n & D1n & D0) | (D3n & D2 & D1n & D0n) | (D2 & D1 & D0) | (D3 & D2n & D1 & D0n));
    assign e = LE | ((D3n & D0) | (D3n & D2 & D1n) | (D2n & D1n & D0));
    assign f = LE | ((D3n & D2n & D0) | (D3n & D2n & D1) | (D3n & D1 & D0) | (D3 & D2 & D1n & D0));
    assign g = LE | ((D3n & D2n & D1n) | (D3n & D2 & D1 & D0) | (D3 & D2 & D1n & D0n));

    assign p = ~point;
endmodule
