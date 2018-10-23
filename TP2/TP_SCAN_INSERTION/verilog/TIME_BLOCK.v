module TIME_COUNTER (HOURS, MINS, SECS, CLK, RESETN, HOURS_OUT, MINUTES_OUT, AM_PM_OUT);
input HOURS, MINS, SECS, CLK, RESETN;
output [3:0] HOURS_OUT;
output [5:0] MINUTES_OUT;
output AM_PM_OUT;

parameter AM=0, PM=1;

reg [3:0] HOURS_OUT;
reg [5:0] MINUTES_OUT;
reg [5:0] CURRENT_SECS;
reg AM_PM_OUT;

always @ (posedge CLK or negedge RESETN)
begin
   
    if (RESETN == 0)
       begin
       HOURS_OUT <= 4'd12;
       MINUTES_OUT <= 6'd0;
       AM_PM_OUT <= AM;
       CURRENT_SECS <= 6'd0;
       end
    else
       begin
       HOURS_OUT <= HOURS_OUT;
       MINUTES_OUT <= MINUTES_OUT;
       AM_PM_OUT <= AM_PM_OUT;
       CURRENT_SECS <= CURRENT_SECS;
   
       if (SECS & !MINS & !HOURS)
          begin
          if (CURRENT_SECS == 6'd59)
      	     begin
   	     CURRENT_SECS <= 6'd0;
   	     if (MINUTES_OUT == 6'd59)
                begin
                MINUTES_OUT <= 6'd0;
                if (HOURS_OUT == 4'd12)
                   begin
                   HOURS_OUT <= 4'd1;
                   AM_PM_OUT <= !AM_PM_OUT;
                   end
                else
                   HOURS_OUT <= HOURS_OUT + 1'd1;
                end
   	     else
   	        MINUTES_OUT <= MINUTES_OUT + 1'd1;
   	     end
          else
   	     CURRENT_SECS <= CURRENT_SECS + 1'd1;
          end
       else if (!SECS & MINS & !HOURS)
          begin
          CURRENT_SECS <= 6'd0;
          if (MINUTES_OUT == 6'd59)
      	     begin
             MINUTES_OUT <= 6'd0;
             if (HOURS_OUT == 4'd12)
                begin
                HOURS_OUT <= 4'd1;
                AM_PM_OUT <= !AM_PM_OUT;
                end
             else
                HOURS_OUT <= HOURS_OUT + 1'd1;
             end
          else
      	     MINUTES_OUT <= MINUTES_OUT + 1'd1;
          end
       else if (!SECS & !MINS & HOURS)
          begin
          CURRENT_SECS <= 6'd0;	
          if (HOURS_OUT == 4'd12)
             begin
             HOURS_OUT <= 4'd1;
             AM_PM_OUT <= !AM_PM_OUT;
             end
          else
             HOURS_OUT <= HOURS_OUT + 1'd1;
          end
       end          
end

endmodule


module TIME_STATE_MACHINE (TIME_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN, SECS, HOURS, MINS);
input TIME_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN;
output SECS, HOURS, MINS;

parameter COUNT_TIME=0, SET_HOURS=1, SET_MINUTES=2;

reg [1:0] CURRENT_STATE, NEXT_STATE;
reg SECS, HOURS, MINS;
reg NEXT_SECS, NEXT_HOURS, NEXT_MINS;
	
always @ (CURRENT_STATE or TIME_BUTTON or HOURS_BUTTON or MINUTES_BUTTON)
begin
    NEXT_STATE <= CURRENT_STATE;
    NEXT_SECS <= 0;
    NEXT_HOURS <= 0;
    NEXT_MINS <= 0;

    case (CURRENT_STATE) //synopsys full_case parallel_case

    COUNT_TIME: begin
	if (TIME_BUTTON & HOURS_BUTTON & !MINUTES_BUTTON)
	   begin
	   NEXT_STATE <= SET_HOURS;
	   NEXT_HOURS <= 1;
	   end
	else if (TIME_BUTTON & !HOURS_BUTTON & MINUTES_BUTTON) 
	   begin
	   NEXT_STATE <= SET_MINUTES;
	   NEXT_MINS <= 1;
	   end
	else
	   begin
	   NEXT_STATE <= COUNT_TIME;
	   NEXT_SECS <= 1;
	   end
	end
    SET_HOURS: begin
	if (TIME_BUTTON & HOURS_BUTTON & !MINUTES_BUTTON)
	   begin
	   NEXT_STATE <= SET_HOURS;
	   NEXT_HOURS <= 0;
	   end
	else
	   begin
	   NEXT_STATE <= COUNT_TIME;
	   NEXT_SECS <= 1;
	   end
	end
    SET_MINUTES: begin
	 if (TIME_BUTTON & !HOURS_BUTTON & MINUTES_BUTTON)
	   begin
	   NEXT_STATE <= SET_MINUTES;
	   NEXT_MINS <= 0;
	   end
	else
	   begin
	   NEXT_STATE <= COUNT_TIME;
	   NEXT_SECS <= 1;
	   end
	end
    endcase
end

always @ (posedge CLK or negedge RESETN)
begin
   if (RESETN == 0)
      begin	
      CURRENT_STATE <= COUNT_TIME;
      SECS <= 0;
      HOURS <= 0;
      MINS <= 0;
      end
   else
      begin
      CURRENT_STATE <= NEXT_STATE;
      SECS <= NEXT_SECS;
      HOURS <= NEXT_HOURS;
      MINS <= NEXT_MINS;
      end
end

endmodule


module TIME_BLOCK ( SET_TIME, HRS, MINS, CLK, RESETN, ENABLE,
                    HRS_OUT, MINS_OUT, AM_PM_OUT,
                    DISPLAY_BUS );

input  SET_TIME, HRS, MINS, CLK, RESETN, ENABLE;
output [3:0] HRS_OUT;
output [5:0] MINS_OUT;
output  AM_PM_OUT;
output [10:0] DISPLAY_BUS;

    wire CONNECT3, CONNECT4, CONNECT5;
    reg [10:0] DISPLAY_BUS;
    reg AM_PM_BUS;
    
    TIME_STATE_MACHINE U1 ( .TIME_BUTTON(SET_TIME), .HOURS_BUTTON(HRS), 
        .MINUTES_BUTTON(MINS), .CLK(CLK), .RESETN(RESETN), 
        .SECS(CONNECT5), .HOURS(CONNECT3), .MINS(CONNECT4) );
    TIME_COUNTER U2 ( .SECS(CONNECT5), .HOURS(CONNECT3), .MINS(CONNECT4), 
        .CLK(CLK), .RESETN(RESETN), .HOURS_OUT(HRS_OUT),
        .MINUTES_OUT(MINS_OUT) , .AM_PM_OUT(AM_PM_OUT) );

    always @ (ENABLE or AM_PM_OUT or HRS_OUT or MINS_OUT) begin
//        if (ENABLE)
            DISPLAY_BUS <= {AM_PM_OUT,HRS_OUT,MINS_OUT};
//        else
//            DISPLAY_BUS <= 11'bz;
    end

   
endmodule
