// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Mar 29 16:25:24 2022
// Host        : LAPTOP-RHAK5E3J running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/13232/Desktop/vivado/zy_lab2/zy_lab2.sim/sim_1/synth/func/xsim/LCU_sim_func_synth.v
// Design      : LCU
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module D
   (en2,
    en1_IBUF,
    clk_IBUF_BUFG);
  output en2;
  input en1_IBUF;
  input clk_IBUF_BUFG;

  wire clk_IBUF_BUFG;
  wire en1_IBUF;
  wire en2;

  FDRE #(
    .INIT(1'b0)) 
    b_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(en1_IBUF),
        .Q(en2),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "D" *) 
module D_0
   (en3,
    en2,
    clk_IBUF_BUFG);
  output en3;
  input en2;
  input clk_IBUF_BUFG;

  wire clk_IBUF_BUFG;
  wire en2;
  wire en3;

  FDRE #(
    .INIT(1'b0)) 
    b_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(en2),
        .Q(en3),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "D" *) 
module D_1
   (de2,
    de1_IBUF,
    clk_IBUF_BUFG);
  output de2;
  input de1_IBUF;
  input clk_IBUF_BUFG;

  wire clk_IBUF_BUFG;
  wire de1_IBUF;
  wire de2;

  FDRE #(
    .INIT(1'b0)) 
    b_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(de1_IBUF),
        .Q(de2),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "D" *) 
