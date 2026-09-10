`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/02 23:20:01
// Design Name: 
// Module Name: 2bit_mux41
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


module twobit_mux41(
    input [1:0] x0,
    input [1:0] x1,
    input [1:0] x2,
    input [1:0] x3,
    input [1:0] y,
    output reg[1:0] f
    );
    always @(y or x1 or x2 or x3 or x0) begin
        case (y)
            2'b 00:     f = x0;
            2'b 01:     f = x1;
            2'b 10:     f = x2;
            2'b 11:     f = x3;
            default:        f = 2'b zz;
        endcase
    end
endmodule
