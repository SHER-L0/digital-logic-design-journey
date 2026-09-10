`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/04 00:51:51
// Design Name: 
// Module Name: adder_4bit_test
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


module adder_4bit_test(

    );
    reg [3:0] a,    b;
    reg s;
    wire [3:0] result;
    wire carry, overflow, zero;
    adder_4bit ADD(.A(a),
                    .B(b),
                    .Sub(s),
                    .Result(result),
                    .Carry(carry),
                    .Overflow(overflow),
                    .Zero(zero));
    initial begin
        a = 4'd2;   b = 4'd3;   s = 1'b0;   #10; 
        a = 4'd7;   b = 4'd1;   s = 1'b0;   #10;
        a = 4'd8;   b = 4'd15;   s = 1'b0;   #10;
        a = 4'd15;   b = 4'd1;   s = 1'b0;   #10;
        a = 4'd5;   b = 4'd3;   s = 1'b1;   #10;
        a = 4'd3;   b = 4'd5;   s = 1'b1;   #10;
        a = 4'd7;   b = 4'd15;   s = 1'b1;   #10;
        a = 4'd8;   b = 4'd1;   s = 1'b1;   #10;
        a = 4'd8;   b = 4'd8;   s = 1'b1;   #10;
    end
endmodule
