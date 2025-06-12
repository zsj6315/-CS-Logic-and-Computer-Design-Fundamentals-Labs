`timescale 1ns/1ns

module uut;
    reg [3 : 0] btn;
    reg [8 : 0] SW;
    reg clk;

    wire [3 : 0] AN;
    wire [7 : 0] SEGMENT;
    wire BTNX4;

    initial begin
        btn = 0;
        SW = 9'b011111111;
        clk = 0;
    end

    top uut0(.btn(btn), .clk(clk), .SW(SW), .AN(AN), .SEGMENT(SEGMENT), .BTNX4(BTNX4));

    always begin
        #5 clk = ~clk;
    end

    initial begin
        #5000 btn = 4'b0001;
        #10000 btn = 4'b0000;
        #5000 btn = 4'b0001;
        #10000 btn = 4'b0000;
        #5000 btn = 4'b0010;
        #10000 btn = 4'b0000;
        #5000 btn = 4'b0100;
        #10000 btn = 4'b0000;
        #5000 SW[8] = 1;
        #5000 SW[8] = 0;
    end

    initial begin
        $dumpfile(".\\build\\wave.vcd");
        $dumpvars(0, uut);
        #1000000 $finish;
    end
    
endmodule