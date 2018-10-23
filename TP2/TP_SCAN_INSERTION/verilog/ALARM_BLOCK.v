module ALARM_COUNTER (HOURS, MINS, CLK, RESETN, HRS_OUT, MINUTES_OUT, AM_PM_OUT);
input HOURS, MINS, CLK, RESETN;
output [3:0] HRS_OUT;
output [5:0] MINUTES_OUT;
output AM_PM_OUT;

parameter AM=0, PM=1;

reg [3:0] HRS_OUT;
reg [5:0] MINUTES_OUT;
reg AM_PM_OUT;

always @ (posedge CLK or negedge RESETN)
begin

    if (RESETN == 0)
       begin
       HRS_OUT <= 4'd12;
       MINUTES_OUT <= 6'd0;
       AM_PM_OUT <= AM;
       end
    else
       begin
       MINUTES_OUT <= MINUTES_OUT;
       HRS_OUT <= HRS_OUT;
       AM_PM_OUT <= AM_PM_OUT;
   
       if (MINS & !HOURS)
          begin
          if (MINUTES_OUT == 6'd59)
             begin
             MINUTES_OUT <= 6'd0;
             if (HRS_OUT == 4'd12)
                begin
                HRS_OUT <= 4'd1;
                AM_PM_OUT <= !AM_PM_OUT;
         	end
             else
                HRS_OUT <= HRS_OUT + 1'd1;
             end
          else
      	     MINUTES_OUT <= MINUTES_OUT + 1'd1;
          end
       else if (!MINS & HOURS)
          begin
          if (HRS_OUT == 4'd12)
   	     begin
   	     HRS_OUT <= 4'd1;
   	     AM_PM_OUT <= !AM_PM_OUT;
   	     end
          else
   	     HRS_OUT <= HRS_OUT + 1'd1;
          end
       end
end

endmodule


module ALARM_STATE_MACHINE (ALARM_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN, HOURS, MINS);
input ALARM_BUTTON, HOURS_BUTTON, MINUTES_BUTTON, CLK, RESETN;
output HOURS, MINS;

parameter IDLE=0, SET_HOURS=1, SET_MINUTES=2;

reg [1:0] CURRENT_STATE, NEXT_STATE;
reg HOURS, MINS;
reg NEXT_HOURS, NEXT_MINS;
   
always @ (CURRENT_STATE or ALARM_BUTTON or HOURS_BUTTON or MINUTES_BUTTON)
begin
    NEXT_STATE <= CURRENT_STATE;
    NEXT_HOURS <= 0;
    NEXT_MINS <= 0;

    case (CURRENT_STATE) //synopsys full_case parallel_case

    IDLE: begin
	  if (ALARM_BUTTON & HOURS_BUTTON & !MINUTES_BUTTON)
	     begin
	     NEXT_STATE <= SET_HOURS;
	     NEXT_HOURS <= 1;
	     end
	  else if (ALARM_BUTTON & !HOURS_BUTTON & MINUTES_BUTTON)
	     begin
	     NEXT_STATE <= SET_MINUTES;
	     NEXT_MINS <= 1;
	     end
	  else
	     NEXT_STATE <= IDLE;
	  end
    SET_HOURS: begin
          if (ALARM_BUTTON & HOURS_BUTTON & !MINUTES_BUTTON)
             begin
             NEXT_STATE <= SET_HOURS;
             NEXT_HOURS <= 0;
             end
          else
             NEXT_STATE <= IDLE;
          end
    SET_MINUTES: begin
           if (ALARM_BUTTON & !HOURS_BUTTON & MINUTES_BUTTON)
             begin
             NEXT_STATE <= SET_MINUTES;
             NEXT_MINS <= 0;
             end
          else
             NEXT_STATE <= IDLE;
          end
    endcase
end


always @ (posedge CLK or negedge RESETN)
begin
   if (RESETN == 0)
     begin
     CURRENT_STATE <= IDLE;
     HOURS <= 0;
     MINS <= 0;
     end
   else
     begin
     CURRENT_STATE <= NEXT_STATE;
     HOURS <= NEXT_HOURS;
     MINS <= NEXT_MINS;
     end
end

endmodule


module ALARM_BLOCK ( ALARM, HRS, MINS, CLK, RESETN, ENABLE,
                     HRS_OUT, MINS_OUT, AM_PM_OUT,
                     DISPLAY_BUS );

input  ALARM, HRS, MINS, CLK, RESETN, ENABLE;
output [3:0] HRS_OUT; 
output [5:0] MINS_OUT; 
output AM_PM_OUT;
output [10:0] DISPLAY_BUS;

    wire CONNECT1, CONNECT2; 
    reg [10:0] DISPLAY_BUS;

    ALARM_STATE_MACHINE U0 ( .ALARM_BUTTON(ALARM), .HOURS_BUTTON(HRS), 
        .MINUTES_BUTTON(MINS), .CLK(CLK), .RESETN(RESETN), 
        .HOURS(CONNECT1), .MINS(CONNECT2) );

    ALARM_COUNTER U3 ( .HOURS(CONNECT1), .MINS(CONNECT2), .CLK(CLK), 
        .RESETN(RESETN), .HRS_OUT(HRS_OUT), .MINUTES_OUT(MINS_OUT), 
        .AM_PM_OUT(AM_PM_OUT));

    always @ (ENABLE or AM_PM_OUT or HRS_OUT or MINS_OUT) begin
//        if (ENABLE)
            DISPLAY_BUS <= {AM_PM_OUT,HRS_OUT,MINS_OUT};
//        else
//            DISPLAY_BUS <= 11'bz;
    end

endmodule
