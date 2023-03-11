`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 17:06:03
// Design Name: 
// Module Name: counter
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


module  counter #(
    parameter W = 12, 
        RST_VLU = 0
)(
    input clk, rst, pe, ce, 
    input [W-1:0] d,
    output reg [W-1:0] q
);
    reg [W-1:0] cnt;
    initial cnt=12'b0000_0000_0000;
    always @(posedge clk) begin
        if (rst)  cnt <= RST_VLU;
        else if (pe)  cnt <= d;
        else if (ce)  cnt <= cnt + 1; 
    end
    always@(*)
    q=cnt;
endmodule
