module input_password(
    input clk,
    input rst,
    input [3:0] key,
    input key_pass,
    input enter,
    input clear,
    output reg [15:0] password,
    output reg ready
);
    reg [2:0] count;
    always @(posedge clk)
    begin
        if(rst)
        begin
            password <= 16'b0;
            count <= 0;
            ready <= 0;
        end

        else if(clear)
        begin
            password <= 16'b0;
            count <= 0;
            ready <= 0;
        end

        else
        begin
            ready <= 0;
            if(key_pass && count < 4)
            begin
                password <= {password[11:0], key};
                count <= count + 1;
            end
            if(enter && count == 4)
            begin
                ready <= 1;
            end
        end
    end
endmodule