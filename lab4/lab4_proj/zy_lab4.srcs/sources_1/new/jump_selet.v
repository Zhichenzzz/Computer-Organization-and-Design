`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/14 16:40:38
// Design Name: 
// Module Name: jump_selet
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


module jump_selet(
input zero,less,
input [2:0]sel,
output reg [1:0]o_sel
    );
always@(*)
begin
    case(sel)
    3'b000:o_sel=2'b00;//+4
    3'b001:o_sel=2'b01;//jal
    3'b011:if(zero)o_sel=2'b01;else o_sel=2'b00;//beq
    3'b101:if(less)o_sel=2'b01;else o_sel=2'b00;//blt
    3'b111:o_sel=2'b10;//jalr
    default:o_sel=2'b00;
    endcase
end
endmodule
