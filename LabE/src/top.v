module top (
    input wire [3 : 0] btn,
    input wire clk,
    input wire [8 : 0] SW,
    output wire [3 : 0] AN,
    output wire [7 : 0] SEGMENT,
    output wire clk_LED, o_LED, clr_LED, EN_LED,
    output wire BTNX4,
    output wire Ring
);
    
    reg GND;
    wire RST;
    initial GND <= 0;
    assign BTNX4 = GND;
    assign RST = GND;
    assign Ring = GND; 

    wire [3 : 0] I0, I1, I2, I3, I4, I5, I6, I7, Hex;
    wire [7 : 0] S0, S1, S2, S3, S4, S5, S6, S7;
    assign Hex = 4'b0000;
    wire [31 : 0] clkd;

    wire P, LE;
    assign P = 0;
    assign LE = 0;
    
    clkdiv cd(.clk(clk), .rst(RST), .clkdiv(clkd));
    // create_number numc0(.clk(clkd[17]), .btn(SW[3 : 0]), .n0(I0), .n1(I1), .n2(I2), .n3(I3));
    // create_number numc1(.clk(clkd[17]), .btn(SW[7 : 4]), .n0(I4), .n1(I5), .n2(I6), .n3(I7));
    create_clock_00 count0(.btn(btn), .clk_1ms(clkd[17]), .clk(clkd[20]), .n0(I0), .n1(I1), .n2(I2), .n3(I3), .n4(I4), .n5(I5), .n6(I6), .n7(I7));

    // display_sync ds(.I0(I0), .I1(I1), .I2(I2), .I3(I3), .Hex(Hex), .AN(AN), .scan(clkd[18 : 17]), .points(SW[3 : 0]), .LES(SW[7 : 4]), .p(P), .LE(LE));
    MyMC14495 MyMc(.D0(Hex[0]), .D1(Hex[1]), .D2(Hex[2]), .D3(Hex[3]), .point(P), .LE(LE), 
    .a(SEGMENT[0]), .b(SEGMENT[1]), .c(SEGMENT[2]), .d(SEGMENT[3]), .e(SEGMENT[4]), .f(SEGMENT[5]), .g(SEGMENT[6]), .p(SEGMENT[7]));

    MyMC14495 MyMc0(.D0(I0[0]), .D1(I0[1]), .D2(I0[2]), .D3(I0[3]), .point(SW[0]), .LE(LE), 
    .a(S0[0]), .b(S0[1]), .c(S0[2]), .d(S0[3]), .e(S0[4]), .f(S0[5]), .g(S0[6]), .p(S0[7]));
    MyMC14495 MyMc1(.D0(I1[0]), .D1(I1[1]), .D2(I1[2]), .D3(I1[3]), .point(SW[0]), .LE(LE), 
    .a(S1[0]), .b(S1[1]), .c(S1[2]), .d(S1[3]), .e(S1[4]), .f(S1[5]), .g(S1[6]), .p(S1[7]));
    MyMC14495 MyMc2(.D0(I2[0]), .D1(I2[1]), .D2(I2[2]), .D3(I2[3]), .point(SW[0]), .LE(LE), 
    .a(S2[0]), .b(S2[1]), .c(S2[2]), .d(S2[3]), .e(S2[4]), .f(S2[5]), .g(S2[6]), .p(S2[7]));
    MyMC14495 MyMc3(.D0(I3[0]), .D1(I3[1]), .D2(I3[2]), .D3(I3[3]), .point(SW[0]), .LE(LE), 
    .a(S3[0]), .b(S3[1]), .c(S3[2]), .d(S3[3]), .e(S3[4]), .f(S3[5]), .g(S3[6]), .p(S3[7]));
    MyMC14495 MyMc4(.D0(I4[0]), .D1(I4[1]), .D2(I4[2]), .D3(I4[3]), .point(SW[0]), .LE(LE), 
    .a(S4[0]), .b(S4[1]), .c(S4[2]), .d(S4[3]), .e(S4[4]), .f(S4[5]), .g(S4[6]), .p(S4[7]));
    MyMC14495 MyMc5(.D0(I5[0]), .D1(I5[1]), .D2(I5[2]), .D3(I5[3]), .point(SW[0]), .LE(LE), 
    .a(S5[0]), .b(S5[1]), .c(S5[2]), .d(S5[3]), .e(S5[4]), .f(S5[5]), .g(S5[6]), .p(S5[7]));
    MyMC14495 MyMc6(.D0(I6[0]), .D1(I6[1]), .D2(I6[2]), .D3(I6[3]), .point(SW[0]), .LE(LE), 
    .a(S6[0]), .b(S6[1]), .c(S6[2]), .d(S6[3]), .e(S6[4]), .f(S6[5]), .g(S6[6]), .p(S6[7]));
    MyMC14495 MyMc7(.D0(I7[0]), .D1(I7[1]), .D2(I7[2]), .D3(I7[3]), .point(SW[0]), .LE(LE), 
    .a(S7[0]), .b(S7[1]), .c(S7[2]), .d(S7[3]), .e(S7[4]), .f(S7[5]), .g(S7[6]), .p(S7[7]));

    LED_ctrl ctrl1(.start(clkd[16]), .clk(clkd[0]), .I0(S0), .I1(S1), .I2(S2), .I3(S3), .I4(S4), .I5(S5), .I6(S6), .I7(S7), .clk_LED(clk_LED), .o_LED(o_LED), .clr_LED(clr_LED), .EN_LED(EN_LED));
endmodule