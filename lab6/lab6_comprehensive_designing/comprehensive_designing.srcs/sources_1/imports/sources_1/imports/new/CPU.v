`timescale 1ns / 1ps

module CPU(input clk,
           input rst,
           output [7:0] io_addr,
           output [31:0] io_dout,
           output io_we,
           input [31:0] io_din,
           input [7:0] m_rf_addr,
           output [31:0] rf_data,
           output [31:0] m_data,
           output [31:0] pc,
           output [31:0] pcd,
           output [31:0] ir,
           output [31:0] pcin,
           output [31:0] pce,
           output [31:0] a,
           output [31:0] b,
           output [31:0] imm,
           output [4:0] rd,
           output [31:0] ctrl,
           output [31:0] y,
           output [31:0] bm,
           output [4:0] rdm,
           output [31:0] ctrlm,
           output [31:0] yw,
           output [31:0] mdr,
           output [4:0] rdw,
           output [31:0] ctrlw);
    
    wire [31:0] nPC;
    wire [31:0] Instruction;
    
    // Control
    wire reg_base;
    wire jal;
    wire Branch;
    wire PCsrc;
    wire [1:0] RegSrc;
    wire MemWrite;
    wire MemRead;
    wire ALUSrc1;
    wire ALUSrc2;
    wire RegWrite;
    wire [2:0] j_control;
    // ALUControl
    wire [3:0] alu_control;
    wire [2:0] fcontrol;
    
    wire [31:0] immediate;
    
    wire [31:0] xreg_read_data1;
    wire [31:0] xreg_read_data2;

    wire [31:0] freg_read_data1;
    wire [31:0] freg_read_data2;

    wire [31:0] reg_read_data1;
    wire [31:0] reg_read_data2;

    wire [31:0] RegMux_result;
    
    wire [31:0] ALUMux_result1;
    wire [31:0] ALUMux_result2;
    wire [31:0] ALUresult;
    wire zero;

    wire validF;
    wire [31:0] resultF;

    wire [31:0] calculation_result;
    
    wire [31:0] mem_read_data1;
    
    wire [31:0] shift_left_imm;
    wire [31:0] offset;
    wire [31:0] PCsrc1;
    wire [31:0] PCsrc2;
    
    wire [31:0] io_mem_in;

    wire [13:0] ex;
    wire [1:0] m;
    wire [1:0] mm;
    wire [3:0] wb;
    wire [3:0] wbm;
    wire [3:0] wbw;
    wire [31:0] pcm;
    wire [31:0] pcw;
    
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [1:0] afwd;
    wire [1:0] bfwd;
    wire [31:0] a1;
    wire [31:0] b1;
    wire [31:0] a2;
    wire [31:0] b2;

    wire PCWrite;
    wire IF_IDWrite;
    wire control_signal;
    wire flush;
    wire [1:0] readXF;
    wire writeXF;

    assign pcin    = nPC;

    PCreg pcreg(
    .clk(clk),
    .rst(rst),
    .nPC(nPC),
    .PCWrite(PCWrite),
    .pc(pc)
    );
    
    // instruction
    dist_mem_gen_1 Instruction_memory (
    .a(pc[9:2]),
    .spo(Instruction)
    );

    Add PC_plus_4(
    .x1(pc),
    .x2(32'h4),
    .y(PCsrc1)
    );
    
    // IF/ID
    segment_register PCD(.en(IF_IDWrite), .clk(clk), .flush(flush), .in(pc), .out(pcd));
    segment_register IR(.en(IF_IDWrite), .clk(clk), .flush(flush), .in(Instruction), .out(ir));

    // control signal
    control Control(
    .en(control_signal),
    .Instruction(ir),
    .reg_base(reg_base),
    .jal(jal),
    .Branch(Branch),
    .RegSrc(RegSrc),
    .alu_control(alu_control),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .ALUSrc1(ALUSrc1),
    .ALUSrc2(ALUSrc2),
    .RegWrite(RegWrite),
    .readXF(readXF),
    .writeXF(writeXF),
    .fcontrol(fcontrol)
    );
    
    XRegisters register_file(
    .clk(clk),
    .read_register1(ir[19:15]),
    .read_register2(ir[24:20]),
    .read_register3(m_rf_addr),
    .write_address(rdw),
    .RegWrite(wbw[2] & !wbw[3]),
    .write_data(RegMux_result),
    .read_data1(xreg_read_data1),
    .read_data2(xreg_read_data2),
    .read_data3(rf_data)
    );

    FRegisters fregister_file(
    .clk(clk),
    .read_register1(ir[19:15]),
    .read_register2(ir[24:20]),
    .write_address(rdw),
    .RegWrite(wbw[2] & wbw[3]),
    .write_data(RegMux_result),
    .read_data1(freg_read_data1),
    .read_data2(freg_read_data2)
    );

    ImmGen Imm_Gen(
    .Instruction(ir),
    .immediate(immediate)
    );

    Mux2 RegXF1(
    .in1(xreg_read_data1),
    .in2(freg_read_data1),
    .control(readXF[0]),
    .out(reg_read_data1)
    );
    
    Mux2 RegXF2(
    .in1(xreg_read_data2),
    .in2(freg_read_data2),
    .control(readXF[1]),
    .out(reg_read_data2)
    );
    
    // ID/EX
    segment_register PCE(.en(1'b1), .clk(clk), .flush(1'b0), .in(pcd), .out(pce));
    segment_register A(.en(1'b1), .clk(clk), .flush(1'b0), .in(reg_read_data1), .out(a));
    segment_register B(.en(1'b1), .clk(clk), .flush(1'b0), .in(reg_read_data2), .out(b));
    segment_register Imm(.en(1'b1), .clk(clk), .flush(1'b0), .in(immediate), .out(imm));
    segment_register #(.WIDTH(5)) Rd(.en(1'b1), .clk(clk), .flush(1'b0), .in(ir[11:7]), .out(rd));
    segment_register #(.WIDTH(5)) Rs1(.en(1'b1), .clk(clk), .flush(1'b0), .in(ir[19:15]), .out(rs1));
    segment_register #(.WIDTH(5)) Rs2(.en(1'b1), .clk(clk), .flush(1'b0), .in(ir[24:20]), .out(rs2));
    // control
    segment_register #(.WIDTH(14)) EX(.en(1'b1), .clk(clk), .flush(flush), .in({readXF, fcontrol, reg_base, jal, Branch, ALUSrc2, ALUSrc1, alu_control}), .out(ex));
    segment_register #(.WIDTH(2)) M(.en(1'b1), .clk(clk), .flush(flush), .in({MemWrite, MemRead}), .out(m));
    segment_register #(.WIDTH(4)) WB(.en(1'b1), .clk(clk), .flush(flush), .in({writeXF, RegWrite, RegSrc}), .out(wb));
    segment_register #(.WIDTH(3)) J(.en(1'b1), .clk(clk), .flush(flush), .in(ir[14:12]), .out(j_control));

    Branch_unit branch_unit(
    .branch(ex[6]),
    .jal(ex[7]),
    .control(j_control),
    .result(ALUresult),
    .PCsrc(PCsrc)
    );

    Hazard_detection_unit hazard_detection(
    .ir(ir),
    .rd(rd),
    .memread(m[0]),
    .PCsrc(PCsrc),
    .PCWrite(PCWrite),
    .IF_IDWrite(IF_IDWrite),
    .control_signal(control_signal),
    .flush(flush)
    );

    Forwarding_unit forwarding(
    .rs1(rs1),
    .rs2(rs2),
    .RXF(ex[13:12]),
    .rdm(rdm),
    .mWXF(wbm[3]),
    .rdw(rdw),
    .wWXF(wbw[3]),
    .wbm(wbm[2]),
    .wbw(wbw[2]),
    .afwd(afwd),
    .bfwd(bfwd)
    );
    
    // forward
    Mux3 AMux(
    .in1(a),
    .in2(y),
    .in3(RegMux_result),
    .control(afwd),
    .out(a1)
    );
    
    Mux3 BMux(
    .in1(b),
    .in2(y),
    .in3(RegMux_result),
    .control(bfwd),
    .out(b1)
    );

    Mux2 ALUMux1(
    .in1(a1),
    .in2(pce),
    .control(ex[4]),
    .out(ALUMux_result1)
    );
    
    Mux2 ALUMux2(
    .in1(b1),
    .in2(imm),
    .control(ex[5]),
    .out(ALUMux_result2)
    );

    ALU alu(
    .x1(ALUMux_result1),
    .x2(ALUMux_result2),
    .control(ex[3:0]),
    .result(ALUresult),
    .zero(zero)
    );

    CompareF comparef(
    .rs1(ALUMux_result1),
    .rs2(ALUMux_result2),
    .control(ex[11:9]),
    .result(resultF)
    );

    Shift_left shift_left1(
    .immediate(imm),
    .result(shift_left_imm)
    );

    Reg_offset reg_offset(
    .imm(shift_left_imm),
    .rs(a1),
    .pc(pce),
    .control(ex[8]),
    .offset(offset)
    );

    Add PC_add_offset(
    .x1(pce),
    .x2(offset),
    .y(PCsrc2)
    );

    Mux2 resultMux(
    .in1(ALUresult),
    .in2(resultF),
    .control(ex[12]),
    .out(calculation_result)
    );
    
    // EX/MEM
    segment_register PCM(.en(1'b1), .clk(clk), .flush(1'b0), .in(pce), .out(pcm));
    segment_register Y(.en(1'b1), .clk(clk), .flush(1'b0), .in(calculation_result), .out(y));
    segment_register BM(.en(1'b1), .clk(clk), .flush(1'b0), .in(b1), .out(bm));
    segment_register #(.WIDTH(5)) RdM(.en(1'b1), .clk(clk), .flush(1'b0), .in(rd), .out(rdm));
    // control
    segment_register #(.WIDTH(2)) MM(.en(1'b1), .clk(clk), .flush(1'b0), .in(m), .out(mm));
    segment_register #(.WIDTH(4)) WBM(.en(1'b1), .clk(clk), .flush(1'b0), .in(wb), .out(wbm));

    segment_register CTRLM(.en(1'b1), .clk(clk), .flush(1'b0), .in(ctrl), .out(ctrlm));
    
    dist_mem_gen_0 Data_memory (
    .a(y >> 2),
    .d(bm),
    .dpra(m_rf_addr),
    .clk(clk),
    .we(mm[1] & !y[10]),
    .spo(mem_read_data1),
    .dpo(m_data)
    );
    
    assign io_addr = y[7:0];
    assign io_we   = y[10] & mm[1];
    assign io_dout = (y[10] & mm[1]) ? bm : 0;

    Mux2 IO_Mem_Mux(
    .in1(mem_read_data1),
    .in2(io_din),
    .control(yw[10]),
    .out(io_mem_in)
    );
    
    // MEM/WB
    segment_register PCW(.en(1'b1), .clk(clk), .flush(1'b0), .in(pcm), .out(pcw));
    segment_register MDR(.en(1'b1), .clk(clk), .flush(1'b0), .in(io_mem_in), .out(mdr));
    segment_register YW(.en(1'b1), .clk(clk), .flush(1'b0), .in(y), .out(yw));
    segment_register #(.WIDTH(5)) RdW(.en(1'b1), .clk(clk), .flush(1'b0), .in(rdm), .out(rdw));
    // control
    segment_register #(.WIDTH(4)) WBW(.en(1'b1), .clk(clk), .flush(1'b0), .in(wbm), .out(wbw));
    segment_register CTRLW(.en(1'b1), .clk(clk), .flush(1'b0), .in(ctrlm), .out(ctrlw));

    Mux3 RegMux(
    .in1(yw),
    .in2(mdr),
    .in3(pcw + 4),
    .control(wbw[1:0]),
    .out(RegMux_result)
    );

    Mux2 PCMux(
    .in1(PCsrc1),
    .in2(PCsrc2),
    .control(PCsrc),
    .out(nPC)
    );
endmodule
