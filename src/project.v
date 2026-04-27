`default_nettype none

module tt_um_fulladder (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    wire a   = ui_in[0];
    wire b   = ui_in[1];
    wire cin = ui_in[2];

    wire sum;
    wire carry;

    assign {carry, sum} = a + b + cin;

    assign uo_out  = {6'b000000, carry, sum};
    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

    wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
