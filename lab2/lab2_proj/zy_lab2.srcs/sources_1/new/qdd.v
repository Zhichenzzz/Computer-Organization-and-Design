`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 18:35:28
// Design Name: 
// Module Name: qdd
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


module qdd(
input x,rst,clk,
output reg y
    );
    reg ce,pe;
    reg[20:0]d;
    wire[20:0]s;
    counter21 counter(clk,rst,pe,ce,d,s);
    always@(*)
    begin
    if(s<1000000)
    begin
    y=1'b0;
    if(x==1)begin pe=1'b0;ce=1'b1;d=21'b0_0000_0000_0000_0000_0000;end
    else begin pe=1'b1;ce=1'b0;d=21'b0_0000_0000_0000_0000_0000;end
    end
    else if(s==1000000)
    begin
    if(x==1)begin pe=1'b0;ce=1'b1;d=21'b0_0000_0000_0000_0000_0000;y=1'b1;end
    else begin pe=1'b1;ce=1'b0;d=21'b0_0000_0000_0000_0000_0000;y=1'b0;end
    end
    else if(s<2000000)
    begin
    y=1'b1;
    if(x==0)begin pe=1'b0;ce=1'b1;d=21'b0_0000_0000_0000_0000_0000;end
    else begin pe=1'b1;ce=1'b0;d=21'b0_1111_0100_0010_0100_0001;end
    end
    else 
    begin
    if(x==0)begin pe=1'b1;ce=1'b0;d=21'b0_0000_0000_0000_0000_0000;y=1'b0;end
    else begin pe=1'b1;ce=1'b0;d=21'b0_1111_0100_0010_0100_0001;y=1'b1;end
    end
    end
endmodule
