module pbdebounce (
    input wire clk_1ms,
    input wire I,
    output reg O
);
    reg [7 : 0] pbshift;
    initial begin
        O = 0;
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