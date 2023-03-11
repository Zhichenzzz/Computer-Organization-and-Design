`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/13 21:17:51
// Design Name: 
// Module Name: counter21
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


module  counter21 #(
    parameter W = 21, 
        RST_VLU = 0
)(
    input clk, rstn, pe, ce, 
    input [W-1:0] d,
    output reg [W-1:0] q
);
    reg [W-1:0] cnt;
    initial cnt=21'b0_0000_0000_0000_0000_0000;
    always @(posedge clk) begin
        if (!rstn)  cnt <= RST_VLU;
        else if (pe)  cnt <= d;
        else if (ce)  cnt <= cnt + 1; 
    end
    always@(*)
    q=cnt;
endmodule
