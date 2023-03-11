`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/28 20:14:31
// Design Name: 
// Module Name: register8_4
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


module register8_4(
input clk,we,
input [2:0]wa,ra0,ra1,
input [3:0]wd,
output [3:0]rd0,rd1
    );
reg [3:0] regfile[0:7];

assign rd0 = regfile[ra0];
assign rd1 = regfile[ra1];

always@(posedge  clk) 
begin
    if(we)regfile[wa]<=wd;
end

endmodule