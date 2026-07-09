module locker_compare(
    input [3:0] scanf,
    output reg pass,
    input confirm,
    input [3:0] password,
    input clk,
    output reg [1:0] error_count,
    input rst,
    input clear_error
);
    always @(posedge clk) begin
      if(rst == 1)begin
        error_count <= 0;
        pass <= 0;
      end
       else if(clear_error==1)begin
        error_count <= 0;
        pass <= 0;
      end
      else begin
      if (confirm == 1) begin
        if (scanf == password) begin
            pass<=1;
            error_count <= 0;
        end    
        else begin
          pass<=0;
          error_count<=error_count+1;
        end 
      end
      else
        pass <= 0;
      end
    end
endmodule