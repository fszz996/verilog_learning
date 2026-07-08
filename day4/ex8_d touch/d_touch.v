module d_touch(
    output reg y,
    input i,
    input clk,
    input set,
    input reset
);
    always @(posedge clk or posedge set or posedge reset ) begin
        if(set == 1)
            y<=1;
        else if(reset == 1)
            y<=0;
        else if(clk==1)
            y<=i;      
    end
endmodule