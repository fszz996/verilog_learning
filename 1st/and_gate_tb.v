module and_gate_tb();
    reg a;
    reg b;

    wire y;

    and_gate uut(
    .x(a),
    .c(b),
    .y(y)
);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, and_gate_tb);
        a=0;
        b=0;
        
        #10

        a=1;
        b=1;

        #10

        a=1;
        b=0;

        #10;
    end
endmodule

