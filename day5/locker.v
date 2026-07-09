module locker_compare(
    input [3:0] scanf,
    output reg pass
);
    always @(*) begin
      if (scanf == password) begin
        pass = 1;
      end
      else
        pass = 0;
    end
endmodule