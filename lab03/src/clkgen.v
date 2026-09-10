`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/08 17:58:02
// Design Name: 
// Module Name: clkgen
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


module clkgen(
    input clkin,
    input rst,
    input clken,
    output  reg clkout
    );
    parameter clk_freq = 1000;
    parameter countlimit = 100000000 / clk_freq / 2 - 1;
    reg [31:0] clkcount;
    always @(posedge clkin) begin
        if (rst) begin
            clkcount <= 0;
            clkout <= 0;
        end
        else begin
            if (clken) begin
                if (clkcount == countlimit) begin
                    clkout <= ~clkout;
                    clkcount <= 0;
                end
                else begin
                    clkcount <= clkcount + 1;
                end
        end
    end
end
endmodule
