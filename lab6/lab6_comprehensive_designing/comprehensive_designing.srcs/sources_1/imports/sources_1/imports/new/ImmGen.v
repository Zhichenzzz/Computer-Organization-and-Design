`timescale 1ns / 1ps

module ImmGen(input [31:0] Instruction,
              output [31:0] immediate);
    reg [31:0] temp;
    always @(*) begin
        temp = 32'b0;
        // R-type: 01100/10100
        // S-type: 01000/01001
        // U-type: 00101
        // B-type: 11000
        // I-type: 00000/00001/00100/11001
        // J-type: 11011
        if (Instruction[6:3] == 4'b0000 || Instruction[6:2] == 5'b00100 || Instruction[6:2] == 5'b11001) begin
            // I-type
            temp = {Instruction[31] ? 20'hfffff : 20'h00000, Instruction[31:20]};
        end
        else if (Instruction[6:2] == 5'b11011) begin
            // J-type
            temp = {Instruction[31] ? 12'hfff : 12'h000, Instruction[31], Instruction[19:12], Instruction[20], Instruction[30:21]};
        end
        else if (Instruction[6:2] == 5'b01100 || Instruction[6:2] == 5'b10100) begin
            // R-type
            temp = 32'b0;
        end
        else if (Instruction[6:3] == 4'b0100) begin
            // S-type
            temp = {Instruction[31] ? 20'hfffff : 20'h00000, Instruction[31:25], Instruction[11:7]};
        end
        else if (Instruction[6:2] == 5'b00101) begin
            // U-type
            temp = {Instruction[31:12], 12'h000};
        end
        else if (Instruction[6:2] == 5'b11000) begin
            // B-type
            temp = {Instruction[31] ? 20'hfffff : 20'h00000, Instruction[31], Instruction[7], Instruction[30:25], Instruction[11:8]};
        end
    end
    assign immediate = temp;
endmodule
