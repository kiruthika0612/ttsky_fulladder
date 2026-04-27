/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_fulladder (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
    wire a= ui_in[0];
    wire b=ui_in[1];
    wire cin= ui_in[2];
    wire sum,carry;
    wire uo_out [7:2] = 6'b0000000;
    wire uio_in = 8'b00000000;
    wire uio_out = 8'b00000000;
    wire sum = uo_out[0];
    wire carry = uo_out[1];
    assign {sum, carry} = a+b+cin;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
