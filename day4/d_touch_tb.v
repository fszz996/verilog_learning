module d_touch_tb();
    reg i,clk,set,reset;
    wire y;

    d_touch uut(
        .i(i),
        .clk(clk),
        .set(set),
        .reset(reset),
        .y(y)
    );

    always #5 clk=~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,d_touch_tb);
        
        i = 0;
        set = 0;
        reset = 0;
        clk = 0;

        #10;
        i = 1;
        #10;
        i = 0;

        #10;
        set = 1;
        #10;
        set = 0;

        #10;
        reset = 1;
        #10;
        reset = 0;

        #20;
        
        $finish;
    end

endmodule