`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/17 18:48:50
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter WIDTH=32)	//数据宽度
(
input  wire [WIDTH-1:0] a, b,	        //两操作数（对于减运算，a是被减数）
input  wire [2:0] f,		                //操作功能（加、减、与、或、异或等）
output  reg[WIDTH-1:0] y, 	           //运算结果（和、差 …） 
output  wire z 			               //零标志（运算结果为零，z置1）
);
always@(*)
begin
case(f)
3'b000:y=a+b;
3'b001:y=a-b;
3'b010:y=a&b;
3'b011:y=a|b;
3'b100:y=a^b;
default:y=0;
endcase
end
assign z= y==0?1:0;
endmodule