module D_2
   (de3,
    de2,
    clk_IBUF_BUFG);
  output de3;
  input de2;
  input clk_IBUF_BUFG;

  wire clk_IBUF_BUFG;
  wire de2;
  wire de3;

  FDRE #(
    .INIT(1'b0)) 
    b_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(de2),
        .Q(de3),
        .R(1'b0));
endmodule

module FSM
   (we,
    Q,
    we3,
    \cs_reg[1]_0 ,
    c,
    full_OBUF,
    emp_OBUF,
    in_IBUF,
    bfull,
    bemp,
    clk_IBUF_BUFG,
    en3,
    en2,
    de2,
    de3,
    rst_IBUF);
  output we;
  output [1:0]Q;
  output we3;
  output \cs_reg[1]_0 ;
  output [3:0]c;
  output full_OBUF;
  output emp_OBUF;
  input [3:0]in_IBUF;
  input bfull;
  input bemp;
  input clk_IBUF_BUFG;
  input en3;
  input en2;
  input de2;
  input de3;
  input rst_IBUF;

  wire [1:0]Q;
  wire bemp;
  wire bfull;
  wire [3:0]c;
  wire clk_IBUF_BUFG;
  wire \cs[0]_i_1_n_0 ;
  wire \cs[1]_i_1_n_0 ;
  wire \cs_reg[1]_0 ;
  wire de2;
  wire de3;
  wire emp_OBUF;
  wire en2;
  wire en3;
  wire full_OBUF;
  wire [3:0]in_IBUF;
  wire rst_IBUF;
  wire we;
  wire we3;

  LUT6 #(
    .INIT(64'h00000000FFFFF4FF)) 
    \cs[0]_i_1 
       (.I0(en3),
        .I1(en2),
        .I2(emp_OBUF),
        .I3(de2),
        .I4(de3),
        .I5(rst_IBUF),
        .O(\cs[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00FD)) 
    \cs[1]_i_1 
       (.I0(en2),
        .I1(en3),
        .I2(full_OBUF),
        .I3(rst_IBUF),
        .O(\cs[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cs_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\cs[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cs_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\cs[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  register1_2 reg_0
       (.Q(Q),
        .bemp(bemp),
        .bfull(bfull),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .emp_OBUF(emp_OBUF),
        .full_OBUF(full_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \regfile[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\cs_reg[1]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \regfile[3]_i_2 
       (.I0(Q[0]),
        .O(we3));
  LUT2 #(
    .INIT(4'h6)) 
    regfile_reg_0_7_0_3_i_1
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(we));
  LUT2 #(
    .INIT(4'h2)) 
    regfile_reg_0_7_0_3_i_2
       (.I0(in_IBUF[1]),
        .I1(Q[1]),
        .O(c[1]));
  LUT2 #(
    .INIT(4'h2)) 
    regfile_reg_0_7_0_3_i_3
       (.I0(in_IBUF[0]),
        .I1(Q[1]),
        .O(c[0]));
  LUT2 #(
    .INIT(4'h2)) 
    regfile_reg_0_7_0_3_i_4
       (.I0(in_IBUF[3]),
        .I1(Q[1]),
        .O(c[3]));
  LUT2 #(
    .INIT(4'h2)) 
    regfile_reg_0_7_0_3_i_5
       (.I0(in_IBUF[2]),
        .I1(Q[1]),
        .O(c[2]));
endmodule

(* NotValidForBitStream *)
module LCU
   (in,
    en1,
    de1,
    rst,
    clk,
    out,
    full,
    emp);
  input [3:0]in;
  input en1;
  input de1;
  input rst;
  input clk;
  output [3:0]out;
  output full;
  output emp;

  wire FSM_0_n_4;
  wire FSM_0_n_5;
  wire FSM_0_n_6;
  wire FSM_0_n_7;
  wire FSM_0_n_8;
  wire bemp;
  wire bfull;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire de1;
  wire de1_IBUF;
  wire de2;
  wire de3;
  wire emp;
  wire emp_OBUF;
  wire en1;
  wire en1_IBUF;
  wire en2;
  wire en3;
  wire full;
  wire full_OBUF;
  wire [3:0]in;
  wire [3:0]in_IBUF;
  wire mux2;
  wire mux5;
  wire [3:0]out;
  wire [3:0]out_OBUF;
  wire [3:0]rd1;
  wire register1_3_0_n_1;
  wire register1_3_0_n_2;
  wire register1_3_0_n_3;
  wire register1_3_1_n_3;
  wire register1_3_1_n_4;
  wire register1_3_1_n_5;
  wire rst;
  wire rst_IBUF;
  wire [2:0]wa;
  wire we;
  wire we3;

  D D0
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .en1_IBUF(en1_IBUF),
        .en2(en2));
  D_0 D1
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .en2(en2),
        .en3(en3));
  D_1 D2
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .de1_IBUF(de1_IBUF),
        .de2(de2));
  D_2 D3
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .de2(de2),
        .de3(de3));
  FSM FSM_0
       (.Q({mux5,mux2}),
        .bemp(bemp),
        .bfull(bfull),
        .c({FSM_0_n_5,FSM_0_n_6,FSM_0_n_7,FSM_0_n_8}),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\cs_reg[1]_0 (FSM_0_n_4),
        .de2(de2),
        .de3(de3),
        .emp_OBUF(emp_OBUF),
        .en2(en2),
        .en3(en3),
        .full_OBUF(full_OBUF),
        .in_IBUF(in_IBUF),
        .rst_IBUF(rst_IBUF),
        .we(we),
        .we3(we3));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF de1_IBUF_inst
       (.I(de1),
        .O(de1_IBUF));
  OBUF emp_OBUF_inst
       (.I(emp_OBUF),
        .O(emp));
  IBUF en1_IBUF_inst
       (.I(en1),
        .O(en1_IBUF));
  OBUF full_OBUF_inst
       (.I(full_OBUF),
        .O(full));
  IBUF \in_IBUF[0]_inst 
       (.I(in[0]),
        .O(in_IBUF[0]));
  IBUF \in_IBUF[1]_inst 
       (.I(in[1]),
        .O(in_IBUF[1]));
  IBUF \in_IBUF[2]_inst 
       (.I(in[2]),
        .O(in_IBUF[2]));
  IBUF \in_IBUF[3]_inst 
       (.I(in[3]),
        .O(in_IBUF[3]));
  OBUF \out_OBUF[0]_inst 
       (.I(out_OBUF[0]),
        .O(out[0]));
  OBUF \out_OBUF[1]_inst 
       (.I(out_OBUF[1]),
        .O(out[1]));
  OBUF \out_OBUF[2]_inst 
       (.I(out_OBUF[2]),
        .O(out[2]));
  OBUF \out_OBUF[3]_inst 
       (.I(out_OBUF[3]),
        .O(out[3]));
  register1_3 register1_3_0
       (.Q({mux5,mux2}),
        .bfull(bfull),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\regfile_reg[0]_0 (register1_3_0_n_1),
        .\regfile_reg[1]_0 (register1_3_0_n_3),
        .\regfile_reg[1]_1 (register1_3_1_n_5),
        .\regfile_reg[1]_2 (register1_3_1_n_4),
        .\regfile_reg[1]_3 (register1_3_1_n_3),
        .\regfile_reg[2]_0 (register1_3_0_n_2));
  register1_3_3 register1_3_1
       (.ADDRA({register1_3_0_n_2,register1_3_0_n_3,register1_3_0_n_1}),
        .ADDRD(wa),
        .Q({mux5,mux2}),
        .bemp(bemp),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\regfile_reg[0]_0 (register1_3_1_n_3),
        .\regfile_reg[1]_0 (register1_3_1_n_4),
        .\regfile_reg[2]_0 (register1_3_1_n_5));
  register1_4 register1_4_0
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .out_OBUF(out_OBUF),
        .rd1(rd1),
        .\regfile_reg[3]_0 (FSM_0_n_4),
        .we3(we3));
  register8_4 register8_4_0
       (.ADDRA({register1_3_0_n_2,register1_3_0_n_3,register1_3_0_n_1}),
        .ADDRD(wa),
        .c({FSM_0_n_5,FSM_0_n_6,FSM_0_n_7,FSM_0_n_8}),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .rd1(rd1),
        .we(we));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
endmodule

module register1_2
   (full_OBUF,
    emp_OBUF,
    bfull,
    Q,
    bemp,
    clk_IBUF_BUFG);
  output full_OBUF;
  output emp_OBUF;
  input bfull;
  input [1:0]Q;
  input bemp;
  input clk_IBUF_BUFG;

  wire [1:0]Q;
  wire bemp;
  wire bfull;
  wire clk_IBUF_BUFG;
  wire emp_OBUF;
  wire full_OBUF;
  wire \regfile[0]_i_1_n_0 ;
  wire \regfile[1]_i_1_n_0 ;

  LUT4 #(
    .INIT(16'hE323)) 
    \regfile[0]_i_1 
       (.I0(bemp),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(emp_OBUF),
        .O(\regfile[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC808)) 
    \regfile[1]_i_1 
       (.I0(bfull),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(full_OBUF),
        .O(\regfile[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\regfile[0]_i_1_n_0 ),
        .Q(emp_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\regfile[1]_i_1_n_0 ),
        .Q(full_OBUF),
        .R(1'b0));
endmodule

module register1_3
   (bfull,
    \regfile_reg[0]_0 ,
    \regfile_reg[2]_0 ,
    \regfile_reg[1]_0 ,
    \regfile_reg[1]_1 ,
    \regfile_reg[1]_2 ,
    \regfile_reg[1]_3 ,
    Q,
    clk_IBUF_BUFG);
  output bfull;
  output \regfile_reg[0]_0 ;
  output \regfile_reg[2]_0 ;
  output \regfile_reg[1]_0 ;
  input \regfile_reg[1]_1 ;
  input \regfile_reg[1]_2 ;
  input \regfile_reg[1]_3 ;
  input [1:0]Q;
  input clk_IBUF_BUFG;

  wire [1:0]Q;
  wire bfull;
  wire clk_IBUF_BUFG;
  wire \regfile[0]_i_1_n_0 ;
  wire \regfile[1]_i_1_n_0 ;
  wire \regfile[2]_i_1_n_0 ;
  wire \regfile_reg[0]_0 ;
  wire \regfile_reg[1]_0 ;
  wire \regfile_reg[1]_1 ;
  wire \regfile_reg[1]_2 ;
  wire \regfile_reg[1]_3 ;
  wire \regfile_reg[2]_0 ;

  LUT3 #(
    .INIT(8'h98)) 
    \regfile[0]_i_1 
       (.I0(\regfile_reg[0]_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(\regfile[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hA6A0)) 
    \regfile[1]_i_1 
       (.I0(\regfile_reg[1]_0 ),
        .I1(\regfile_reg[0]_0 ),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(\regfile[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0480012010084002)) 
    \regfile[1]_i_2 
       (.I0(\regfile_reg[0]_0 ),
        .I1(\regfile_reg[1]_1 ),
        .I2(\regfile_reg[1]_2 ),
        .I3(\regfile_reg[1]_3 ),
        .I4(\regfile_reg[2]_0 ),
        .I5(\regfile_reg[1]_0 ),
        .O(bfull));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hAA6AAA00)) 
    \regfile[2]_i_1 
       (.I0(\regfile_reg[2]_0 ),
        .I1(\regfile_reg[1]_0 ),
        .I2(\regfile_reg[0]_0 ),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\regfile[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\regfile[0]_i_1_n_0 ),
        .Q(\regfile_reg[0]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\regfile[1]_i_1_n_0 ),
        .Q(\regfile_reg[1]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\regfile[2]_i_1_n_0 ),
        .Q(\regfile_reg[2]_0 ),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "register1_3" *) 
module register1_3_3
   (ADDRD,
    \regfile_reg[0]_0 ,
    \regfile_reg[1]_0 ,
    \regfile_reg[2]_0 ,
    bemp,
    ADDRA,
    Q,
    clk_IBUF_BUFG);
  output [2:0]ADDRD;
  output \regfile_reg[0]_0 ;
  output \regfile_reg[1]_0 ;
  output \regfile_reg[2]_0 ;
  output bemp;
  input [2:0]ADDRA;
  input [1:0]Q;
  input clk_IBUF_BUFG;

  wire [2:0]ADDRA;
  wire [2:0]ADDRD;
  wire [1:0]Q;
  wire bemp;
  wire clk_IBUF_BUFG;
  wire \regfile[0]_i_1_n_0 ;
  wire \regfile[1]_i_1_n_0 ;
  wire \regfile[2]_i_1_n_0 ;
  wire \regfile_reg[0]_0 ;
  wire \regfile_reg[1]_0 ;
  wire \regfile_reg[2]_0 ;

  LUT3 #(
    .INIT(8'hC2)) 
    \regfile[0]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(\regfile_reg[0]_0 ),
        .O(\regfile[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0480012010084002)) 
    \regfile[0]_i_2 
       (.I0(\regfile_reg[0]_0 ),
        .I1(ADDRA[2]),
        .I2(ADDRA[1]),
        .I3(ADDRA[0]),
        .I4(\regfile_reg[2]_0 ),
        .I5(\regfile_reg[1]_0 ),
        .O(bemp));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hF208)) 
    \regfile[1]_i_1 
       (.I0(Q[0]),
        .I1(\regfile_reg[0]_0 ),
        .I2(Q[1]),
        .I3(\regfile_reg[1]_0 ),
        .O(\regfile[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFF2A0080)) 
    \regfile[2]_i_1 
       (.I0(Q[0]),
        .I1(\regfile_reg[1]_0 ),
        .I2(\regfile_reg[0]_0 ),
        .I3(Q[1]),
        .I4(\regfile_reg[2]_0 ),
        .O(\regfile[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\regfile[0]_i_1_n_0 ),
        .Q(\regfile_reg[0]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\regfile[1]_i_1_n_0 ),
        .Q(\regfile_reg[1]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\regfile[2]_i_1_n_0 ),
        .Q(\regfile_reg[2]_0 ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hCA)) 
    regfile_reg_0_7_0_3_i_6
       (.I0(\regfile_reg[2]_0 ),
        .I1(ADDRA[2]),
        .I2(Q[1]),
        .O(ADDRD[2]));
  LUT3 #(
    .INIT(8'hCA)) 
    regfile_reg_0_7_0_3_i_7
       (.I0(\regfile_reg[1]_0 ),
        .I1(ADDRA[1]),
        .I2(Q[1]),
        .O(ADDRD[1]));
  LUT3 #(
    .INIT(8'hCA)) 
    regfile_reg_0_7_0_3_i_8
       (.I0(\regfile_reg[0]_0 ),
        .I1(ADDRA[0]),
        .I2(Q[1]),
        .O(ADDRD[0]));
endmodule

module register1_4
   (out_OBUF,
    \regfile_reg[3]_0 ,
    we3,
    rd1,
    clk_IBUF_BUFG);
  output [3:0]out_OBUF;
  input \regfile_reg[3]_0 ;
  input we3;
  input [3:0]rd1;
  input clk_IBUF_BUFG;

  wire clk_IBUF_BUFG;
  wire [3:0]out_OBUF;
  wire [3:0]rd1;
  wire \regfile_reg[3]_0 ;
  wire we3;

  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(we3),
        .D(rd1[0]),
        .Q(out_OBUF[0]),
        .R(\regfile_reg[3]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(we3),
        .D(rd1[1]),
        .Q(out_OBUF[1]),
        .R(\regfile_reg[3]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(we3),
        .D(rd1[2]),
        .Q(out_OBUF[2]),
        .R(\regfile_reg[3]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \regfile_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(we3),
        .D(rd1[3]),
        .Q(out_OBUF[3]),
        .R(\regfile_reg[3]_0 ));
endmodule

module register8_4
   (rd1,
    clk_IBUF_BUFG,
    we,
    c,
    ADDRA,
    ADDRD);
  output [3:0]rd1;
  input clk_IBUF_BUFG;
  input we;
  input [3:0]c;
  input [2:0]ADDRA;
  input [2:0]ADDRD;

  wire [2:0]ADDRA;
  wire [2:0]ADDRD;
  wire [3:0]c;
  wire clk_IBUF_BUFG;
  wire [3:0]rd1;
  wire we;
  wire [1:0]NLW_regfile_reg_0_7_0_3_DOC_UNCONNECTED;
  wire [1:0]NLW_regfile_reg_0_7_0_3_DOD_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "32" *) 
  (* RTL_RAM_NAME = "register8_4_0/regfile" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "7" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "3" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    regfile_reg_0_7_0_3
       (.ADDRA({1'b0,1'b0,ADDRA}),
        .ADDRB({1'b0,1'b0,ADDRA}),
        .ADDRC({1'b0,1'b0,ADDRA}),
        .ADDRD({1'b0,1'b0,ADDRD}),
        .DIA(c[1:0]),
        .DIB(c[3:2]),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA(rd1[1:0]),
        .DOB(rd1[3:2]),
        .DOC(NLW_regfile_reg_0_7_0_3_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_regfile_reg_0_7_0_3_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(we));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
