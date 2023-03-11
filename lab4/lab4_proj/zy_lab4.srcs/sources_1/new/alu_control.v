`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/14 16:23:03
// Design Name: 
// Module Name: alu_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_control
#(parameter 
ADDI=7'b0010011,
ADD=7'b0110011,
SUB=7'b0110011,
AUIPC=7'b0010111,
JAL=7'b1101111,
JALR=7'b1100111,
BEQ=7'b1100011,
BLT=7'b1100011,
LW=7'b0000011,
SW=7'b0100011)
(
input [6:0]in,
input In,
output reg sel
    );
always@(*)
begin
    case(in)
    SUB:if(In)sel=1'b1;else sel=1'b0;
    BEQ:sel=1'b1;
    //BLT:sel=1'b1;
    default:sel=1'b0;
    endcase
end
endmodule
