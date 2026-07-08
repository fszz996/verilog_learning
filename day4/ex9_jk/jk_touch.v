module jk_touch(
    output reg q,
    output qn,
    input j,k,clk,rst
);
    assign qn = ~q;
    
    always @(posedge clk or posedge rst ) begin
        if(rst==1)
            q<=0;
        else if(j==1 && k==0)begin
          q<=1;
        end
        else if (j==0 && k==1) begin
            q<=0;
        end
        else if (j==1 && k==1) begin
            q<=~q;
        end

    end
endmodule