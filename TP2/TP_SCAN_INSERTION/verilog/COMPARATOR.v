module COMPARATOR(ALARM_HRS,TIME_HRS,ALARM_MINS,TIME_MINS,ALARM_AM_PM, 
                  TIME_AM_PM,RINGER);
input [3:0] ALARM_HRS,TIME_HRS;
input [5:0] ALARM_MINS,TIME_MINS;
input ALARM_AM_PM, TIME_AM_PM;
output RINGER;
reg RINGER;

     always @ (ALARM_HRS or TIME_HRS or ALARM_MINS or TIME_MINS or 
               ALARM_AM_PM or TIME_AM_PM)  begin
	    RINGER <= 1'b0;
	if ((ALARM_HRS == TIME_HRS) &&  (ALARM_MINS == TIME_MINS) && 
           (ALARM_AM_PM == TIME_AM_PM)) 
		RINGER <= 1'b1;
	 end 

endmodule
