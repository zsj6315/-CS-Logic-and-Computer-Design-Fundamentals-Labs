module LED_ctrl (
    input  wire        clk,       // input clock
    input  wire        start,     // start signal, rising edge valid
    input  wire [7:0]  I0, I1, I2, I3, I4, I5, I6, I7, // parallel input 8x8=64bit
    output wire        clk_LED,   // serial output clock
    output reg         o_LED,     // serial output data
    output reg         clr_LED,   // clear signal, high for 1 clk after start
    output reg         EN_LED     // enable signal, high during transmission
);
    reg [63:0] data_reg;
    reg [5:0]  bit_cnt;
    reg        sending;
    reg        start_d;
    reg        clr_flag;

    initial begin
        data_reg = 0;
        bit_cnt  = 0;
        sending  = 0;
        start_d  = 0;
        clr_flag = 0;
        clr_LED = 1;
        EN_LED = 1;
        o_LED = 0;
    end

    // Combine all inputs into a 64bit data, I7[7] is the highest bit, I0[0] is the lowest.
    wire [63:0] parallel_data = {I7, I6, I5, I4, I3, I2, I1, I0};

    // Detect rising edge of start
    always @(posedge clk) begin
        start_d <= start;
    end

    wire start_rise = (start == 1'b1) && (start_d == 1'b0);

    always @(posedge clk) begin
        if (!sending) begin
            if (start_rise) begin
                clr_LED  <= 1'b1;           // assert clear signal for one cycle
                clr_flag <= 1'b1;           // flag to enter sending state next cycle
                data_reg <= parallel_data;
                bit_cnt  <= 6'd0;
                sending  <= 1'b0;           // wait for clr to finish
                EN_LED   <= 1'b1;
                o_LED    <= 1'b0;
            end else begin
                clr_LED  <= 1'b1;
                EN_LED   <= 1'b1;
                o_LED    <= 1'b0;
            end
        end else begin
            clr_LED  <= 1'b1;                 // clear only lasts one cycle
            EN_LED   <= 1'b1;
            
            if (bit_cnt < 6'd63) begin
                o_LED    <= data_reg[63 - bit_cnt - 1]; // output from high bit to low bit
                bit_cnt  <= bit_cnt + 1'b1;
            end else begin
                bit_cnt  <= 0;
                sending  <= 1'b0;
                EN_LED   <= 1'b1;
            end
        end

        // if clr asserted, move to sending state next cycle
        if (clr_flag) begin
            clr_flag <= 1'b0;
            sending  <= 1'b1;
            o_LED <= data_reg[63];
        end
    end

    assign clk_LED = ~clk & sending;

endmodule