module selecter_tb();

    reg [1:0] s;
    reg [3:0] d;
    wire y;

    integer k,j;

    selecter_4to1 uut(
        .s(s),
        .d(d),
        .y(y)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, selecter_tb);

        for(k=0;k<4;k=k+1) begin
            for(j=0;j<16;j=j+1) begin

                s=k;
                d=j;

                #10;

            end
        end

        $finish;
    end

endmodule