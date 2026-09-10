`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/03 11:05:30
// Design Name: 
// Module Name: sevenseg
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


module sevenseg(
    input [2:0] code,
    input valid,
    output reg[7:0] hex
    );
    always @(code) begin
        if (valid == 0) begin
            hex = 8'b11111111;
        end
        else
    begin
        case (code)
            3'b000:     hex = 8'b00000011;
            3'b001:     hex = 8'b11110011;
            3'b010:     hex = 8'b01001001;
            3'b011:     hex = 8'b01100001;
            3'b100:     hex = 8'b10110001;
            3'b101:     hex = 8'b00100101;
            3'b110:     hex = 8'b00000101;
            3'b111:     hex = 8'b01110011;
            default :   hex = 8'b11111111;
                
        endcase
    end
    end
endmodule
