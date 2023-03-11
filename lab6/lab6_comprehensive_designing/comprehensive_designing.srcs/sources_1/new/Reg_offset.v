`timescale 1ns / 1ps

module Reg_offset(
    input [31:0] imm,
    input [31:0] rs,
    input [31:0] pc,
    input control,
    output [31:0] offset
    );
    assign offset = (control === 1'b1) ? (imm + rs - pc) : imm;
endmodule
