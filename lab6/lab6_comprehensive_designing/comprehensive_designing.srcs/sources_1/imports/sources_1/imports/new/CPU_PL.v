`timescale 1ns / 1ps

module CPU_PL(input run,
              input step,
              input valid,
              input [4:0] in,
              input rst,
              input clk,
              output [1:0] check,
              output [4:0] out0,
              output [2:0] an,
              output [3:0] seg,
              output ready);
    wire clk_cpu;
    wire [7:0] io_addr;
    wire [31:0] io_dout;
    wire [31:0] io_din;
    wire io_we;
    
    wire [7:0] m_rf_addr;
    wire [31:0] rf_data;
    wire [31:0] m_data;
    wire [31:0] pcin, pc, pcd, pce;
    wire [31:0] ir, imm, mdr;
    wire [31:0] a, b, y, bm, yw;
    wire [4:0]  rd, rdm, rdw;
    wire [31:0] ctrl, ctrlm, ctrlw;

    pdu_pl pdu(clk, rst, run, step, clk_cpu, valid, in, check, out0, an, seg, ready, io_addr, io_dout, io_we, io_din, m_rf_addr, rf_data, m_data, pcin, pc, pcd, pce, ir, imm, mdr, a, b, y, bm, yw, rd, rdm, rdw, ctrl, ctrlm, ctrlw);
    CPU cpu(clk_cpu, rst, io_addr, io_dout, io_we, io_din, m_rf_addr, rf_data, m_data, pc, pcd, ir, pcin, pce, a, b, imm, rd, ctrl, y, bm, rdm, ctrlm, yw, mdr, rdw, ctrlw);
endmodule

module test(input clk,
            input en,
            input [7:0] sw,
            output [7:0] led,
            output [2:0] an,
            output [3:0] seg);
    CPU_PL cpu_pl(sw[6], en, sw[5], sw[4:0], sw[7], clk, led[6:5], led[4:0], an, seg, led[7]);
endmodule
