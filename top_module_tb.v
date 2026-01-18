`timescale 1ns/1ps
module top_module_tb;

    reg  [31:0] in;
    wire [31:0] out;

    top_module DUT (.in(in), .out(out));

    initial begin

        in = 32'hAABBCCDD;
        #10;
        $display("IN = %h, OUT = %h", in, out);
        // Expected: DDCCBBAA

        // Test case 2: Incrementing bytes
        in = 32'h01020304;
        #10;
        $display("IN = %h, OUT = %h", in, out);
        // Expected: 04030201

        // Test case 3: All zeros
        in = 32'h00000000;
        #10;
        $display("IN = %h, OUT = %h", in, out);

        // Test case 4: All ones
        in = 32'hFFFFFFFF;
        #10;
        $display("IN = %h, OUT = %h", in, out);

        // Test case 5: Random value
        in = 32'hDEADBEEF;
        #10;
        $display("IN = %h, OUT = %h", in, out);
        // Expected: EFBEADDE

        $finish;
    end

endmodule
