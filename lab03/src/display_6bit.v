`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/09 21:51:06
// Design Name: 
// Module Name: display_6bit
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


module display_6bit(
    input clk_scan,
    input rst,
    input [3:0] sec0,
    input [3:0] sec1,
    input [3:0] min0,
    input [3:0] min1,
    input [3:0] hour0,
    input [3:0] hour1,
    output reg [7:0] an,
    output reg [3:0] display
);

    reg[2:0] select;

    always @(posedge clk_scan or posedge rst) begin
    if (rst) begin
        select = 3'b000;
    end
    else if (select == 3'b101)
        select <= 3'b000;
    else
        select <= select + 1'b1;
    end

    always @(*) begin
        case (select)
            3'b000: begin
                if(| {hour1, hour0, min1, min0, sec1, sec0} == 0) begin
                    an <= 8'b 11000000;
                end
                else
                    an <=8'b11111110;
                display <= sec0;
            end

            3'b001: begin
                an <= 8'b11111101;
                display <= sec1;
            end
            3'b010: begin
                an <= 8'b11111011;
                display <= min0;
            end
            3'b011: begin
                an <= 8'b11110111;
                display <= min1;
            end
            3'b100: begin
                an <= 8'b11101111;
                display <= hour0;
            end
            3'b101: begin
                an <= 8'b11011111;
                display <= hour1;
            end
        endcase
    end

endmodule
