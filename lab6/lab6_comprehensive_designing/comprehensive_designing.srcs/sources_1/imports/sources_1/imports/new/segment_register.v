`timescale 1ns / 1ps

module segment_register #(parameter WIDTH = 32)
                         (input en,
                          input clk,
                          input flush,
                          input [WIDTH - 1:0] in,
                          output [WIDTH - 1:0] out);
    reg [WIDTH - 1:0] data;
    always @(posedge clk) begin
        if (en !== 1'b0 && flush !== 1'b1)
            data <= in;
        else if (flush === 1'b1)
            data <= 0;
    end
    assign out = data;
endmodule
