`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/17 19:07:15
// Design Name: 
// Module Name: register
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


module register#(parameter WIDTH=32)
(
input en,clk,
input [WIDTH-1:0]w_data,
output [WIDTH-1:0]r_data
    );
    reg [WIDTH-1:0]data;
    always@(posedge clk)
    begin
    if(en)data<=w_data;
    else data<=data;
    end
    assign r_data=data;
endmodule
