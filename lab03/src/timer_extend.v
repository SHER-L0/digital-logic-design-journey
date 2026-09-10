`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/10 14:59:41
// Design Name: 
// Module Name: timer_extend
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


module timer_extend(
    input clk_100MHZ,
    input rst,
    input en,
    input set_mode,
    input set_minorhour,
    input add_pulse,

    output reg [3:0] sec0,
    output reg [3:0] sec1,
    output reg [3:0] min0,
    output reg [3:0] min1,
    output reg [3:0] hour0,
    output reg [3:0] hour1
    );

    reg pre_addpulse;
    wire tick_1s;

    function [7:0] add1_00to59;
        input [7:0] value;
        reg[3:0] ones, tens;
        begin
            {tens, ones} = value;
            if(ones < 9) begin
                ones = ones + 1;
            end
            else begin
                ones = 0;
                if(tens < 5) begin
                    tens = tens + 1;
                end
                else begin
                    tens = 0;
                end
            end
            add1_00to59 = {tens, ones};
        end
    endfunction

    function [7:0] add1_00to23;
        input [7:0] value;
        reg[3:0] ones, tens;
        begin
            {tens, ones} = value;
            if(tens != 2) begin
                if(ones < 9) begin
                    ones = ones + 1;
                end
                else begin
                    ones = 0;
                    tens = tens + 1;
                end
            end
            else begin
                if(ones < 3) begin
                    ones = ones + 1;
                end
                else begin
                    ones = 0;
                    tens = 0;
                end
            end
            add1_00to23 = {tens, ones};
        end
    endfunction


    gen_1s_tick gentick(    .clkin(clk_100MHZ),
                            .rst(rst),
                            .tick(tick_1s));

    always @(posedge clk_100MHZ) begin
        pre_addpulse <= add_pulse;
        if(rst) begin
            {hour1, hour0, min1, min0, sec1, sec0} = 0;
        end
        else begin
            if(set_mode) begin
                if(pre_addpulse == 0 && add_pulse == 1) begin
                    if(set_minorhour == 0) begin
                        {min1, min0} <= add1_00to59({min1, min0});
                    end
                    else begin
                        {hour1, hour0} <= add1_00to23({hour1, hour0});
                    end
                end
            end
            else begin
                if(en) begin
                    if(tick_1s) begin
                        {sec1, sec0} <= add1_00to59({sec1, sec0});
                        if(sec1 == 5 && sec0 == 9) begin
                            {min1, min0} <= add1_00to59({min1, min0});
                            if(min1 == 5 && min0 == 9) begin
                                {hour1, hour0} <= add1_00to23({hour1, hour0});
                            end
                        end
                    end
                end
            end
        end
    end
endmodule
