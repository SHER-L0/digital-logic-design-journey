`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/09 16:33:58
// Design Name: 
// Module Name: lab03_timer
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


module lab03_timer(
    input CLK100MHZ,
    input [15:0] SW,
    output [7:0] AN,
    output [7:0] HEX
    );
    wire clk_1s, clk_scan;
    wire [3:0] digit0, digit1;
    wire [3:0] dispaly_code;
    clkgen #(1) clkgen_1s( .clkin(CLK100MHZ),
                        .rst(SW[0]),
                        .clken(1),
                        .clkout(clk_1s));
    clkgen #(10000) clkgen_scan( .clkin(CLK100MHZ),
                                 .rst(SW[0]),
                                 .clken(1),
                                 .clkout(clk_scan));
    timer_00to59 timer( .clk_1s(clk_1s),
                        .rst(SW[0]),
                        .en(SW[1]),
                        .digit0(digit0),
                        .digit1(digit1));
    display_2digit display_lab3( .clk_scan(clk_scan),
                                 .rst(SW[0]),
                                 .digit0(digit0),
                                 .digit1(digit1),
                                 .an(AN),
                                 .display(dispaly_code));
    segseven_0tof sevenseg_lab3( .digit(dispaly_code),
                                 .valid(1),
                                 .HEX(HEX));
endmodule
