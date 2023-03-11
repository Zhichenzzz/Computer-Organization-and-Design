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

// R-type
// add rd, rs1, rs2    0000000 rs2 rs1 000 rd 0110011   10 0000 (add)
// and rd, rs1, rs2    0000000 rs2 rs1 111 rd 0110011   10 0111 (and)
// or rd, rs1, rs2     0000000 rs2 rs1 110 rd 0110011   10 0110 (or)
// sub rd, rs1, rs2    0100000 rs2 rs1 000 rd 0110011   10 1000 (sub)
// xor rd, rs1, rs2    0000000 rs2 rs1 100 rd 0110011   10 0100 (xor)
// srl rd, rs1, rs2    0000000 rs2 rs1 101 rd 0110011   10 0101 (srl)
// sll rd, rs1, rs2    0000000 rs2 rs1 001 rd 0110011   10 0001 (sll)
// mul rd, rs1, rs2    0000001 rs2 rs1 000 rd 0110011   10 0000 (mul)
// div rd, rs1, rs2    0000001 rs2 rs1 100 rd 0110011   10 0100 (div)
// fle.s rd, rs1, rs2  1010000 rs2 rs1 000 rd 1010011   00 x000 (sub)
// flt.s rd, rs1, rs2  1010000 rs2 rs1 001 rd 1010011   00 x001 (sub)
// feq.s rd, rs1, rs2  1010000 rs2 rs1 010 rd 1010011   00 x010 (sub)

// I-type
// lw rd, offset(rs1)  offset      rs1 010 rd 0000011   00 x010 (add)
// flw rd, offset(rs1) offset      rs1 010 rd 0000111   00 x010 (add)
// addi rd, rs1, imm   immedicate  rs1 000 rd 0010011   00 x000 (add)
// andi rd, rs1, imm   immedicate  rs1 111 rd 0010011   00 x111 (and)
// ori rd, rs1, imm    immedicate  rs1 110 rd 0010011   00 x110 (or)
// xori rd, rs1, imm   immedicate  rs1 100 rd 0010011   00 x100 (xor)
// srli rd, rs1, imm   immedicate  rs1 101 rd 0010011   00 x101 (srl)
// slli rd, rs1, imm   immedicate  rs1 001 rd 0010011   00 x001 (sll)
// jalr rd, offset(rs1)offset      rs1 010 rd 1100111   01 x010 (add)

// U-type
// auipc rd, imm       immedicate          rd 0010111   00 xxxx (add)

// B-type
// beq rs1, rs2, offset    offset rs2 rs1 000 offset 1100011    01 x000 (sub)
// bge rs1, rs2, offset    offset rs2 rs1 101 offset 1100011    01 x000 (sub)
// blt rs1, rs2, offset    offset rs2 rs1 100 offset 1100011    01 x000 (sub)
// bne rs1, rs2, offset    offset rs2 rs1 001 offset 1100011    01 x000 (sub)
// bgeu rs1, rs2, offset   offset rs2 rs1 111 offset 1100011    01 x000 (sub)
// bltu rs1, rs2, offset   offset rs2 rs1 110 offset 1100011    01 x000 (sub)

// J-type
// jal rd, offset          offset             rd     1101111    01 xxxx (null)

// S-type
// sw rs2, offset(rs1)     offset rs2 rs1 010 offset 0100011    00 x010 (add)
// fsw rs2, offset(rs1)    offset rs2 rs1 010 offset 0100111    00 x010 (add)

module control(input en,
               input [31:0] Instruction,
               output reg_base,
               output jal,
               output Branch,
               output [1:0] RegSrc,
               output [3:0] alu_control,
               output MemWrite,
               output MemRead,
               output ALUSrc1,
               output ALUSrc2,
               output RegWrite,
               output [1:0] readXF,
               output writeXF,
               output [2:0] fcontrol);
    wire [1:0] ALUop;
    wire [3:0] alucontrol;
    wire [6:0] opcode = Instruction[6:0];
    assign reg_base = en === 1'b0 ? 1'b0 : (opcode == 7'b1100111);
    assign jal = en === 1'b0 ? 1'b0 : (opcode[2] && opcode[6:5] == 2'b11);
    assign Branch = en === 1'b0 ? 1'b0 : (opcode == 7'b1100011);
    assign ALUSrc1 = en === 1'b0 ? 1'b0 : (opcode == 7'b0010111);
    assign ALUSrc2 = en === 1'b0 ? 1'b0 : (opcode != 7'b0110011  && opcode != 7'b1010011 && opcode != 7'b1100011);
    assign ALUop  = en === 1'b0 ? 1'b0 : {opcode[5] & opcode[4], opcode[6] & opcode[5]};
    ALU_control ALUControl(
    // .ALUop(ALUop),
    .Instruction({Instruction[4:0] === 5'b10111, Instruction[25], ALUop, Instruction[30], Instruction[14:12]}),
    .control(alucontrol)
    );
    assign alu_control = en === 1'b0 ? 4'b0000 : alucontrol;
    
    assign MemWrite = en === 1'b0 ? 1'b0 : (opcode == 7'b0100011 || opcode == 7'b0100111);
    assign MemRead = en === 1'b0 ? 1'b0 : ((opcode == 7'b0000011 || opcode == 7'b0000111) ? 1'b1 : 1'b0);

    assign RegWrite = en === 1'b0 ? 1'b0 : (opcode != 7'b0100011 && opcode != 7'b0100111 && opcode != 7'b1100011);
    assign RegSrc   = en === 1'b0 ? 2'b00 : (opcode[4]) ? 2'b00 : ((opcode[6] == 0) ? 2'b01 : 2'b10);
    assign readXF = en === 1'b0 ? 2'b00 : (opcode == 7'b0100111 ? 2'b10 : (opcode == 7'b1010011 ? 2'b11 : 2'b00));
    assign writeXF = en === 1'b0 ? 1'b0 : (opcode == 7'b0000111);
    assign fcontrol = en === 1'b0 ? 3'b111: Instruction[14:12];
endmodule
