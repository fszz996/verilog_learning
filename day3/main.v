module main(
    input [2:0] i,
    output [1:0] y
);
    wire [7:0] d;
    translater uut(
        .y(d),
        .i(i)
    );

    assign y[1]=d[5]|d[6]|d[7];
    assign y[0]=d[3]|d[6]|d[7];
endmodule