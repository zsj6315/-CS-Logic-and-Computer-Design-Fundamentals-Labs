`timescale 1ns/1ns

module uut;
    reg [7 : 0] btn;
    reg [8 : 0] SW;
    reg clk;

    wire [3 : 0] AN;
    wire [7 : 0] SEGMENT;
    wire BTNX4;

    initial begin
        btn = 0;
        SW = 9'b000000000;
        clk = 0;
    end

    top uut0(.btn(btn[3 : 0]), .clk(clk), .SW(SW), .AN(AN), .SEGMENT(SEGMENT), .BTNX4(BTNX4));

    always begin
        #5 clk = ~clk;
    end

    initial begin
        #5000 SW[7 : 0] = 8'b00010001;
        #10000 SW[7 : 0] = 8'b00000000;
        #5000 SW[7 : 0] = 8'b00010001;
        #10000 SW[7 : 0] = 8'b00000000;
        #5000 SW[7 : 0] = 8'b01000010;
        #10000 SW[7 : 0] = 8'b00000000;
        #5000 SW[7 : 0] = 8'b00100100;
        #10000 SW[7 : 0] = 8'b00000000;
        #5000 SW[8] = 1;
        #5000 SW[8] = 0;
    end

    initial begin
        $dumpfile(".\\build\\wave.vcd");
        $dumpvars(0, uut);
        #200000 $finish;
    end
    
endmodule