module codinger_tb();
    reg[7:0] i;
    wire v;
    wire [2:0] y;
    integer k;

    codinger_83 uut(
    .i(i),
    .y(y),
    .v(v)
);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, codinger_tb);
        
        i=8'b00000000; #10;
        for(k=0;k<=256;k=k+1)begin
                i=k;
                #5;
        end
        $finish;
    end
endmodule
