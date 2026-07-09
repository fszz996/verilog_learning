module locker_compare(
    input [15:0] scanf,
    output reg pass,
    input confirm,
    input [15:0] password,
    input clk,
    output reg [1:0] error_count,
    input rst,
    input clear_error,
    input locked
);
    always @(posedge clk)
  begin

      if(rst)
      begin
          error_count <= 0;
          pass <= 0;
      end

      else if(clear_error)
      begin
          error_count <= 0;
          pass <= 0;
      end
      else
      begin
          pass <= 0;
          if(confirm && !locked)
          begin
              if(scanf == password)
              begin
                  pass <= 1;
                  error_count <= 0;
              end
              else
              begin
                  if(error_count < 3)
                      error_count <= error_count + 1;
              end
          end
      end
  end
endmodule