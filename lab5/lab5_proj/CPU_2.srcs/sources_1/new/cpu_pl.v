`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/04 20:24:51
// Design Name: 
// Module Name: cpu_pl
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

module  cpu_pl (
  input clk, 
  input rst,

  //IO_BUS
  output [7:0] io_addr,      //led和seg的地址
  output [31:0] io_dout,     //输出led和seg的数据
  output io_we,                 //输出led和seg数据时的使能信号
  input [31:0] io_din,        //来自sw的输入数据

  //Debug_BUS
  input [7:0] m_rf_addr,   //存储器(MEM)或寄存器堆(RF)的调试读口地址
  output [31:0] rf_data,    //从RF读取的数据
  output [31:0] m_data,    //从MEM读取的数据

  //PC/IF/ID 流水段寄存器
  output [31:0] pc,
  output [31:0] pcd,
  output [31:0] ir,
  output [31:0] pcin,

  // ID/EX 流水段寄存器
  output [31:0] pce,
  output [31:0] a,
  output [31:0] b,
  output [31:0] imm,
  output [4:0] rd,
  output [31:0] ctrl,

  // EX/MEM 流水段寄存器
  output [31:0] y,
  output [31:0] bm,
  output [4:0] rdm,
  output [31:0] ctrlm,

  // MEM/WB 流水段寄存器
  output [31:0] yw,
  output [31:0] mdr,
  output [4:0] rdw,
  output [31:0] ctrlw
);
//IF信号
wire [31:0]nouse0,nouse1,nouse2,nouse3,nouse4,nouse5,nouse6;
wire [31:0]ir0,pc4;
wire [31:0]pcsrc;//beq or jump
wire pcsel;//
wire stop,rst_IF_ID;/////////////

wire[31:0]pc4d;
//IF
mux2 pcmux(pc4,pcsrc,pcsel,pcin);
PCregister PC(pcin,clk,rst,stop,pc);
add pcadd(pc,32'b0100,pc4);
I_mem Imem(pc[9:2],32'b0,clk,1'b0,ir0);
SegmentRegister IF_ID({32'b0,pc,pc4,32'b0,32'b0,ir0,32'b0},clk,rst_IF_ID,stop,nouse0,pcd,pc4d,nouse1,nouse2,ir,nouse3);


wire RegWrite,rst_ID_EX,rst_ID_EX0,rst_ID_EX1;
wire [31:0]wd,rd1,rd2,immd,ctrld,pc4e,ire;
register registerfile(clk,RegWrite,rdw,ir[19:15],ir[24:20],m_rf_addr[4:0],wd,rd1,rd2,rf_data);
Imm Immnumber(ir,immd);
control Control(ir[6:0],ctrld);
SegmentRegister ID_EX({ctrld,pcd,pc4d,rd1,rd2,ir,immd},clk,rst_ID_EX,1'b0,ctrl,pce,pc4e,a,b,ire,imm);
assign rd=ire[11:7];
Hazard_Detection_Unit Hazard_Detection(ir[19:15],ir[24:20],ire[11:7],ctrl[13],stop,rst_ID_EX0);

wire [31:0]rs2_or_imm,alunum1,alunum2,aluresult,irm,irw;
wire [1:0]afwd,bfwd;
wire zero;
wire [31:0]pc4m;

mux2 rd2_imm(alunum2,imm,ctrl[4],rs2_or_imm);
add addar(pce,imm,pcsrc);
mux3 fwda(a,y,wd,afwd,alunum1);
mux3 fwdb(b,y,wd,bfwd,alunum2);
Forwarding_Unit forwarding_unit(ctrlm[18],ctrlw[18],ire[19:15],ire[24:20],irm[11:7],irw[11:7],afwd,bfwd);
alu ALU(alunum1,rs2_or_imm,ctrl[0],aluresult,zero);
assign rst_ID_EX1 = (zero&ctrl[8])|ctrl[9];
assign rst_ID_EX = rst_ID_EX0|rst_ID_EX1;
assign rst_IF_ID = (zero&ctrl[8])|ctrl[9];
assign pcsel = (zero&ctrl[8])|ctrl[9];
SegmentRegister EX_MEM({ctrl,32'b0,pc4e,aluresult,alunum2,ire,32'b0},clk,1'b0,1'b0,ctrlm,nouse4,pc4m,y,bm,irm,nouse5);
assign rdm=irm[11:7];

wire [31:0]lw_data,pc4w,bmw;
wire mem_write;
assign mem_write=ctrlm[12]&~y[10];
D_mem Dmem(y[9:2],bm,m_rf_addr,clk,mem_write,lw_data,m_data);
SegmentRegister MEM_WB({ctrlm,bm,pc4m,lw_data,y,irm,32'b0},clk,1'b0,1'b0,ctrlw,bmw,pc4w,mdr,yw,irw,nouse6);
assign rdw=irw[11:7];

wire [31:0]wrdata;
mux2 mdr_or_io(mdr,io_din,yw[10],wrdata);
mux3 rfwd(pc4w,wrdata,yw,ctrlw[17:16],wd);
assign RegWrite=ctrlw[18];
assign io_addr=yw[7:0];
assign io_dout=bmw;
assign io_we=yw[10]&ctrlw[12];
endmodule
