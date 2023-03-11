`timescale 1ns / 1ps
// signed
// beq rs1, rs2, offset    offset rs2 rs1 000 offset 1100011    (==)
// bge rs1, rs2, offset    offset rs2 rs1 101 offset 1100011    (>=)
// blt rs1, rs2, offset    offset rs2 rs1 100 offset 1100011    (<)
// bne rs1, rs2, offset    offset rs2 rs1 001 offset 1100011    (!=)

// unsigned
// bgeu rs1, rs2, offset   offset rs2 rs1 111 offset 1100011    (>=)
// bltu rs1, rs2, offset   offset rs2 rs1 110 offset 1100011    (<)
module Branch_unit(
    input branch,
    input jal,
    input [2:0] control,
    input [31:0] result,
    output PCsrc
    );
    reg temp;
    wire signed [31:0] signed_result = result;
    always @(*) begin
        case(control)
            3'b000: temp = jal | (branch && (result === 0));
            3'b001: temp = jal | (branch && (result !== 0));
            3'b110: temp = jal | (branch && (result < 0));
            3'b111: temp = jal | (branch && (result >= 0));
            3'b100: temp = jal | (branch && (signed_result < 0));
            3'b101: temp = jal | (branch && (signed_result >= 0));
            default: temp = jal;
        endcase
    end
    assign PCsrc = temp;
endmodule
