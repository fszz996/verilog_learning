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



    // 10ns周期时钟
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



    // 输入四位密码
    task input_password;
        input [15:0] pwd;

        begin

            input_num(pwd[15:12]);
            input_num(pwd[11:8]);
            input_num(pwd[7:4]);
            input_num(pwd[3:0]);

        end

    endtask



    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0,lock_tb);



        clk = 0;

        rst = 1;

        key = 0;
        key_pass = 0;
        enter = 0;
        set = 0;



        //========================
        // 复位
        //========================

        #20;

        rst = 0;



        //========================
        // 设置密码1234
        //========================

        $display("set password 1234");


        input_password(16'h1234);


        enter = 1;
        #10;
        enter = 0;


        set = 1;
        #10;
        set = 0;



        #50;



        //========================
        // 正确密码测试
        //========================

        $display("correct password");


        input_password(16'h1234);


        enter = 1;
        #10;
        enter = 0;


        #50;



        //========================
        // 错误密码第一次
        //========================

        $display("wrong password 1");


        input_password(16'h1111);


        enter = 1;
        #10;
        enter = 0;


        #50;



        //========================
        // 错误密码第二次
        //========================

        $display("wrong password 2");


        input_password(16'h1111);


        enter = 1;
        #10;
        enter = 0;


        #50;



        //========================
        // 错误密码第三次
        //========================

        $display("wrong password 3");


        input_password(16'h1111);


        enter = 1;
        #10;
        enter = 0;



        //等待锁定计时
        #600;



        //========================
        // 解锁后再次测试
        //========================


        $display("test again");


        input_password(16'h1234);


        enter = 1;
        #10;
        enter = 0;


        #100;



        $finish;

    end


endmodule