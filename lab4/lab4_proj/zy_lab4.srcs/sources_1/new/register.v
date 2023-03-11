module register
#(parameter WIDTH=32)
(
input clk,we,
input [4:0]wa,ra0,ra1,ra2,
input [WIDTH-1:0]wd,
output [WIDTH-1:0]rd0,rd1,rd2
    );
reg [WIDTH-1:0] regfile[0:31];

assign rd0 = regfile[ra0];
assign rd1 = regfile[ra1];
assign rd2 = regfile[ra2];

always@(posedge  clk) 
begin
    if(we)
    if(wa==5'b00000)regfile[wa]<=5'b00000;
    else
    regfile[wa]<=wd;
end

endmodule