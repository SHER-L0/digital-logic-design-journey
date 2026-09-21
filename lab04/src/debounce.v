module debounce #(
    parameter CLK_FREQ = 100_000_000,
    parameter DEBOUNCE_MS = 10
)(
    input clk,
    input rst,
    input btn_in,
    output reg btn_out
);

    localparam COUNT_MAX =
        CLK_FREQ / 1000 * DEBOUNCE_MS;

    localparam COUNT_WIDTH =
        $clog2(COUNT_MAX + 1);

    reg [COUNT_WIDTH-1:0] count;

    always @(posedge clk)
    begin
        if (rst)
        begin
            count   <= 0;
            btn_out <= 0;
        end
        else if (btn_in == btn_out)
        begin
            count <= 0;
        end
        else if (count == COUNT_MAX - 1)
        begin
            btn_out <= btn_in;
            count   <= 0;
        end
        else
        begin
            count <= count + 1;
        end
    end

endmodule