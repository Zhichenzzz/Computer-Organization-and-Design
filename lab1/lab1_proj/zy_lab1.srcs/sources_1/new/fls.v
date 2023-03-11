`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/17 20:29:22
// Design Name: 
// Module Name: fls
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


module  fls (
  input  clk, rst,        //时钟，复位（高电平有效）
  input en,	          //输入输出使能
  input  [6:0]  d,      //输入数列初始项
  output [6:0]  f       //输出数列
);
parameter s0=2'b00,s1=2'b01,s2=2'b10;
reg [1:0]cs,ns;
reg [6:0]f1;
wire[6:0]f2,f3,f4;
wire useless;
wire en1,en2,en3,e;
top_qdd(en,~rst,clk,en1);
D(en1,clk,en2);
D(en2,clk,en3);
assign e=en2&~en3;
ALU#(7)(f2,f3,3'b000,f4,useless);
register#(7)(e,clk,f1,f2);
register#(7)(e,clk,f2,f3);
always@(posedge clk)
begin
if(rst)cs<=s0;
else if(e)cs<=ns;
else cs<=cs;
end
always@(*)
begin
case(cs)
2'b00:ns=s1;
2'b01:ns=s2;
2'b10:ns=s2;
default:;
endcase
end
always@(*)
case(cs)
2'b00:begin f1=d;end
2'b01:begin f1=d;end
2'b10:begin f1=f4;end
default:;
endcase
assign f=f2;
endmodule
