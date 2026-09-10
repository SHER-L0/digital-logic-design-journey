`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/02 22:03:46
// Design Name: 
// Module Name: priority42
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


module priority42(
    input en,
    input [3:0] x,
    output reg [1:0] y,
    output reg valid
    );
    always @(en or x) begin
        if (en == 1) begin
            casez (x)
                4'b 0001:   begin   y = 2'b 00;     valid = 1;  end
                4'b 001?:   begin   y = 2'b 01;     valid = 1;  end
                4'b 01??:   begin   y = 2'b 10;     valid = 1;  end
                4'b 1???:   begin   y = 2'b 11;     valid = 1;  end
                    default : begin     y = 2'b zz;     valid = 0;  end
            endcase
        end
        else
            begin
                y = 2'b zz;     valid = 0;
            end
    end
endmodule
