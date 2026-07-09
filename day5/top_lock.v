module top_lock(
    input clk,
    input rst,
    input confirm,
    input [3:0] scanf,
    input [3:0] password,
    output pass,locked,finish
    );

    wire [1:0] error_count;
    wire clear_error;

    assign clear_error = finish;

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