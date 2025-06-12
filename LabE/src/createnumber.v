module pbdebounce (
    input wire clk_1ms,
    input wire I,
    output reg O
);
    reg [7 : 0] pbshift;
    initial begin
        O = 0;
        pbshift = 8'b00000000;
    end
    always @(posedge clk_1ms) begin
        pbshift = pbshift << 1;
        pbshift[0] = I;
        if(pbshift == 8'h00) O = 0;
        if(pbshift == 8'hFF) O = 1;
    end
endmodule

module create_number (
    input wire clk,
    input wire [3 : 0] btn,
    output reg [3 : 0] n0, n1, n2, n3
);
    

    wire [3 : 0] t0, t1, t2, t3;

    assign t0 = n0 + 1'b1;
    assign t1 = n1 + 1'b1;
    assign t2 = n2 + 1'b1;
    assign t3 = n3 + 1'b1;

    wire [3 : 0] tbtn;

    
    initial begin
        {n3, n2, n1, n0} <= 16'b0000000000000000;
    end
    pbdebounce db0(.clk_1ms(clk), .I(btn[0]), .O(tbtn[0]));
    pbdebounce db1(.clk_1ms(clk), .I(btn[1]), .O(tbtn[1]));
    pbdebounce db2(.clk_1ms(clk), .I(btn[2]), .O(tbtn[2]));
    pbdebounce db3(.clk_1ms(clk), .I(btn[3]), .O(tbtn[3]));
    
    always @(posedge tbtn[0]) n0 <= t0; 
    always @(posedge tbtn[1]) n1 <= t1; 
    always @(posedge tbtn[2]) n2 <= t2; 
    always @(posedge tbtn[3]) n3 <= t3; 
    
endmodule

module create_clock_00 (
    input wire clk,
    input wire clk_1ms,
    input wire [3 : 0] btn,
    output wire [3 : 0] n0, n1, n2, n3, n4, n5, n6, n7
);
    reg [25 : 0] tick;
    reg EN;
    wire [3 : 0] tbtn;

    pbdebounce db0(.clk_1ms(clk_1ms), .I(btn[0]), .O(tbtn[0]));
    pbdebounce db1(.clk_1ms(clk_1ms), .I(btn[1]), .O(tbtn[1]));
    pbdebounce db2(.clk_1ms(clk_1ms), .I(btn[2]), .O(tbtn[2]));
    pbdebounce db3(.clk_1ms(clk_1ms), .I(btn[3]), .O(tbtn[3]));

    reg old0, old1;
    initial begin
        old0 <= 0;
        old1 <= 0;
        tick <= 0;
        EN <= 0;
    end

    always @(posedge clk) begin
        old0 <= tbtn[0];
        old1 <= tbtn[1];
        if(old0 == 0 && tbtn[0] == 1) begin
            tick <= 0;
            EN <= 0;
        end
        else if(old1 == 0 && tbtn[1] == 1) begin
            EN <= EN ^ 1;
        end
        else begin
            tick <= (tick + EN) % 8640000;
        end
    end

    
    assign n0 = tick % 10;
    assign n1 = (tick / 10) % 10;
    assign n2 = ((tick / 100) % 60) % 10;
    assign n3 = ((tick / 100) % 60) / 10;
    assign n4 = ((tick / 100 / 60) % 60) % 10;
    assign n5 = ((tick / 100 / 60) % 60) / 10;
    assign n6 = ((tick / 100 / 60 / 60) % 24) % 10;
    assign n7 = ((tick / 100 / 60 / 60) % 24) / 10;
    
endmodule