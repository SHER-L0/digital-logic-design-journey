`timescale 1ns / 1ps

module lab01_2bit_mux41(
    input [15:0] SW,
    output wire[15:0] LED,
    output wire[7:0] AN,
    output wire[7:0] HEX
    );
    twobit_mux41 mux41_2bit(    .y(SW[1:0]),
                                .x0(SW[3:2]),
                                .x1(SW[5:4]),
                                .x2(SW[7:6]),
                                .x3(SW[9:8]),
                                .f(LED[1:0]));
endmodule