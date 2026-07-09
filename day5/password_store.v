module password_store(
    input clk,
    input rst,
    input set,
    input [3:0] scanf,
    output reg [3:0] password
);


always @(posedge clk)
    begin
        if(rst==1)
        begin
            password <= 4'b0000;
        end

        else if(set==1)
        begin
            password <= scanf;
        end
    end
endmodule