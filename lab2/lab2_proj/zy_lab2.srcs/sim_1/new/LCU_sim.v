`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 15:57:43
// Design Name: 
// Module Name: LCU_sim
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


module LCU_sim();
reg[3:0]in;
reg en1,de1,rst,clk;
wire[3:0]out;
wire full,emp;

integer i;
initial
begin
clk=1'b0;
for(i=0;i<=1000;i=i+1)
#5 clk=~clk;
end

initial
begin
#3 rst=1'b1;
#3 rst=1'b0;
end

initial
begin
in=4'b1111;
#100 in=4'b1110;
end

initial
begin
en1=1'b0;
#22 en1=~en1;
#22 en1=~en1;
#22 en1=~en1;
#22 en1=~en1;
#22 en1=~en1;
#22 en1=~en1;
#22 en1=~en1;
#22 en1=~en1;
#22 en1=~en1;
#22 en1=~en1;
end

initial
begin
de1=1'b0;
#500 de1=~de1;
#22 de1=~de1;
#22 de1=~de1;
#22 de1=~de1;
#22 de1=~de1;
#22 de1=~de1;
#22 de1=~de1;
#22 de1=~de1;
#22 de1=~de1;
#22 de1=~de1;
end

LCU   LCU_sim(in,en1,de1,rst,clk,out,full,emp);
endmodule
