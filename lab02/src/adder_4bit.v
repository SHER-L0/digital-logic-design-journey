`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/04 00:32:36
// Design Name: 
// Module Name: adder_4bit
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


module adder_4bit(
    input [3:0] A,
    input [3:0] B,
    input Sub,
    output [3:0] Result,
    output Carry,
    output Zero,
    output Overflow
    );
    wire [3:0] B2;
    assign B2 = {4{Sub}} ^ B;
    assign {Carry,  Result} = A + B2 + Sub;
    assign Overflow = (A[3] == B2[3]) && (Result[3] != A[3]);
    assign Zero = ~ (| Result);
endmodule
