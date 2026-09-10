`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/04 09:10:39
// Design Name: 
// Module Name: ALU_4bit
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


module ALU_4bit(
    input [3:0] A,
    input [3:0] B,
    input [2:0] SEL,
    output [3:0] Result,
    output Overflow,
    output Carry,
    output Zero 
    );
    wire [3:0] Not_out, And_out,    Or_out, Xor_out;
    wire [3:0] adder_result;
    wire adder_overflow,    adder_zero,     adder_carry;
    reg sub;

    assign Not_out = ~ A;
    assign And_out = A & B;
    assign Or_out = A | B;
    assign Xor_out = A ^ B;
    assign Carry = (SEL == 3'b000 || SEL == 3'b001) ? adder_carry : 1'b0;
    assign Overflow = (SEL == 3'b000 || SEL == 3'b001) ? adder_overflow : 1'b0;
    assign Zero = ~(|Result);

    adder_4bit adder(   .A(A),
                        .B(B),
                        .Sub(sub),
                        .Result(adder_result),
                        .Carry(adder_carry),
                        .Zero(adder_zero),
                        .Overflow(adder_overflow));

    mux81_ALU mux(      .SEL(SEL),
                        .add(adder_result),
                        .sub(adder_result),
                        .Not(Not_out),
                        .And(And_out),
                        .Or(Or_out),
                        .Xor(Xor_out),
                        .compare({3'b000, adder_result[3] ^ adder_overflow}),
                        .isequal({3'b000, adder_zero}),
                        .result(Result));
    always @(*) begin
        case (SEL)
            3'b001:     sub = 1;
            3'b110:     sub = 1;
            3'b111:     sub = 1;
            default :   sub = 0;
        endcase
    end
endmodule