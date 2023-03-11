`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/28 20:25:53
// Design Name: 
// Module Name: LCU
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


module LCU(
input [3:0]in,
input en0,de0,rst,clk,
output [3:0]out,
output full,emp,
output [7:0]an,
output [6:0]seg
);
wire[2:0]r1,r2,r11,r22,d1,d2,wa,ra1,ra2;
wire[3:0]wd,rd1,rd2,bout;
wire we,we1,we2,we3,bfull,bemp,mux1,mux2,mux3,mux4,mux5,en2,en3,enq,de2,de3,deq,en1,de1;

qdd qdd_0(en0,rst,clk,en1);
qdd qdd_1(de0,rst,clk,de1);

D D0(en1,clk,en2);
D D1(en2,clk,en3);
assign enq=en2&~en3;

D D2(de1,clk,de2);
D D3(de2,clk,de3);
assign deq=de2&~de3;


register8_4 register8_4_0(clk,we,wa,ra1,ra2,wd,rd1,rd2);

register1_3 register1_3_0(clk,we1,d1,r1);
ADD ADD_0(r1,r11);
mux#(3) mux_0(3'b0,r11,mux3,d1);
register1_3 register1_3_1(clk,we2,d2,r2);
ADD ADD_1(r2,r22);
mux#(3) mux_1(3'b0,r22,mux2,d2);

mux#(4) mux_2(4'b0,in,mux1,wd);
mux#(3) mux_3(r1,r2,mux4,wa);

eq eq_0(r1,r22,bfull);
eq eq_1(r2,r11,bemp);

assign ra1=r1;

register1_4 register1_4_0(clk,we3,bout,out);
mux#(4) mux_4(4'b0,rd1,mux5,bout);

FSM FSM_0(clk,enq,rst,deq,bfull,bemp,we,we1,we2,we3,mux1,mux2,mux3,mux4,mux5,full,emp);
SDU SDU_0(r1,r2,rd2,full,emp,clk,rst,ra2,an,seg);
endmodule
