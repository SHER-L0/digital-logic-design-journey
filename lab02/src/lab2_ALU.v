`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/04 15:55:28
// Design Name: 
// Module Name: lab2_ALU
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


module lab2_ALU(
    input [15:0] SW,
    output [15:0] LED,
    output [7:0] AN,
    output reg [7:0] HEX
    );

    wire [3:0] ALU_result;

    assign AN = 8'b11111110;
    assign LED[15:7] = 9'b000000000;
    
    ALU_4bit ALU(   .A(SW[3:0]),
                    .B(SW[7:4]),
                    .SEL(SW[10:8]),
                    .Result(ALU_result),
                    .Overflow(LED[4]),
                    .Carry(LED[5]),
                    .Zero(LED[6]));

    assign LED[3:0] = ALU_result;
    always @(*) begin
        case (ALU_result)
            4'b0000:    HEX = 8'b00000011;
            4'b0001:    HEX = 8'b11110011;
            4'b0010:    HEX = 8'b01001001;
            4'b0011:    HEX = 8'b01100001;
            4'b0100:    HEX = 8'b10110001;
            4'b0101:    HEX = 8'b00100101;
            4'b0110:    HEX = 8'b00000101;
            4'b0111:    HEX = 8'b01110011;
            4'b1000:    HEX = 8'b00000001;
            4'b1001:    HEX = 8'b00100001;
            4'b1010:    HEX = 8'b00010001;
            4'b1011:    HEX = 8'b10000101;
            4'b1100:    HEX = 8'b00001111;
            4'b1101:    HEX = 8'b11000001;
            4'b1110:    HEX = 8'b00001101;
            4'b1111:    HEX = 8'b00011101;
        endcase
    end
endmodule