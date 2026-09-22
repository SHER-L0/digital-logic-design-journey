module shifter_regs (
    input clk,
    input [7:0] datain,
    input [2:0] control,
    output reg [7:0] dataout
);
    always @(posedge clk) begin
        case (control)
            3'b000:begin
                dataout <= 8'b00000000;
            end
            3'b001:begin
                dataout <= datain;
            end
            3'b010:begin
                dataout <= {1'b0, dataout[7:1]};
            end
            3'b011:begin
                dataout <= {dataout[6:0], 1'b0};
            end
            3'b100:begin
                dataout <= {dataout[7], dataout[7:1]};
            end
            3'b101:begin
                dataout <= {datain[0], dataout[7:1]};
            end
            3'b110:begin
                dataout <= {dataout[0], dataout[7:1]};
            end
            3'b111:begin
                dataout <= {dataout[6:0], dataout[7]};
            end
        endcase
    end
endmodule //shifter_regs