module translater(
    output reg [7:0] y,
    input [2:0] i
 );
    integer k;
    always @(*) begin
        y=8'b00000000;
        for (k=0;k<=7 ;k=k+1 ) begin
            if (k==i) begin
                y[k]=1;
            end
        end
    end
endmodule