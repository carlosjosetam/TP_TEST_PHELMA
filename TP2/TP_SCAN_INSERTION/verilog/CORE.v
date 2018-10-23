
module CORE ( set_time, alarm, hours, minutes, toggle, CLOCK, resetn, SPEAKER, hr_wire, 
    min_wire, am_pm_wire );
output [13:0] hr_wire;
output [13:0] min_wire;
input  set_time, alarm, hours, minutes, toggle, CLOCK, resetn;
output SPEAKER, am_pm_wire;
    
    wire [10:0] DISPLAY_BUS;

    COMPUTE_BLOCK U1 ( .SET_TIME(set_time), .ALARM(alarm), .HRS(hours), 
        .MINS(minutes), .TOGGLE_SWITCH(toggle), .CLK(CLOCK), .RESETN(resetn), 
        .DISPLAY(DISPLAY_BUS), .SPEAKER_OUT(SPEAKER) );
    CONVERTOR_CKT U3 ( .bin_time(DISPLAY_BUS), .hr_display(hr_wire), .min_display(min_wire), 
        .am_pm_display(am_pm_wire) );
endmodule

