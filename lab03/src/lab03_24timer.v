`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/09 22:03:48
// Design Name: 
// Module Name: lab03_24timer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab03_24timer(
    input CLK100MHZ,
    input [15:0] SW,
    output [7:0] AN,
    output [7:0] HEX
    );
    wire clk_1s, clk_scan;
    wire [3:0] sec0, sec1, min0, min1, hour0, hour1;
    wire [3:0] dispaly_code;
    clkgen #(1) clkgen_1s( .clkin(CLK100MHZ),
                        .rst(SW[0]),
                        .clken(1),
                        .clkout(clk_1s));
    clkgen #(10000) clkgen_scan( .clkin(CLK100MHZ),
                                 .rst(SW[0]),
                                 .clken(1),
                                 .clkout(clk_scan));
    timer_core timer_24(    .clk_1s(clk_1s),
                            .rst(SW[0]),
                            .en(SW[1]),
                            .sec0(sec0),
                            .sec1(sec1),
                            .min0(min0),
                            .min1(min1),
                            .hour0(hour0),
                            .hour1(hour1));
    display_6bit display_timer_24(      .clk_scan(clk_scan),
                                        .rst(SW[0]),
                                        .sec0(sec0),
                                        .sec1(sec1),
                                        .min0(min0),
                                        .min1(min1),
                                        .hour0(hour0),
                                        .hour1(hour1),
                                        .an(AN),
                                        .display(dispaly_code));
    segseven_0tof sevenseg(     .digit(dispaly_code),
                                .valid(1),
                                .HEX(HEX));
endmodule