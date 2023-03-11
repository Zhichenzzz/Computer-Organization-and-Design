`timescale 1ns / 1ps

module PCreg(
    input clk,
    input rst,
    input [31:0] nPC,
    input PCWrite,
    output [31:0] pc
    );
    reg [31:0] data = 32'h3000;
    assign pc = data;
    always @(posedge clk, posedge rst) begin
        if (rst)
            data <= 32'h3000;
        else if (PCWrite !== 1'b0)
            data <= nPC;
    end
endmodule
