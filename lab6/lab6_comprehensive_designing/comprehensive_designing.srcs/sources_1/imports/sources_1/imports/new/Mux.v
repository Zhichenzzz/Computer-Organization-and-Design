`timescale 1ns / 1ps

module Mux2(input [31:0] in1,
            input [31:0] in2,
            input control,
            output [31:0] out);
    assign out = (control === 1'b1) ? in2 : in1;
endmodule

module Mux3(input [31:0] in1,
            input [31:0] in2,
            input [31:0] in3,
            input [1:0] control,
            output [31:0] out);
    assign out = (control[1] === 1'b1) ? in3 : ((control === 2'b01) ? in2 : in1);
endmodule
