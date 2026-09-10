`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/09 21:29:18
// Design Name: 
// Module Name: timer_core
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


module timer_core(
    input clk_1s,
    input rst,
    input en,

    output reg [3:0] sec0,
    output reg [3:0] sec1,
    output reg [3:0] min0,
    output reg [3:0] min1,
    output reg [3:0] hour0,
    output reg [3:0] hour1
);
    reg plus;
    always @(posedge clk_1s or posedge rst) begin

        if (rst) begin
            sec0  <= 0;
            sec1  <= 0;
            min0  <= 0;
            min1  <= 0;
            hour0 <= 0;
            hour1 <= 0;
        end

        else if (en) begin
            if (sec0 < 9) begin
                sec0 <= sec0 + 1;
            end

            else begin
                sec0 <= 0;

                if (sec1 < 5) begin
                    sec1 <= sec1 + 1;
                end

                else begin
                    sec1 <= 0;

                    if (min0 < 9) begin
                        min0 <= min0 + 1;
                    end

                    else begin
                        min0 <= 0;

                        if (min1 < 5) begin
                            min1 <= min1 + 1;
                        end

                        else begin
                            min1 <= 0;

                            if (hour1 == 2 && hour0 == 3) begin
                                hour0 <= 0;
                                hour1 <= 0;
                            end

                            else if (hour0 < 9) begin
                                hour0 <= hour0 + 1;
                            end

                            else begin
                                hour0 <= 0;
                                hour1 <= hour1 + 1;
                            end
                        end
                    end
                end
            end
        end
    end

endmodule
