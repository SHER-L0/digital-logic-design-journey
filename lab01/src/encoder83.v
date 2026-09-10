`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/02 23:29:19
// Design Name: 
// Module Name: encoder83
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


module priority83(
    input [7:0] sw,
    input en,
    output reg[2:0] code,
    output reg valid
    );

    always @(en or sw) begin
        if(en == 1)begin
            casez (sw)
                8'b 00000000:   begin
                    code = 3'b zzz;
                    valid = 0;
                end 
                8'b 1???????:   begin
                    code = 3'b 111;  valid = 1;
                end
                8'b 01??????:   begin
                    code = 3'b 110;  valid = 1;
                end
                8'b 001?????:   begin
                    code = 3'b 101;  valid = 1;
                end
                8'b 0001????:   begin
                    code = 3'b 100;  valid = 1;
                end
                8'b 00001???:   begin
                    code = 3'b 011;  valid = 1;
                end
                8'b 000001??:   begin
                    code = 3'b 010;  valid = 1;
                end
                8'b 0000001?:   begin
                    code = 3'b 001;  valid = 1;
                end
                8'b 00000001:   begin
                    code = 3'B 000;  valid = 1;  
                end
                default: begin
                    code = 3'b zzz; valid = 0;
                end
            endcase
    end
    else begin
        code = 3'b zzz;
        valid = 0;
    end
end
endmodule
