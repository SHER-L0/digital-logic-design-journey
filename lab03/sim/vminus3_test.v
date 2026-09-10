`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/08 17:10:50
// Design Name: 
// Module Name: vminus3_test
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


module vminus3_test();

    reg clk;
    reg en;
    wire [2:0] out_q;

    vminus3 vminus_3(
        .clk(clk),
        .en(en),
        .out_q(out_q)
    );

    // 产生时钟
    initial begin
        clk = 1'b0;

        forever begin
            #5;
            clk = ~clk;
        end
    end

    // 产生测试输入
    initial begin
        en = 1'b0;

        #12;
        en = 1'b1;

        #80;
        en = 1'b0;

        #20;
        en = 1'b1;

        #40;
        $finish;
    end

endmodule
