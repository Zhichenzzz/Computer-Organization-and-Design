`timescale 1ns / 1ps

module Add #(parameter WIDTH = 32)
            (input [WIDTH - 1:0] x1,
             input [WIDTH - 1:0] x2,
             output [WIDTH - 1:0] y);
    assign y = x1 + x2;
endmodule
