`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/02 21:52:44
// Design Name: 
// Module Name: encode42
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


module encode42(
    input [3:0] x,
    output reg [1:0] y,
    input en
    );
    always @(en or x) begin
        if (en == 1) begin
            case (x)
                4'b 0000:   y = 2'b 00;
                4'b 0010:   y = 2'b 01;
                4'b 0100:   y = 2'b 10;
                4'b 1000:   y = 2'b 11;
                default :
                    y = 2'b zz;
            endcase
        end
        else y = 2'b zz;
    end
endmodule
