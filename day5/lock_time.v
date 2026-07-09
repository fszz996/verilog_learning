module lock_time(
    output reg finish,

    input clk,
    input rst,
    input start
);
    reg [28:0] count;

    always @(posedge clk)
    begin
        if(rst==1)
        begin
            count <= 0;
            finish <= 0;
        end
        else if(start==1)
        begin
            if(count < 10)
            begin
                count <= count + 1;
                finish <= 0;
            end
            else
            begin
                count <= 0;
                finish <= 1;
            end
        end
        else
        begin
            count <= 0;
            finish <= 0;
        end
    end
endmodule