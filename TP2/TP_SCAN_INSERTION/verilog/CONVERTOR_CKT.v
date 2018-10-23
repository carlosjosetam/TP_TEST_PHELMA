
module HOURS_FILTER (TENS_DIGIT_HOURS_IN, TENS_DIGIT_HOURS_OUT);
input  [6:0] TENS_DIGIT_HOURS_IN;
output [6:0] TENS_DIGIT_HOURS_OUT;

reg [6:0] TENS_DIGIT_HOURS_OUT;

always @ (TENS_DIGIT_HOURS_IN)
   if (TENS_DIGIT_HOURS_IN == 7'b1111110)
      TENS_DIGIT_HOURS_OUT = 7'b0000000;
   else
      TENS_DIGIT_HOURS_OUT = TENS_DIGIT_HOURS_IN;

endmodule
           
module CONVERTOR_CKT ( bin_time, hr_display, min_display, am_pm_display ); 

input  [10:0]bin_time; 
output [13:0]hr_display, min_display;
output am_pm_display;
wire[6:0] connect14 ; 

    assign am_pm_display = ~bin_time[10];

    CONVERTOR U7 ( .T0(1'b0), .T1(1'b0), .T2(bin_time[9] ), 
      .T3(bin_time[8] ), .T4(bin_time[7] ), .T5(bin_time[6] ), 
      .A0(connect14[6] ), .B0(connect14[5] ), .C0(connect14[4] ), 
      .D0(connect14[3] ), .E0(connect14[2] ), .F0(connect14[1] ), 
      .G0(connect14[0] ), .A1(hr_display[6] ), .B1(hr_display[5] ), 
      .C1(hr_display[4] ), .D1(hr_display[3] ), .E1(hr_display[2] ), 
      .F1(hr_display[1] ), .G1(hr_display[0] ) );

    CONVERTOR U8 ( .T0(bin_time[5] ), .T1(bin_time[4] ), 
      .T2(bin_time[3] ), .T3(bin_time[2] ), .T4(bin_time[1] ), 
      .T5(bin_time[0] ), .A0(min_display[13] ), .B0(min_display[12] ), 
      .C0(min_display[11] ), .D0(min_display[10] ), .E0(min_display[9] ), 
      .F0(min_display[8] ), .G0(min_display[7] ), .A1(min_display[6] ), 
      .B1(min_display[5] ), .C1(min_display[4] ), .D1(min_display[3] ), 
      .E1(min_display[2] ), .F1(min_display[1] ), .G1(min_display[0] ) );

    HOURS_FILTER U9 ( .TENS_DIGIT_HOURS_IN(connect14),
         .TENS_DIGIT_HOURS_OUT(hr_display[13:7]));  
endmodule

