`timescale 1ns / 1ps

module Hazard_detection_unit(
    input [31:0] ir,
    input [4:0] rd,
    input memread,
    input PCsrc,
    output PCWrite,
    output IF_IDWrite,
    output control_signal,
    output flush
    );
    reg temp;
    always @(*) begin
        temp = (memread === 1'b1 && (ir[19:15] === rd || ir[24:20] === rd)) ? 1'b0 : 1'b1;
    end
    assign PCWrite = temp;
    assign IF_IDWrite = temp;
    assign control_signal = temp;
    assign flush = PCsrc;
endmodule
