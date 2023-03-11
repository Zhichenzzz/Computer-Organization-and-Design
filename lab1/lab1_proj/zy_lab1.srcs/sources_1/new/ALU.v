`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/17 18:48:50
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter WIDTH=32)	//���ݿ��
(
input  wire [WIDTH-1:0] a, b,	        //�������������ڼ����㣬a�Ǳ�������
input  wire [2:0] f,		                //�������ܣ��ӡ������롢�����ȣ�
output  reg[WIDTH-1:0] y, 	           //���������͡��� ���� 
output  wire z 			               //���־��������Ϊ�㣬z��1��
);
always@(*)
begin
case(f)
3'b000:y=a+b;
3'b001:y=a-b;
3'b010:y=a&b;
3'b011:y=a|b;
3'b100:y=a^b;
default:y=0;
endcase
end
assign z= y==0?1:0;
endmodule
