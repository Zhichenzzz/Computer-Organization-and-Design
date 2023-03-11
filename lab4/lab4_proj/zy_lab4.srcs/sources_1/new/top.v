`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/14 19:17:15
// Design Name: 
// Module Name: top
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


module top(
input run,step,valid,rst,clk,
input[4:0] in,
output[1:0]check,
output[4:0]out0,
output ready,
output [2:0]an,
output [3:0]seg
    );
    wire clk_cpu,clk_rst;
    wire[31:0]pc;
    wire[7:0]m_rf_addr;
    wire[31:0]rf_data;
    wire[31:0]m_data;
    wire[7:0]io_addr;
    wire[31:0]io_dout;
    wire[31:0]io_din;
    wire io_we;
    pdu(clk,rst,run,step,clk_cpu,valid,in,check,out0,an,seg,ready,io_addr,io_dout,io_we,io_din,m_rf_addr,rf_data,m_data,pc);
    cpu(clk_cpu,rst,pc,m_rf_addr,rf_data,m_data,io_addr,io_dout,io_din,io_we);
endmodule
