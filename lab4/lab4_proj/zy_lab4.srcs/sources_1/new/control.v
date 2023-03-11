`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/14 17:24:10
// Design Name: 
// Module Name: control
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


module control
#(parameter 
ADDI=7'b0010011,
ADD=7'b0110011,
SUB=7'b0110011,
AUIPC=7'b001011,
JAL=7'b1101111,
JALR=7'b1100111,
BEQ=7'b1100011,
BLT=7'b1100011,
LW=7'b0000011,
SW=7'b0100011)
(
input [6:0]in,
input branch,
output reg[2:0]select,
output reg mux1,mux2,
output reg[1:0]mux4,
output reg register_we,
output reg D_mem_we,
output reg D_mem_ena
    );
always@(*)
begin
    case(in)
    ADDI:begin select=3'b000;mux1=1'b1;mux2=1'b1;mux4=2'b10;register_we=1'b1;D_mem_we=1'b0;D_mem_ena=1'b0;end
    ADD:begin select=3'b000;mux1=1'b1;mux2=1'b0;mux4=2'b10;register_we=1'b1;D_mem_we=1'b0;D_mem_ena=1'b0;end
    //SUB:begin select=3'b000;mux1=1'b1;mux2=1'b0;mux4=2'b10;register_we=1'b1;D_mem_we=1'b0;D_mem_ena=1'b0;end
    AUIPC:begin select=3'b000;mux1=1'b0;mux2=1'b1;mux4=2'b10;register_we=1'b1;D_mem_we=1'b0;D_mem_ena=1'b0;end
    JAL:begin select=3'b001;mux1=1'bx;mux2=1'bx;mux4=2'b00;register_we=1'b1;D_mem_we=1'b0;D_mem_ena=1'b0;end
    JALR:begin select=3'b111;mux1=1'b1;mux2=1'b1;mux4=2'b00;register_we=1'b1;D_mem_we=1'b0;D_mem_ena=1'b0;end
    BEQ:if(branch)begin select=3'b011;mux1=1'b1;mux2=1'b0;mux4=2'bxx;register_we=1'b0;D_mem_we=1'b0;D_mem_ena=1'b0;end else begin  select=3'b101;mux1=1'b1;mux2=1'b0;mux4=2'bxx;register_we=1'b0;D_mem_we=1'b0;D_mem_ena=1'b0;end
    LW:begin select=3'b000;mux1=1'b1;mux2=1'b1;mux4=2'b01;register_we=1'b1;D_mem_we=1'b0;D_mem_ena=1'b1;end
    SW:begin select=3'b000;mux1=1'b1;mux2=1'b1;mux4=2'b01;register_we=1'b0;D_mem_we=1'b1;D_mem_ena=1'b0;end
    default:begin select=3'b000;mux1=1'bx;mux2=1'bx;mux4=2'bxx;register_we=1'b0;D_mem_we=1'b0;D_mem_ena=1'b0;end
    endcase
end
endmodule
