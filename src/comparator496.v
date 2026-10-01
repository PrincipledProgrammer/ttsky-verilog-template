module comparator496 (
    input  wire [8:0] val,
    output wire       eq
);
    assign eq = (val == 9'd496);
endmodule