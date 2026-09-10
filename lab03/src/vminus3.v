`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/08 17:07:51
// Design Name: 
// Module Name: vminus3
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


module vminus3(
    input clk,
    input en,
    output reg [2:0] out_q
    );
    always @(posedge clk) begin
        if(en)  out_q <= out_q - 1;
        else out_q <= 0;
    end
endmodule
