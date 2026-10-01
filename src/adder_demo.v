module adder_demo (
    input  wire clk,
    input  wire rst_n,
    input  wire A,
    input  wire B,
    output wire S,
    input  wire en
);
    wire [7:0] a_reg, b_reg;
    wire [8:0] sum;

    shift_register sr_a (
        .clk(clk), .rst_n(rst_n), .en(en),
        .serial_in(A), .parallel_out(a_reg)
    );

    shift_register sr_b (
        .clk(clk), .rst_n(rst_n), .en(en),
        .serial_in(B), .parallel_out(b_reg)
    );

    adder8 add0 (
        .a(a_reg), .b(b_reg), .sum(sum)
    );

    comparator496 cmp0 (
        .val(sum), .eq(S)
    );
endmodule