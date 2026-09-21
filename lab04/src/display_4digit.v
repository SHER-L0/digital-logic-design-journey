module display_4digit(
    input clk_scan,
    input rst,
    input [15:0] digit,
    output reg [7:0] an,
    output reg [3:0] display
);

    reg [1:0] select;

    always @(posedge clk_scan) begin
        if (rst)
            select <= 1'b0;
        else
            select <= select + 1;
    end

    always @(*) begin
        case (select)
            2'b00: begin
                an = 8'b11111110;
                display = digit[3:0];
            end

            2'b01: begin
                an = 8'b11111101;
                display = digit[7:4];
            end

            3'b10: begin
                an = 8'b11111011;
                display = digit[11:8];
            end

            3'b11: begin
                an = 8'b11110111;
                display = digit[15:12];
            end
        endcase
    end

endmodule