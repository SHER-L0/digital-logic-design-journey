`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/02 21:43:05
// Design Name: 
// Module Name: test_decode24
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


module test_decode24(

    );
    reg [1:0] x;
    reg en;
    wire [3:0] y;
    decode24 i1(
        .en(en),
        .x(x),
        .y(y)
    );
    initial begin
        en = 1'b 0;     x = 2'b 00;     #10;
                        x = 2'b 01;     #10;
                        x = 2'b 10;     #10;
                        x = 2'b 11;     #10;
        en = 1'b 1;     x = 2'b 00;     #10;
                        x = 2'b 01;     #10;
                        x = 2'b 10;     #10;
                        x = 2'b 11;     #10;              
    end
endmodule
