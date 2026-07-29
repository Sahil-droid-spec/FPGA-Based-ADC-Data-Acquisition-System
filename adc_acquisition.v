module adc_fsm (
    input clk, input rst, input start_conv, input [7:0] adc_raw_data,
    output reg adc_cs, output reg adc_rd, output reg [7:0] sample_data, output reg data_valid
);
    reg [2:0] state;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 0; adc_cs <= 1; adc_rd <= 1; data_valid <= 0;
        end else begin
            case (state)
                0: if (start_conv) state <= 1; // IDLE
                1: begin adc_cs <= 0; state <= 2; end // SAMPLE
                2: begin adc_rd <= 0; state <= 3; end // CONVERT
                3: begin sample_data <= adc_raw_data; state <= 4; end // HOLD
                4: begin adc_cs <= 1; adc_rd <= 1; data_valid <= 1; state <= 0; end // OUTPUT
            endcase
        end
    end
endmodule

module uart_tx (
    input clk, input rst, input tx_start, input [7:0] tx_data,
    output reg tx_line, output reg busy
);
    reg [1:0] state; reg [2:0] bit_idx; reg [7:0] shift_reg;
    always @(posedge clk or posedge rst) begin
        if (rst) begin tx_line <= 1; busy <= 0; state <= 0; end
        else case (state)
            0: if (tx_start) begin shift_reg <= tx_data; busy <= 1; state <= 1; end
            1: begin tx_line <= 0; state <= 2; bit_idx <= 0; end // START BIT
            2: begin tx_line <= shift_reg[bit_idx]; 
               if (bit_idx == 7) state <= 3; else bit_idx <= bit_idx + 1; end // DATA
            3: begin tx_line <= 1; busy <= 0; state <= 0; end // STOP BIT
        endcase
    end
endmodule
