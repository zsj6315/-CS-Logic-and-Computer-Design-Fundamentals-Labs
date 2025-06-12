module LED_ctrl (
    input wire [3 : 0] I0, I1, I2, I3,
    input wire start,
    input wire clk,
    output wire clk_LED, o_LED, clr_LED, EN_LED
);
    assign EN_LED = 1;
    assign clr_LED = 1;
    
    wire [15 : 0] bits;
    reg [3 : 0] now;
    reg ST, old_start, outp, delay_1;
    initial begin
        ST = 0;
        now = 0;
        old_start = 0;
        delay_1 = 0;
    end
    always @(posedge clk) begin
        if(ST == 0 && start == 1 && old_start == 0) begin
             ST <= 1;
             now <= 4'b1111;
        end
        else begin 
            ST <= ST & (now != 4'b0000);
            now <= ST == 0 ? 4'b0000 : now - 1;
        end
        delay_1 <= ST & now == 4'b0000;
        outp <= ~bits[(now + 15) & 4'b1111];
        old_start <= start;
    end
    
    assign clk_LED = (clk & ST) | delay_1;
    assign bits = {I3, I2, I1, I0};
    assign o_LED = outp;

endmodule