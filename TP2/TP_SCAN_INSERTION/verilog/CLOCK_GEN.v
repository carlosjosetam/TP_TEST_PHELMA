module CLOCK_GEN ( CLK, RESETN, INT_CLK );

input  CLK;
input RESETN;
output INT_CLK;

reg COUNT;
reg INT_CLK;

always @ (posedge CLK or negedge RESETN)
begin
    if (RESETN == 0)
      begin
      COUNT <= 0;
      INT_CLK <= 0;
      end
    else if (COUNT == 1) 
      begin
      COUNT <= 0;
      INT_CLK <= 1;
      end
    else
      begin
      COUNT <= 1;
      INT_CLK <= 0;
      end
end

endmodule
