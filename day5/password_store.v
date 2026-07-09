module password_store(
    input clk,
    input rst,
    input set,
    input [15:0] scanf,
    output reg [15:0] password
);


always @(posedge clk)
    begin
        if(rst==1)
        begin
            password <= 16'b0000000000000000;
        end

        else if(set==1)
        begin
            password <= scanf;
        end
    end
endmodule