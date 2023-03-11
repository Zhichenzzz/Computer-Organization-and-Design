`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 09:18:02
// Design Name: 
// Module Name: ymq7
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


module ymq7(
input [3:0]a,
output reg[6:0]G
    );
    always@(*)
    case(a)
    4'b0000:G=7'b0000001;
    4'b0001:G=7'b1001111;
    4'b0010:G=7'b0010010;
    4'b0011:G=7'b0000110;
    4'b0100:G=7'b1001100;
    4'b0101:G=7'b0100100;
    4'b0110:G=7'b0100000;
    4'b0111:G=7'b0001111;
    4'b1000:G=7'b0000000;
    4'b1001:G=7'b0000100;
    4'b1010:G=7'b0001000;
    4'b1011:G=7'b1100000;
    4'b1100:G=7'b0110001;
    4'b1101:G=7'b1000010;
    4'b1110:G=7'b0110000;
    4'b1111:G=7'b0111000;
    endcase
endmodule
