`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/28 20:12:19
// Design Name: 
// Module Name: register32
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


module register32
#(parameter WIDTH=32)
(
input clk,we,
input [4:0]wa,ra0,ra1,
input [WIDTH-1:0]wd,
output [WIDTH-1:0]rd0,rd1
    );
reg [WIDTH-1:0] regfile[0:31];

assign rd0 = regfile[ra0];
assign rd1 = regfile[ra1];

always@(posedge  clk) 
begin
    if(we)regfile[wa]<=wd;
end

endmodule
