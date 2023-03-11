`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/14 19:18:51
// Design Name: 
// Module Name: cpu
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


module cpu(
input clk_cpu,rst,
output [31:0]pc,
input [7:0]m_rf_addr,
output [31:0]rf_data,
output [31:0]m_data,
output [7:0]io_addr,
output [31:0]io_dout,
input [31:0]io_din,
output io_we
    );
    wire[31:0]w_npc,w_pc,w_pc4,jbpc;
    wire[31:0]in,w_rd1,w_rd2,w_alu1,w_alu2,w_alu,w_wd,ld0,ld1,imm1;
    
    wire register_we,mux__1,mux__2,mux__3,w_alu_c;
    wire[1:0]mux__4,mux__5;
    wire zero,less;
    wire[2:0]sel;
    wire D_mem_ena,D_mem_we,D_we;
    
    control(in[6:0],~in[14],sel,mux__1,mux__2,mux__4,register_we,D_mem_we,D_mem_ena);
    PCregister(w_npc,clk_cpu,rst,w_pc);
    I_mem1(w_pc[9:2],32'b0,clk_cpu,1'b0,in);
    register(clk_cpu,register_we,in[11:7],in[19:15],in[24:20],m_rf_addr[4:0],w_wd,w_rd1,w_rd2,rf_data);
    imm(in,imm1);
    mux2 mux_1(w_pc,w_rd1,mux__1,w_alu1);
    mux2 mux_2(w_rd2,imm1,mux__2,w_alu2);
    alu(w_alu1,w_alu2,w_alu_c,w_alu,zero,less);
    alu_control(in[6:0],in[30],w_alu_c);
    add(w_pc,imm1,jbpc);
    add(w_pc,32'b0100,w_pc4);
    mux3 mux3_1(w_pc4,jbpc,w_alu,mux__5,w_npc);
    jump_selet(zero,less,sel,mux__5);
    
    assign D_we=D_mem_we&~w_alu[10];
    D_mem1(w_alu[9:2],w_rd2,m_rf_addr,clk_cpu,D_we,ld0,m_data);
    mux2 mux_3(ld0,io_din,mux__3,ld1);
    assign mux__3=w_alu[10];
    mux3 mux3_2(w_pc4,ld1,w_alu,mux__4,w_wd);
    assign pc=w_pc;
    assign io_addr=w_alu[7:0];
    assign io_dout=w_rd2;
    assign io_we=w_alu[10]&D_mem_we;
endmodule
