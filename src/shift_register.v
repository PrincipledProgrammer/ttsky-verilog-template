module shift_register (
    input  wire       clk,
    input  wire        rst_n,
    input  wire        en,
    input  wire        serial_in,
    output reg  [7:0]  parallel_out
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            parallel_out <= 8'b0;
        else if (en)
            parallel_out <= {parallel_out[6:0], serial_in};
    end
endmodule