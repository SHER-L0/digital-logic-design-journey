`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/02 21:28:11
// Design Name: 
// Module Name: mux41
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


module mux41(
    input [3:0] a,
    input [1:0] s,
    output reg y
    );

    always @ (s or a)
        begin
            case (s)
                0:  y = a[0];
                1:  y = a[1];
                2:  y = a[2];
                3:  y = a[3];
                default :
                    y = 1'b 0;
            endcase 
        end
endmodule
