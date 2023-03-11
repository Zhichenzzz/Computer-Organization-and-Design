`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/14 15:44:03
// Design Name: 
// Module Name: alu
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


module alu#(parameter WIDTH=32)
(
input [WIDTH-1:0]a,b,
input [1:0]sel,
output reg[WIDTH-1:0]c,
output zero,
output less
    );
always@(*)
    begin
    case(sel)
    2'b00:c=a+b;
    2'b01:c=a-b;
    2'b10:c=a&b;
    2'b11:c=a|b;
    endcase
    end
//assign c= sel==0? a+b:a-b;
assign zero= c==0? 1:0;  
assign less= c[31]==1? 1:0;
endmodule
