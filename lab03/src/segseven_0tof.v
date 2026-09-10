`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/09 16:27:59
// Design Name: 
// Module Name: segseven_0tof
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


module segseven_0tof(
    input [3:0] digit,
    input valid,
    output reg[7:0] HEX
    );
    always @(*) begin
        if (valid == 0) begin
            HEX = 8'b11111111;
        end
        else
    begin
        case (digit)
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
    end
endmodule
