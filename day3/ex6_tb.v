module ex6_tb();
    reg [2:0] i;
    wire [1:0] y;
    integer k;

    main uut(
        .i(i),
        .y(y)
    );

     initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0,ex6_tb);
        
        for(k=0;k<8;k=k+1)begin
          i=k;
          #10;
        end
        $finish;
    end
endmodule