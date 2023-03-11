`timescale 1ns / 1ps

// add 0010-0000 0x00-x010 0x00-x000 0x01-x010 1x00-xxxx
// sub 0010-1000 0x01-x000: 0xxx-1000 || 0x01-x000
// and 0010-0111 0x00-x111: 0xxx-x111
// or  0010-0110 0x00-x110: 0xxx-x110
// xor 0010-0100 0x00-x100: 
// xrl 0010-0101 0x00-x101: 0xxx-x101
// xll 0010-0001 0x00-x001: 0xxx-x001
// mul 0110-0000: 0110-0000
// div 0110-0100: 0110-0100
module ALU_control(input [7:0] Instruction,
                   output [3:0] control);
    reg [3:0] temp;
    always @(*) begin
        temp = 4'b1000;
        if (Instruction[7:0] == 8'b0110_0000) begin
            // 4: mul
            temp = 4'b0100;
        end
        else if (Instruction[7:0] == 8'b0110_0100) begin
            // 5: div
            temp = 4'b0101;
        end
        else if (Instruction[7:0] == 8'b0010_1000 || Instruction[5:4] == 2'b01 || (Instruction[2:0] == 3'b000 && Instruction[4] == 1'b1)) begin
            // 6: sub
            temp = 4'b0110;
        end
        else if (Instruction[7] == 1'b0 && Instruction[2:0] == 3'b001) begin
            // 7: sll
            temp = 4'b0111;
        end
        else if (Instruction[7] == 1'b0 && Instruction[2:0] == 3'b101) begin
            // 8: srl
            temp = 4'b1000;
        end
        else if (Instruction[7] == 1'b0 && Instruction[2:0] == 3'b100 && (Instruction[6] == 1'b0 || Instruction[5] == 1'b0)) begin
            // 3: xor
            temp = 4'b0011;
        end
        else if (Instruction[7] == 1'b0 && Instruction[2:0] == 3'b110) begin
            // 1: or
            temp = 4'b0001;
        end
        else if (Instruction[7] == 1'b0 && Instruction[2:0] == 3'b111) begin
            // 0: and
            temp = 4'b0000;
        end
        else begin
            // 2: add
            temp = 4'b0010;
        end
    end
    assign control = temp;
endmodule
