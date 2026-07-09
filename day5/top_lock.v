module top_lock(
    input clk,
    input rst,
    input [15:0] key,
    input key_pass,
    input enter,
    input set,
    output pass,locked,finish
    );

    wire [1:0] error_count;
    wire clear_error;
    wire [15:0] password;
    wire [15:0] input_pwd;
    wire ready;

    assign clear_error = finish;

    input_password uinput(
    .clk(clk),
    .rst(rst),
    .key(key),
    .key_pass(key_pass),
    .enter(enter),
    .password(input_pwd),
    .ready(ready)
    );

   password_store ustore(
    .clk(clk),
    .rst(rst),
    .set(set),
    .scanf(input_pwd),
    .password(password)
    );

    locker_compare ucompare(
    .clk(clk),
    .rst(rst),
    .scanf(input_pwd),
    .password(password),
    .confirm(ready),
    .pass(pass),
    .error_count(error_count),
    .clear_error(finish)
);

    locker_locked ulocked(
    .error_count(error_count),
    .locked(locked)
    );

    lock_time utimer(
    .clk(clk),
    .rst(rst),
    .start(locked),
    .finish(finish)
    );
endmodule