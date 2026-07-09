module top_lock(
    input clk,
    input rst,
    input confirm,
    input [3:0] scanf,
    input set,
    output pass,locked,finish
    );

    wire [1:0] error_count;
    wire clear_error;
    wire [3:0] password;

    assign clear_error = finish;

    password_store ustore(
        .clk(clk),
        .rst(rst),
        .set(set),
        .scanf(scanf),
        .password(password)
    );

    locker_compare ucompare(
    .clk(clk),
    .rst(rst),
    .scanf(scanf),
    .password(password),
    .confirm(confirm),
    .pass(pass),
    .error_count(error_count),
    .clear_error(clear_error)
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