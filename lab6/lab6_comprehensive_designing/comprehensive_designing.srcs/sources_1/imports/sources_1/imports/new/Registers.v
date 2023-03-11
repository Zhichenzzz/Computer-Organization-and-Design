`timescale 1ns / 1ps

module XRegisters(input clk,
                 input [4:0] read_register1,
                 output [31:0] read_data1,
                 input [4:0] read_register2,
                 output [31:0] read_data2,
                 input [4:0] read_register3,
                 output [31:0] read_data3,
                 input [4:0] write_address,
                 input RegWrite,
                 input [31:0] write_data);
    reg [31:0] regfile[31:0];
    assign read_data1 = (RegWrite === 1'b1 && write_address === read_register1 && write_address !== 0) ? write_data : regfile[read_register1];
    assign read_data2 = (RegWrite === 1'b1 && write_address === read_register2 && write_address !== 0) ? write_data : regfile[read_register2];
    assign read_data3 = (RegWrite === 1'b1 && write_address === read_register3 && write_address !== 0) ? write_data : regfile[read_register3];

    always @(posedge clk) begin
        regfile[0] = 0;
        if (RegWrite && write_address != 0) begin
            regfile[write_address] = write_data;
        end
    end
endmodule

module FRegisters(input clk,
                 input [4:0] read_register1,
                 output [31:0] read_data1,
                 input [4:0] read_register2,
                 output [31:0] read_data2,
                 input [4:0] write_address,
                 input RegWrite,
                 input [31:0] write_data);
    reg [31:0] regfile[31:0];
    assign read_data1 = (RegWrite === 1'b1 && write_address === read_register1) ? write_data : regfile[read_register1];
    assign read_data2 = (RegWrite === 1'b1 && write_address === read_register2) ? write_data : regfile[read_register2];

    always @(posedge clk) begin
        if (RegWrite) begin
            regfile[write_address] = write_data;
        end
    end
endmodule
