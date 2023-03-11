`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/28 23:54:51
// Design Name: 
// Module Name: FSM_sim
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


module FSM_sim();
reg clk;
reg enq,rst,deq,bfull;
wire we,we1,we2,we3,mux1,mux2,mux3,mux4,mux5;
wire full,emp;
integer i;
initial 
begin
clk=1'b0;
for(i=0;i<1000;i=i+1)
#5 clk=~clk;
end
initial
begin
bfull=1'b0;
#5 bfull=1'b1;
end
initial
begin
rst=1'b0;
#3 rst=1'b1;
#6 rst=1'b0;
end
FSM FSM1(clk,1'b0,rst,1'b0,bfull,we,we1,we2,we3,mux1,mux2,mux3,mux4,mux5,full,emp);
endmodule
