`timescale 1ns/1ns

module tb_adder;
    reg [3 : 0] A, B;
    reg Ci;
    wire [3 : 0] S;
    wire Co;
    reg clk;

    initial begin
        A = 0;
        B = 0;
        Ci = 0;
        clk = 0;
    end

    Adder_4b adder(.A(A), .B(B), .Ci(Ci), .Co(Co), .S(S));

    always begin
        #50 clk = ~clk;
    end

    always @(posedge clk) begin
        #1 Ci = {$random};
        #3 A = {$random};
        #3 B = {$random};
    end


    initial begin
        $dumpfile(".\\build\\wave.vcd");
        $dumpvars(0, tb_adder);
        #10000 $finish;
    end
    
endmodule