`timescale 1ns / 1ps

module CompareF(input [31:0] rs1,
                input [31:0] rs2,
                input [2:0] control,
                output [31:0] result
                );
    reg [31:0] temp;
    reg eqresult;
    reg ltresult;
    reg signed [7:0] exp1;
    reg signed [7:0] exp2;

    always @(*) begin
        eqresult = (rs1 == rs2);
        if (rs1[31] != rs2[31]) begin
            ltresult = (rs1[31] == 1'b1);
        end
        else begin
            exp1 = rs1[30:23] - 127;
            exp2 = rs2[30:23] - 127;
            if (exp1 < exp2) begin
                ltresult = 1'b1;
            end
            else if (exp1 == exp2) begin
                ltresult = (rs1[22:0] < rs2[22:0]);
            end
            else begin
                ltresult = 1'b0;
            end
            ltresult = rs1[31] == 1'b0 ? ltresult : ~ltresult;
        end
    end

    always @(*) begin
        case(control)
            // 0: le
            3'b000: temp = (eqresult | ltresult);
            // 1: lt
            3'b001: temp = ltresult;
            // 2: eq
            3'b010: temp = eqresult;
            // 3: gt
            3'b011: temp = !(eqresult & ltresult);
            // 4: neq
            3'b100: temp = !eqresult;
            // 5: ge
            3'b101: temp = !ltresult;
            default: temp = 1'b0;
        endcase
    end
    assign result = {31'b0, temp};
endmodule
