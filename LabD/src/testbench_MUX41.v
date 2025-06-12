`timescale 1ns/1ns

module tb_MUX;
    reg [3 : 0] I0, I1, I2, I3;
    reg [1 : 0] s;
    wire [3 : 0] o;
    reg clk;

    initial begin
        I0 = 0;
        I1 = 0;
        I2 = 0;
        I3 = 0;
        s = 0;
        clk = 0;
    end

    always begin
        #50 clk = ~clk;
    end

    always @(posedge clk) begin
        #1 I0 = {$random};
        #3 I1 = {$random};
        #3 I2 = {$random};
        #3 I3 = {$random};
        #2 s = {$random};
    end

    Mux_4_1_b4 Muxer(.s(s), .I0(I0), .I1(I1), .I2(I2), .I3(I3), .o(o));

    initial begin
        $dumpfile(".\\build\\wave.vcd");
        $dumpvars(0, tb_MUX);
        #10000 $finish;
    end
    
endmodule