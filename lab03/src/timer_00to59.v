`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/09 16:04:47
// Design Name: 
// Module Name: timer_00to59
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


module timer_00to59(
    input clk_1s,
    input rst,
    input en,
    output reg [3:0] digit0,
    output reg [3:0] digit1
);

    always @(posedge clk_1s or posedge rst) begin

        if (rst) begin
            digit0 <= 0;
            digit1 <= 0;
        end

        else if (en) begin

            if (digit0 < 9) begin
                digit0 <= digit0 + 1;
            end

            else begin
                digit0 <= 0;

                if (digit1 < 5)
                    digit1 <= digit1 + 1;
                else
                    digit1 <= 0;
            end

        end

    end

endmodule
