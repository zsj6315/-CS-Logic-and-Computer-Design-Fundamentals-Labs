module top (
    input wire [1 : 0] btn,
    input wire [1 : 0] op,
    input wire clk,
    input wire [7 : 0] SW,
    output wire [3 : 0] AN,
    output wire [7 : 0] SEGMENT,
    output wire BTNX4,
    output wire Ring
);
    
    reg GND;
    wire RST;
    initial GND <= 0;
    assign BTNX4 = GND;
    assign RST = GND;
    assign Ring = GND; 

    wire [3 : 0] I0, I1, I2, I3, Hex;
    wire [31 : 0] clkd;
    wire P, LE;
    
    clkdiv cd(.clk(clk), .rst(RST), .clkdiv(clkd));
    create_number numc(.clk(clkd[7]), .btn(btn), .op(op), .n0(I0), .n1(I1), .n2(I2), .n3(I3));

    display_sync ds(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .Hex(Hex), .AN(AN), .scan(clkd[18 : 17]), .points(SW[3 : 0]), .LES(SW[7 : 4]), .p(P), .LE(LE));
    MyMC14495 MyMc(.D0(Hex[0]), .D1(Hex[1]), .D2(Hex[2]), .D3(Hex[3]), .point(P), .LE(LE), 
    .a(SEGMENT[0]), .b(SEGMENT[1]), .c(SEGMENT[2]), .d(SEGMENT[3]), .e(SEGMENT[4]), .f(SEGMENT[5]), .g(SEGMENT[6]), .p(SEGMENT[7]));

endmodule