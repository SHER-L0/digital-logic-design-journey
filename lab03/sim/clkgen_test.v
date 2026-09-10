`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/08 18:26:14
// Design Name: 
// Module Name: clkgen_test
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


module clkgen_test();

    reg rst;
    reg clken;
    reg clkin;
    wire clkout;

    clkgen #(
        .clk_freq(10000000)
    ) clk_100ns (
        .clkin(clkin),
        .rst(rst),
        .clken(clken),
        .clkout(clkout)
    );

    initial begin
        clkin = 1'b0;

        forever begin
            #5 clkin = ~clkin;
        end
    end

    initial begin
        rst = 1'b1;
        clken = 1'b1;

        #100;
        rst = 1'b0;

        #100;
        clken = 1'b0;

        #100;
        clken = 1'b1;

        #200;
        $finish;
    end

endmodule