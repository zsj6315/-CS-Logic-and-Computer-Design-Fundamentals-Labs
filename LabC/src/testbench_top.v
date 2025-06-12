`timescale 1ns/1ns

module uut;
    reg [9 : 0] SW;
    reg clk;

    wire [3 : 0] AN;
    wire [7 : 0] SEGMENT;
    wire BTNX4;
    wire Ring;

    top uut0(.clk(clk), .SW(SW), .AN(AN), .SEGMENT(SEGMENT), .BTNX4(BTNX4), .Ring(Ring));

    initial begin
        clk = 0;
    end
    always begin
        #5 clk = ~clk;
    end

    initial begin
        SW = 10'b00_0000_0000;
        #5000 SW[2] = 1;
        #5000 SW[2] = 0;
        #5000 SW[3] = 1;
        #5000 SW[3] = 0;
        #5000 SW[3] = 1;
        #5000 SW[3] = 0;
        #5000 SW[4] = 1;
        #5000 SW[4] = 0;
        #5000 SW[8] = 1;
        #5000 SW[2] = 1; SW[3] = 1; SW[9] = 1;
        #5000 SW[9] = 0; SW[8] = 0;
        
    end

    initial begin
        $dumpfile(".\\build\\wave.vcd");
        $dumpvars(0, uut);
        #1000000 $finish;
    end
    
endmodule