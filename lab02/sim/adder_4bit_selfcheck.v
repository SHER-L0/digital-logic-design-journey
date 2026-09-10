`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/07 17:46:40
// Design Name: 
// Module Name: adder_4bit_selfcheck
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


module adder_4bit_selfcheck(

    );
    reg signed [3:0]  a,    b;
    reg sub;
    wire signed[3:0] result;
    wire carry, zero,   overflow;
    integer i,  j;
    adder_4bit adder( .A(a),
                .B(b),
                .Sub(sub),
                .Result(result),
                .Carry(carry),
                .Zero(zero),
                .Overflow(overflow));

    task check;
        input signed[3:0] expected;
        begin
            if(result != expected)
                $display("ERROR: a = %d b = %d expected = %d result = %d",  a,  b,  expected,   result);
        end
    endtask

    initial begin
        sub = 0;
        for(i = -8; i < 8; i = i + 1)begin
            for (j = -8 ; j < 8; j = j + 1) begin
                a = i;
                b = j;
                #10;
                check(i + j);
            end
        end
        sub = 1;
        for(i = -8; i < 8; i = i + 1)begin
            for (j = -8 ; j < 8; j = j + 1) begin
                a = i;
                b = j;
                #10;
                check(i - j);
            end
        end
    end
endmodule