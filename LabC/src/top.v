module top (
    input wire clk,
    input wire [9 : 0] SW,
    output wire [3 : 0] AN,
    output wire [7 : 0] SEGMENT,
    output wire BTNX4,
    output wire Ring
);
    
    wire RST;
    assign RST = 0;
    assign BTNX4 = 0;
    assign Ring = 0; 
    wire [3 : 0] I0, I1, I2, I3, Hex, Four0;
    assign Four0 = 4'b0000;
    wire [31 : 0] clkd;
    wire P, LE;
    
    clkdiv cd(.clk(clk), .rst(RST), .clkdiv(clkd));
    create_number numc(.clk(clk), .clk_1ms(clkd[7]), .SW(SW[9 : 0]), .n0(I0), .n1(I1), .n2(I2), .n3(I3));

    display_sync ds(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .Hex(Hex), .AN(AN), .scan(clkd[18 : 17]), .points(Four0), .LES(Four0), .p(P), .LE(LE));
    MyMC14495 MyMc(.D0(Hex[0]), .D1(Hex[1]), .D2(Hex[2]), .D3(Hex[3]), .point(P), .LE(LE), 
    .a(SEGMENT[0]), .b(SEGMENT[1]), .c(SEGMENT[2]), .d(SEGMENT[3]), .e(SEGMENT[4]), .f(SEGMENT[5]), .g(SEGMENT[6]), .p(SEGMENT[7]));

endmodule