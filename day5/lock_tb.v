module lock_tb();

    reg clk;
    reg rst;

    reg [3:0] key;
    reg key_pass;
    reg enter;
    reg set;


    wire pass;
    wire locked;
    wire finish;


    top_lock uut(
        .clk(clk),
        .rst(rst),

        .key(key),
        .key_pass(key_pass),
        .enter(enter),
        .set(set),

        .pass(pass),
        .locked(locked),
        .finish(finish)
    );


    // 时钟
    always #5 clk = ~clk;



    // 输入一个数字
    task input_num;
        input [3:0] num;
        begin
            key = num;
            key_pass = 1;

            #10;

            key_pass = 0;

            #10;
        end
    endtask



    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0,lock_tb);



        // 初始化

        clk = 0;

        rst = 1;

        key = 0;
        key_pass = 0;
        enter = 0;
        set = 0;



        //复位

        #20;

        rst = 0;



        //--------------------------------
        // 设置密码 1234
        //--------------------------------

        input_num(4'b0001);
        input_num(4'b0010);
        input_num(4'b0011);
        input_num(4'b0100);


        //确认设置

        enter = 1;
        #10;

        enter = 0;


        //保存密码

        set = 1;
        #10;

        set = 0;



        //--------------------------------
        // 正确密码测试1234
        //--------------------------------

        input_num(1);
        input_num(2);
        input_num(3);
        input_num(4);


        enter = 1;

        #10;

        enter = 0;


        #50;



        //--------------------------------
        // 错误密码1111 三次
        //--------------------------------


        input_num(1);
        input_num(1);
        input_num(1);
        input_num(1);


        enter = 1;
        #10;
        enter = 0;


        #20;



        input_num(1);
        input_num(1);
        input_num(1);
        input_num(1);


        enter = 1;
        #10;
        enter = 0;


        #20;



        input_num(1);
        input_num(1);
        input_num(1);
        input_num(1);


        enter = 1;
        #10;
        enter = 0;



        //等待锁定计时

        #500;



        $finish;

    end


endmodule