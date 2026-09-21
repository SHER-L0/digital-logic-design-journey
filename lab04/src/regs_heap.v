`timescale 1ns / 1ps

module regs_heap #(
    parameter RAM_WIDTH = 8,
    parameter RAM_DEPTH = 16,
    parameter INIT_FILE = ""
)(
    input clk,
    input we,
    input [RAM_WIDTH - 1 : 0] din,
    input [$clog2(RAM_DEPTH) - 1 : 0] inaddr,
    input [$clog2(RAM_DEPTH) - 1 : 0] outaddr,
    output [RAM_WIDTH - 1 : 0] dout
);
    reg [RAM_WIDTH-1 : 0] regs [RAM_DEPTH-1 : 0];

    initial begin
        if (INIT_FILE != "")
            $readmemh(INIT_FILE, regs, 0, RAM_DEPTH - 1);
    end
    
    assign dout = regs[outaddr];
    always @(posedge clk) begin
        if(we) begin
            regs[inaddr] <= din;
        end
    end
endmodule