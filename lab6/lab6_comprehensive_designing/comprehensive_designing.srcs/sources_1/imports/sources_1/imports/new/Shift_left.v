`timescale 1ns / 1ps

module Shift_left(input [31:0] immediate,
                  output [31:0] result);
    assign result = immediate << 1;
endmodule
