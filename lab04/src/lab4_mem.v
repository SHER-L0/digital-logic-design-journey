module lab4_mem (
    input CLK100MHZ,
    input [15:0] SW,
    output [7:0] AN,
    output [7:0] HEX
);
    wire [3:0] addr = SW[3:0];
    wire we1 = SW[4], we2 = SW[5];
    wire clk = SW[6];
    wire [3:0] data = SW[10:7];
    wire clk_scan;
    wire clk_debounce;
    wire [15:0] digit;
    wire [3:0] display;

    clkgen #(10000) clkgen_scan( .clkin(CLK100MHZ),
                                 .rst(SW[15]),
                                 .clken(1),
                                 .clkout(clk_scan));

    debounce clk_debounce_SW(   .clk(CLK100MHZ),
                                .rst(SW[15]),
                                .btn_in(clk),
                                .btn_out(clk_debounce));

    regs_heap #(.RAM_WIDTH(8),
                .RAM_DEPTH(16),
                .INIT_FILE("C:/Users/33113/Desktop/digital logic  lab/lab04/src/mem1.txt")) myregs_heap
               (.clk(clk_debounce),
                .we(we1),
                .din({4'b0000, data}),
                .inaddr(addr),
                .outaddr(addr),
                .dout(digit[7:0]));

    blk_mem_gen_0 myram (
                        .clka(clk_debounce),    // input wire clka
                        .ena(1'b1),      // input wire ena
                        .wea(we2),      // input wire [0 : 0] wea
                        .addra(addr),  // input wire [3 : 0] addra
                        .dina({4'b0000, data}),    // input wire [7 : 0] dina
                        .douta(digit[15:8])  // output wire [7 : 0] douta
);

    display_4digit display_data(.clk_scan(clk_scan),
                                .rst(SW[15]),
                                .digit(digit),
                                .an(AN),
                                .display(display));

    segseven_0tof sevenseg( .digit(display),
                            .valid(1),
                            .HEX(HEX));
endmodule //lab4_mem


