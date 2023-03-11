`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/28 20:57:45
// Design Name: 
// Module Name: FSM
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


module FSM(
input clk,
input enq,rst,deq,bfull,bemp,
output reg we,we1,we2,we3,mux1,mux2,mux3,mux4,mux5,
output full,emp
 );
 //initial full=1'b1;
 //initial emp=1'b0;
 parameter S0=3'b00,S1=3'b01,S2=3'b10,S3=3'b11;
 reg[1:0]cs,ns;
 wire[1:0]wr;
 reg we4;
 reg [1:0]state;
 register1_2 reg_0(clk,we4,state,wr);
 always@(posedge clk)
 begin
 if(rst)begin
 cs<=S0;
 end
 else cs<=ns;
 end
 
 assign emp=wr[0];
 assign full=wr[1];
 
 
 always@(*)
 begin
 if(enq)
    begin
    if(~full)ns=S1;
    else ns=S3;
    end
else if(deq)
    begin
    if(~emp)ns=S2;
    else ns=S3;
    end
else ns=S3;
end
always@(*)
begin
    case(cs)
    S0:begin we=1'b0;we1=1'b1;we2=1'b1;we3=1'b1;we4=1'b1;mux1=1'bx;mux2=1'b0;mux3=1'b0;mux4=1'bx;mux5=1'b0;state=2'b01;end
    S1:begin we=1'b1;we1=1'b0;we2=1'b1;we3=1'b0;we4=1'b1;mux1=1'b1;mux2=1'b1;mux3=1'bx;mux4=1'b1;mux5=1'bx;state={bfull,1'b0};end
    S2:begin we=1'b1;we1=1'b1;we2=1'b0;we3=1'b1;we4=1'b1;mux1=1'b0;mux2=1'bx;mux3=1'b1;mux4=1'b0;mux5=1'b1;state={1'b0,bemp};end
    S3:begin we=1'b0;we1=1'b0;we2=1'b0;we3=1'b0;we4=1'b0;mux1=1'bx;mux2=1'bx;mux3=1'bx;mux4=1'bx;mux5=1'b1;state=2'bxx;end
    default:;
    endcase
end
endmodule
