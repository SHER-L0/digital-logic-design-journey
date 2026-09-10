`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/04 09:19:01
// Design Name: 
// Module Name: mux81_ALU
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


module mux81_ALU(
    input [2:0] SEL,
    input [3:0] add, sub, Not, And, Or, Xor, compare, isequal,
    output reg[3:0] result
    );
    always @(*) begin
        case (SEL)
            3'b000:     result = add;
            3'b001:     result = sub;
            3'b010:     result = Not;
            3'b011:     result = And;
            3'b100:     result = Or;
            3'b101:     result = Xor;
            3'b110:     result = compare;
            3'b111:     result = isequal;
        endcase
    end
endmodule
