`timescale 1ns / 1ps

module Forwarding_unit(
    input [4:0] rs1,
    input [4:0] rs2,
    input [1:0] RXF,
    input [4:0] rdm,
    input mWXF,
    input [4:0] rdw,
    input wWXF,
    input wbm,
    input wbw,
    output [1:0] afwd,
    output [1:0] bfwd
    );
    assign afwd = (rdm !== 0 && rdm === rs1 && wbm === 1'b1 && RXF[0] === mWXF) ? 2'b01 : ((rdw !== 0 && rdw === rs1 && wbw === 1'b1 && RXF[0] === wWXF) ? 2'b10 : 2'b00);
    assign bfwd = (rdm !== 0 && rdm === rs2 && wbm === 1'b1 && RXF[1] === mWXF) ? 2'b01 : ((rdw !== 0 && rdw === rs2 && wbw === 1'b1 && RXF[1] === wWXF) ? 2'b10 : 2'b00);
endmodule
