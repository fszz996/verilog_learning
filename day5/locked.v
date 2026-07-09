module locker_locked(
    input [1:0] error_count,
    output locked
);

assign locked = (error_count >= 3);

endmodule