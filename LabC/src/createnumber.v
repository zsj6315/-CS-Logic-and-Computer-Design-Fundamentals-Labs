module pbdebounce (
    input wire clk_1ms,
    input wire I,
    output reg O
);
    reg [7 : 0] pbshift;
    initial begin
        O = 0;
        pbshift = 0;
    end
    always @(posedge clk_1ms) begin
        pbshift = pbshift << 1;
        pbshift[0] = I;
        if(pbshift == 8'h00) O = 0;
        if(pbshift == 8'hFF) O = 1;
    end
endmodule

module loadreg (
    input wire clk, clk_1ms, btn,
    input wire [3 : 0] IN,
    output reg [3 : 0] A
);
    wire out_btn;
    reg old_btn, load;
    initial begin
        A = 0;
        old_btn = 0;
        load = 0;
    end
    pbdebounce pdb(.clk_1ms(clk_1ms), .I(btn), .O(out_btn));
    always @(posedge clk) begin
        load <= old_btn == 0 && out_btn == 1;
        old_btn <= out_btn;
    end

    always @(posedge clk) begin
        if(load) A <= IN;
    end


endmodule

module create_number (
    input wire clk, clk_1ms,
    input wire [9 : 0] SW,
    output wire [3 : 0] n0, n1, n2, n3
);
    assign n3 = 4'b0000;

    wire [3 : 0] INA, INB, INC, calcAB, chosenABC, addA, addB;
    wire Co, CoA, CoB;
    loadreg A(.clk(clk), .clk_1ms(clk_1ms), .btn(SW[2]), .IN(INA), .A(n0));
    loadreg B(.clk(clk), .clk_1ms(clk_1ms), .btn(SW[3]), .IN(INB), .A(n1));
    loadreg C(.clk(clk), .clk_1ms(clk_1ms), .btn(SW[4]), .IN(INC), .A(n2));
    Adder_4b AddA(.A(n0), .B(4'b0001), .op(SW[0]), .S(addA), .Co(CoA));
    Adder_4b AddB(.A(n1), .B(4'b0001), .op(SW[1]), .S(addB), .Co(CoB));
    
    ALU calc(.A(n0), .B(n1), .op(SW[6 : 5]), .S(calcAB), .Co(Co));

    Mux_4_1_b4 mux41(.I0(n0), .I1(n1), .I2(n2), .I3(n3), .s(SW[8 : 7]), .o(chosenABC));

    assign INA = SW[9] ? chosenABC : addA;
    assign INB = SW[9] ? chosenABC : addB;
    assign INC = SW[9] ? chosenABC : calcAB;
endmodule