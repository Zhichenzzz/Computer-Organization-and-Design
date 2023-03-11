`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/28 20:13:15
// Design Name: 
// Module Name: register1_3
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


module register1_3(
input clk,we,
input [2:0]wd,
output [2:0]rd
    );
    
reg [2:0] regfile;
initial regfile=0;

assign rd = regfile;

always@(posedge  clk) 

begin
    if(we)regfile<=wd;
end

endmodule
