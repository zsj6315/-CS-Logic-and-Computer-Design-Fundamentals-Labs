module clkdiv (
    input wire clk, rst,
    output reg [31 : 0] clkdiv
);

    initial begin
        clkdiv <= 0;
    end
    
    always @(posedge clk or posedge rst) begin
        if(rst) clkdiv <= 0;
        else clkdiv <= clkdiv + 1'b1;
    end

endmodule