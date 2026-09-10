`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/09 15:44:34
// Design Name: 
// Module Name: display_2digit
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


module display_2digit(
    input clk_scan,
    input rst,
    input [3:0] digit0,
    input [3:0] digit1,
    output reg [7:0] an,
    output reg [3:0] display
);

    reg select;

    always @(posedge clk_scan) begin
        if (rst)
            select <= 1'b0;
        else
            select <= ~select;
    end

    always @(*) begin
        case (select)
            1'b0: begin
                an = 8'b11111110;
                display = digit0;
            end

            1'b1: begin
                an = 8'b11111101;
                display = digit1;
            end
        endcase
    end

endmodule
