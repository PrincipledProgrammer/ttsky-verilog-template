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


module tt_um_proj1 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // Will be 1 when your design is selected
    input  wire       clk,      // Clock
    input  wire       rst_n     // Active-low reset
);

adder_demo ad1(.clk(clk),.rst_n(rst_n),.A(ui_in[0]),.B(ui_in[1]),.S(uo_out[0]),.en(ui_in[2]));

// assign ui_in[7:3] = 5'b0;
assign uo_out[7:1] = 7'b0;
assign uio_out = 8'b0;
assign uio_oe = 8'b0;

wire _unused = &{ena,uio_in,ui_in[7:3]};

endmodule