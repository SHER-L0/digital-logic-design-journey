module LFSR (
    input clk,
    input [7:0] initial_data,
    input rst,
    output wire [7:0] data_out
);

    reg [2:0] control;
    reg [7:0] shifter_in;

    always @(*) begin
        if (rst == 1) begin
            control = 3'b000;
            shifter_in = 8'b0;
        end
        else if (data_out == 8'b00000000) begin
            control = 3'b001;

            if (initial_data != 8'b00000000)
                shifter_in = initial_data;
            else
                shifter_in = 8'b00000001;
        end
        else begin
            control = 3'b101;

            shifter_in = {
                7'b0000000,
                data_out[4] ^ data_out[3] ^
                data_out[2] ^ data_out[0]
            };
        end
    end

    shifter_regs shifter (
        .clk(clk),
        .datain(shifter_in),
        .control(control),
        .dataout(data_out)
    );

endmodule

