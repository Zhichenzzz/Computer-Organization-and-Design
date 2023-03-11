`timescale 1ns / 1ps

module simu;
    reg clk, rst;
    reg [7:0] sw;
    wire [7:0] led;
    reg button;
    test cpu(clk, button, sw, led);
    initial begin
        clk = 1;
        button = 1'b0;
        sw = 8'b0100_1110;
        sw[7] = 1;
        #10
        sw[7] = 0;
    end
    initial begin
        forever begin
            #5 clk = ~clk;
            if ($time >= 20000)  $finish;
        end
    end
    initial begin
        forever begin
            #5 button = ~button;
        end
    end
endmodule
