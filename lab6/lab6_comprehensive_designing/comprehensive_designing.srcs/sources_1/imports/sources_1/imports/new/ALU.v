`timescale 1ns / 1ps

module ALU(input [31:0] x1,
           input [31:0] x2,
           input [3:0] control,
           output [31:0] result,
           output zero);
    reg [31:0] temp;
    always @(*) begin
        case(control)
            // 0: and
            4'b0000: temp = x1 & x2;
            // 1: or
            4'b0001: temp = x1 | x2;
            // 2: add
            4'b0010: temp = x1 + x2;
            // 6: sub
            4'b0110: temp = x1 - x2;
            // 3: xor
            4'b0011: temp = x1 ^ x2;
            // 4: mul
            4'b0100: temp = x1 * x2;
            // 5: div
            4'b0101: temp = x1 / x2;
            // 7: sll
            4'b0111: temp = x1 << x2;
            // 8: srl
            4'b1000: temp = x1 >> x2;
            default: temp = 0;
        endcase
    end
    assign zero   = temp ? 1'b0 : 1'b1;
    assign result = temp;
endmodule
