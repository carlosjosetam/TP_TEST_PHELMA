module ALARM_SM_2(COMPARE_IN,TOGGLE_ON,CLOCK,RESETN,RING);
input COMPARE_IN,TOGGLE_ON,CLOCK,RESETN;
output RING;
reg RING,CURRENT_STATE,NEXT_STATE;

parameter IDLE=0, ACTIVATE=1;
        always @ (CURRENT_STATE or COMPARE_IN or TOGGLE_ON) begin

	case (CURRENT_STATE) // synopsys parallel_case full_case

	   IDLE:        begin
			RING <= 0;
			if (COMPARE_IN && TOGGLE_ON) 
				NEXT_STATE <= ACTIVATE;
			else
				NEXT_STATE <= IDLE;
			end

	  ACTIVATE:     begin
			RING <= 1;
			if (!TOGGLE_ON ) 
				NEXT_STATE <= IDLE;
			else
				NEXT_STATE <= ACTIVATE;
			end 
	endcase
	end

        always @ (posedge CLOCK or negedge RESETN) begin
           if (RESETN == 0)
              CURRENT_STATE <= IDLE;
           else
	      CURRENT_STATE <= NEXT_STATE;
	end 
endmodule 
