`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 09:13:15
// Design Name: 
// Module Name: SDU
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


module SDU(
input[2:0]r1,r2,
input[3:0]rd2,
input full,emp,clk,rst,
output reg[2:0]ra2,
output reg[7:0]an,
output [6:0]seg
    );
    reg [2:0]ra,ra_1;
    wire [11:0]n;
    reg dclk;
    wire[6:0]an1,an2;
    ymq7 ymq7_0(rd2,seg); 
    counter(clk,rst,1'b0,1'b1,1'b0,n);
    initial dclk=1'b0;
    
    always@(posedge clk)
    begin
    if(rst)dclk<=0;
    else if(n==12'b1111_1111_1111)dclk<=~dclk;
    else dclk<=dclk;
    end
    
    
    always@(posedge dclk)
    begin
    if(r2==0&&ra==7)ra<=r1;
    else if(ra!=r2-1)ra<=ra+1;
    else ra<=r1;
    end
    ymq ymq_0(ra,an1);
    //assign ra2=ra;
    
    always@(posedge dclk)
    begin
    ra_1<=ra_1+1;
    end
    
    ymq ymq_1(ra_1,an2);
    //assign ra2=ra;
     
   
    always@(*)
    begin
    if(full)
    begin
    ra2=ra_1;
    an=an2;
    end
    else if(emp)
        begin
        ra2=3'b000;
        an=8'b1111_1111;
        end
        else
            begin
            ra2=ra;
            an=an1;
            end
    end
endmodule
