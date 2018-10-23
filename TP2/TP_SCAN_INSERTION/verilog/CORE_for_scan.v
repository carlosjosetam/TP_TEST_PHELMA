
module CORE ( set_time, alarm, hours, minutes, toggle, CLOCK, resetn, SPEAKER, hr_wire, 
    min_wire, am_pm_wire, TEST_MODE, TEST_SE, TEST_SI );
output [13:0] hr_wire;
output [13:0] min_wire;
input  set_time, alarm, hours, minutes, toggle, CLOCK, resetn;
input TEST_MODE, TEST_SE, TEST_SI ;
output SPEAKER, am_pm_wire;
    wire [10:0] DISPLAY_BUS;

    COMPUTE_BLOCK U1 ( .SET_TIME(set_time), .ALARM(alarm), .HRS(hours), 
        .MINS(minutes), .TOGGLE_SWITCH(toggle), .CLK(CLOCK), .RESETN(resetn), 
        .DISPLAY(DISPLAY_BUS), .SPEAKER_OUT(SPEAKER), .TM_FIX(TEST_MODE), .test_si(TEST_SI), .test_se(TEST_SE) );
    CONVERTOR_CKT U3 ( .bin_time(DISPLAY_BUS), .hr_display(hr_wire), .min_display(min_wire), 
        .am_pm_display(am_pm_wire) );
endmodule

