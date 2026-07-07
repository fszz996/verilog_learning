module selecter_4to1(
    output y,
    input [1:0] s,
    input [3:0] d
);
    assign y=(~s[1]&~s[0]&d[0])|(~s[1]&s[0]&d[1])|(s[1]&~s[0]&d[2])|(s[1]&s[0]&d[3]);

endmodule