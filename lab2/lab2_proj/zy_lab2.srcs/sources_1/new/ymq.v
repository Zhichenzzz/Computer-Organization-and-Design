`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 17:19:58
// Design Name: 
// Module Name: ymq
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


module ymq(
input [2:0]a,
output reg[7:0]an
    );
    always@(*)
    case(a)
    3'b000:an=8'b11111110;
    3'b001:an=8'b11111101;
    3'b010:an=8'b11111011;
    3'b011:an=8'b11110111;
    3'b100:an=8'b11101111;
    3'b101:an=8'b11011111;
    3'b110:an=8'b10111111;
    3'b111:an=8'b01111111;
    endcase
endmodule
