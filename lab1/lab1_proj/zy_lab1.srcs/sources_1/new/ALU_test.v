`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/17 18:58:54
// Design Name: 
// Module Name: ALU_test
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

module ALU_test
(
input clk,
input  en,
input  [1:0]sel,
input  [5:0]x,		
output  reg[5:0]y, 	
output  reg z 			
);
reg en1,en2,en3;
wire [5:0]a1,a2,a3;
wire [5:0]y1;
wire z1;
always@(*)
begin
if(en)
case(sel)
2'b00:
begin en1=1'b1;en2=1'b0;en3=1'b0;end
2'b01:
begin en1=1'b0;en2=1'b1;en3=1'b0;end
2'b10:
begin en1=1'b0;en2=1'b0;en3=1'b1;end
default:
begin en1=1'b0;en2=1'b0;en3=1'b0;end
endcase
else
begin en1=1'b0;en2=1'b0;en3=1'b0;end
end
register#(6)(en1,clk,x,a1);
register#(6)(en2,clk,x,a2);
register#(6)(en3,clk,x,a3);
ALU#(6)(a1,a2,a3[2:0],y1,z1);
always@(posedge clk)
begin
y<=y1;
z<=z1;
end
endmodule

