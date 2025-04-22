`timescale 1ns/1ns

module uut;
    reg [1 : 0] btn;
    reg [7 : 0] SW;
    reg [1 : 0] op;
    reg clk;

    wire [3 : 0] AN;
    wire [7 : 0] SEGMENT;
    wire BTNX4;
    wire Ring;

    initial begin
        btn = 0;
        SW = 8'hFF;
        clk = 0;
        op[0] = 0;
        op[1] = 0;
    end

    top uut0(.btn(btn), .clk(clk), .op(op), .SW(SW), .AN(AN), .SEGMENT(SEGMENT), .BTNX4(BTNX4), .Ring(Ring));

    always begin
        #5 clk = ~clk;
    end

    initial begin
        #5000 btn = 2'b01;
        #10000 btn = 4'b00;
        #5000 btn = 2'b01;
        #10000 btn = 2'b00;
        #5000 btn = 2'b10;
        #10000 btn = 2'b00;
        #5000 btn = 2'b10;
        #10000 btn = 2'b00;
        #5000 btn = 2'b10;
        #10000 btn = 2'b00;
        #5000 btn = 2'b01;
        #10000 btn = 2'b00;
    end

    initial begin
        $dumpfile(".\\build\\or.vcd");
        $dumpvars(0, uut);
        #1000000 $finish;
    end
    
endmodule