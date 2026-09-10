`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/10 16:01:20
// Design Name: 
// Module Name: gen_1s_tick
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


module gen_1s_tick(
    input clkin,
    input rst,
    output reg tick
    );
    reg [26:0] count;

    always @(posedge clkin) begin
        if (rst) begin
            count <= 0;
            tick <= 0;
        end
        else if (count == 99999999) begin
            count <= 0;
            tick <= 1;
        end
        else begin
            count <= count + 1;
            tick <= 0;
        end
    end
endmodule
