`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/02 21:35:18
// Design Name: 
// Module Name: decode24
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


module decode24(
    input [1:0] x,
    input en,
    output reg [3:0] y
    );
    always @ (x or en)begin
        if(en == 0)
            y = 4'b 0000;
        else begin
            case (x)
                2'b 00: y = 4'b 0001;
                2'b 01: y = 4'b 0010;
                2'b 10: y = 4'b 0100;
                2'b 11: y = 4'b 1000;
            endcase 
        end
                
    end 
endmodule
