module jk_touch_tb();
    reg j,k,clk,rst;
    wire q,qn;

    jk_touch uut(
        .j(j),
        .clk(clk),
        .rst(rst),
        .k(k),
        .q(q),
        .qn(qn)
    );

    always #5 clk=~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,jk_touch_tb);
        
        j = 0;
        k = 0;
        rst = 1;
        clk = 0;
        #10;
        rst=0;

        #10;
        j = 1;
        k = 0;

        #10;
        j = 0;
        k = 1;

        #10;
        j = 1;
        k = 1;

        #30;
        rst = 1;
        #10;
        rst = 0;

        #20;
        
        $finish;
    end
endmodule