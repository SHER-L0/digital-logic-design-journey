`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/02 12:36:59
// Design Name: 
// Module Name: lab01
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


module lab01_priority_sevensegdecoder(
    input [15:0] SW,
    output wire[15:0] LED,
    output wire[7:0] AN,
    output wire[7:0] HEX
    );
    wire[2:0] priority83_outcode;
    wire priority83_valid;
    assign AN = 8'b 11111110;
    priority83 priority83_1(.sw(SW[7:0]),
                         .en(SW[8]),
                         .code(priority83_outcode),
                         .valid(priority83_valid));
    sevenseg sevenseg_decoder(  .code(priority83_outcode),
                                .valid(priority83_valid),
                                .hex(HEX));
    assign LED[2:0] = priority83_outcode[2:0];
    assign LED[4] = priority83_valid;
endmodule
