`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/29 08:56:48
// Design Name: 
// Module Name: register1_2
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


module register1_2(
input clk,we,
input [1:0]wd,
output [1:0]rd
);
    
reg [2:0] regfile;
initial regfile=0;

assign rd = regfile;

always@(posedge  clk) 
begin
    if(we)regfile<=wd;
end
endmodule
