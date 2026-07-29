`timescale 1ns / 1ps

module tb_adc_acquisition;

    reg clk;
    reg rst;
    reg start_conv;
    reg [7:0] adc_raw_data;
    
    wire adc_cs;
    wire adc_rd;
    wire [7:0] sample_data;
    wire data_valid;
    wire tx_line;
    wire tx_busy;

    adc_fsm uut_adc (
        .clk(clk), .rst(rst), .start_conv(start_conv),
        .adc_raw_data(adc_raw_data), .adc_cs(adc_cs),
        .adc_rd(adc_rd), .sample_data(sample_data), .data_valid(data_valid)
    );

    uart_tx uut_uart (
        .clk(clk), .rst(rst), .tx_start(data_valid),
        .tx_data(sample_data), .tx_line(tx_line), .busy(tx_busy)
    );

    always 

    initial begin
        clk = 0;
        rst = 1;
        start_conv = 0;
        adc_raw_data = 8'h00;

        adc_raw_data = 8'hA5;
        start_conv = 1;
 
        adc_raw_data = 8'h3C;
        start_conv = 1;

        
        $display("Simulation Completed Successfully!");
        $finish;
    end
endmodule
