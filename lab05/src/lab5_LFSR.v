module lab5_LFSR (
    input CLK100MHZ,
    input [15:0] SW,
    output [7:0] AN,
    output [7:0] HEX
);
    wire clk_scan;
    wire [7:0] LFSR_out; 
    wire [3:0] display_digit;
    wire clk_debounced;

    debounce LFSR_debounce( .clk(CLK100MHZ),
                            .rst(SW[0]),
                            .btn_in(SW[9]),
                            .btn_out(clk_debounced));  

    clkgen #(10000) clkgen_scan( .clkin(CLK100MHZ),
                                 .rst(SW[0]),
                                 .clken(1),
                                 .clkout(clk_scan));

    LFSR lfsr(  .clk(clk_debounced),
                .initial_data(SW[8:1]),
                .rst(SW[0]),
                .data_out(LFSR_out));

    display_2digit LFSR_display(.clk_scan(clk_scan),
                                .rst(SW[0]),
                                .digit0(LFSR_out[3:0]),
                                .digit1(LFSR_out[7:4]),
                                .an(AN),
                                .display(display_digit));

    segseven_0tof LFSR_segseven(.digit(display_digit),
                                .valid(1),
                                .HEX(HEX));
endmodule //lab5_LFSR
