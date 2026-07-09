module top_lock_tb();
    reg clk;
    reg rst;
    reg confirm;
    reg [3:0] scanf;
    reg [3:0] password;
    wire pass;
    wire locked;
    wire finish;

    top_lock uut(
        .clk(clk),
        .rst(rst),
        .confirm(confirm),
        .scanf(scanf),
        .password(password),
        .pass(pass),
        .locked(locked),
        .finish(finish)
    );
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_lock_tb);
        clk = 0;
        rst = 1;
        confirm = 0;
        scanf = 4'b0000;
        password = 4'b1010;

        #10;
        rst = 0;

        #10;

        scanf = 4'b1010;
        confirm = 1;

        #10;

        confirm = 0;

        #10;

        scanf = 4'b1111;
        confirm = 1;

        #10;

        confirm = 0;

        #10;

        confirm = 1;

        #10;

        confirm = 0;

        #10;

        confirm = 1;

        #10;

        confirm = 0;
     
      #500;
        $finish;

    end


endmodule