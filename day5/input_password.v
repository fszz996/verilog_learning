module input_password(
    input clk,
    input rst,
    input [3:0] key,
    input key_pass,
    input enter,
    output reg [15:0] password,
    output reg ready
);
    reg [2:0] count;//count4位
    always @(posedge clk)
    begin
        if(rst==1)
        begin
            password <= 16'b0;
            count <= 0;
            ready <= 0;
        end

        else
        begin
            if(key_pass && count < 4)
            begin
                password <= {password[11:0], key};
                count <= count + 1;
                ready <= 0;
            end
            if(enter && count == 4)
            begin
                ready <= 1;
            end
        end
    end
endmodule