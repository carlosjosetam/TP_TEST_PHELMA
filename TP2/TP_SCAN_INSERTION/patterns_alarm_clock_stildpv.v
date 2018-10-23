// Verilog STILDPV testbench written by  TetraMAX (TM)  H-2013.03-SP5-i131018_232903 
// Date: Sun Nov 16 16:23:26 2014
// Module tested: CORE

`timescale 1 ns / 1 ns

module CORE_test;
   integer verbose;         // message verbosity level
   integer report_interval; // pattern reporting intervals
   integer diagnostic_msg;  // format miscompares for TetraMAX diagnostics
   parameter NINPUTS = 10, NOUTPUTS = 30;
   // The next two variables hold the current value of the TetraMAX pattern number
   // and vector number, while the simulation is progressing. $monitor or $display these
   // variables, or add them to waveform views, to see these values change with time
   integer pattern_number;
   integer vector_number;

   wire SET_TIME;  reg SET_TIME_REG ;
   wire ALARM;  reg ALARM_REG ;
   wire HOURS;  reg HOURS_REG ;
   wire MINUTES;  reg MINUTES_REG ;
   wire TOGGLE;  reg TOGGLE_REG ;
   wire CLOCK;  reg CLOCK_REG ;
   wire RESETN;  reg RESETN_REG ;
   wire SPEAKER;
   wire AM_PM;
   wire TEST_MODE;  reg TEST_MODE_REG ;
   wire TEST_SE;  reg TEST_SE_REG ;
   wire TEST_SI;  reg TEST_SI_REG ;
   wire [13:0] HR;
   wire [13:0] MIN;

   // map register to wire for DUT inputs and bidis
   assign SET_TIME = SET_TIME_REG ;
   assign ALARM = ALARM_REG ;
   assign HOURS = HOURS_REG ;
   assign MINUTES = MINUTES_REG ;
   assign TOGGLE = TOGGLE_REG ;
   assign CLOCK = CLOCK_REG ;
   assign RESETN = RESETN_REG ;
   assign TEST_MODE = TEST_MODE_REG ;
   assign TEST_SE = TEST_SE_REG ;
   assign TEST_SI = TEST_SI_REG ;

   // instantiate the design into the testbench
   CORE dut (
      .SET_TIME(SET_TIME),
      .ALARM(ALARM),
      .HOURS(HOURS),
      .MINUTES(MINUTES),
      .TOGGLE(TOGGLE),
      .CLOCK(CLOCK),
      .RESETN(RESETN),
      .SPEAKER(SPEAKER),
      .HR({ HR[13], HR[12], HR[11], HR[10], HR[9], HR[8],
          HR[7], HR[6], HR[5], HR[4], HR[3], HR[2], HR[1], HR[0] }),
      .MIN({ MIN[13], MIN[12],
          MIN[11], MIN[10], MIN[9], MIN[8], MIN[7], MIN[6], MIN[5], MIN[4], MIN[3],
          MIN[2], MIN[1], MIN[0] }),
      .AM_PM(AM_PM),
      .TEST_MODE(TEST_MODE),
      .TEST_SE(TEST_SE),
      .TEST_SI(TEST_SI)   );

   // STIL Direct Pattern Validate Access
   initial begin
      //
      // --- establish a default time format for %t
      //
      $timeformat(-9,2," ns",18);
      vector_number = 0;

      //
      // --- default verbosity to 0; use '+define+tmax_msg=N' on verilog compile line to change.
      //
      `ifdef tmax_msg
         verbose = `tmax_msg ;
      `else
         verbose = 0 ;
      `endif

      //
      // --- default pattern reporting interval is every 5 patterns;
      //     use '+define+tmax_rpt=N' on verilog compile line to change.
      //
      `ifdef tmax_rpt
         report_interval = `tmax_rpt ;
      `else
         report_interval = 5 ;
      `endif

      //
      // --- support generating Extened VCD output by using
      //     '+define+tmax_vcde' on verilog compile line.
      //
      `ifdef tmax_vcde
         // extended VCD, see Verilog specification, IEEE Std. 1364-2001 section 18.3
         if (verbose >= 1) $display("// %t : opening Extended VCD output file sim_vcde.vcd", $time);
         $dumpports( dut, "sim_vcde.vcd");
      `endif

      //
      // --- default miscompare messages are not formatted for TetraMAX diagnostics;
      //     use '+define+tmax_diag=N' on verilog compile line to format errors for diagnostics.
      //
      `ifdef tmax_diag
         diagnostic_msg = `tmax_diag ;
      `else
         diagnostic_msg = 0 ;
      `endif

      // '+define+tmax_parallel=N' on the command line overrides default simulation, using parallel load
      //   with N serial vectors at the end of each Shift
      // '+define+tmax_serial=M' on the command line forces M initial serial patterns,
      //   followed by the remainder in parallel (with N serial vectors if tmax_parallel is also specified)

      // +define+tmax_par_force_time on the command line overrides default parallel check/load time
      `ifdef tmax_par_force_time
         $STILDPV_parallel(,,,`tmax_par_force_time);
      `endif

      // TetraMAX parallel-mode simulation required for these patterns
      `ifdef tmax_parallel
         // +define+tmax_serial_timing on the command line overrides default minimal-time for parallel load behavior
         `ifdef tmax_serial_timing
         `else
            $STILDPV_parallel(,,0); // apply minimal time advance for parallel load_unload
            // if tmax_serial_timing is defined, use equivalent serial load_unload time advance
         `endif
         `ifdef tmax_serial
            $STILDPV_parallel(`tmax_parallel,`tmax_serial);
         `else
            $STILDPV_parallel(`tmax_parallel,0);
         `endif
      `else
         `ifdef tmax_serial
            // +define+tmax_serial_timing on the command line overrides default minimal-time for parallel load behavior
            `ifdef tmax_serial_timing
            `else
               $STILDPV_parallel(,,0); // apply minimal time advance for parallel load_unload
               // if tmax_serial_timing is defined, use equivalent serial load_unload time advance
            `endif
            $STILDPV_parallel(0,`tmax_serial);
         `else
            // +define+tmax_serial_timing on the command line overrides default minimal-time for parallel load behavior
            `ifdef tmax_serial_timing
            `else
               $STILDPV_parallel(,,0); // apply minimal time advance for parallel load_unload
               // if tmax_serial_timing is defined, use equivalent serial load_unload time advance
            `endif
            // default parallel mode with 0 serial vectors at end of each Shift.
            $STILDPV_parallel(0,0);
         `endif
      `endif

      if (verbose>3)      $STILDPV_trace(1,1,1,1,1,report_interval,diagnostic_msg); // verbose=4; + trace each Vector
      else if (verbose>2) $STILDPV_trace(1,0,1,1,1,report_interval,diagnostic_msg); // verbose=3; + trace labels
      else if (verbose>1) $STILDPV_trace(0,0,1,1,1,report_interval,diagnostic_msg); // verbose=2; + trace WFT-changes
      else if (verbose>0) $STILDPV_trace(0,0,1,0,1,report_interval,diagnostic_msg); // verbose=1; + trace proc/macro entries
      else                $STILDPV_trace(0,0,0,0,0,report_interval,diagnostic_msg); // verbose=0; only pattern-interval

      $STILDPV_setup( "patterns_alarm_clock.v",,,"CORE_test.dut" );
      while ( !$STILDPV_done()) #($STILDPV_run( pattern_number, vector_number ));
      $display("Time %t: STIL simulation data completed.",$time);
      $finish; // comment this out if you terminate the simulation from other activities
   end

   // STIL Direct Pattern Validate Trace Options
   // The STILDPV_trace() function takes '1' to enable a trace and '0' to disable.
   // Unspecified arguments maintain their current state. Tracing may be changed at any time.
   // The following arguments control tracing of:
   // 1st argument: enable or disable tracing of all STIL labels
   // 2nd argument: enable or disable tracing of each STIL Vector and current Vector count
   // 3rd argument: enable or disable tracing of each additional Thread (new Pattern)
   // 4th argument: enable or disable tracing of each WaveformTable change
   // 5th argument: enable or disable tracing of each Procedure or Macro entry
   // 6th argument: interval to print starting pattern messages; 0 to disable
   // For example, a separate initial block may be used to control these options
   // (uncomment and change time values to use):
   // initial begin
   //    #800000 $STILDPV_trace(1,1);
   //    #600000 $STILDPV_trace(,0);
   // Additional calls to $STILDPV_parallel() may also be defined to change parallel/serial
   // operation during simulation. Any additional calls need a # time value.
   // 1st integer is number of serial (flat) cycles to simulate at end of each shift
   // 2nd integer is TetraMAX pattern number (starting at zero) to start parallel load
   // 3rd optional value '1' will advance time during the load_unload the same as a serial
   //     shift operation (with no events during that time), '0' will advance minimal time
   //     (1 shift vector) during the parallel load_unload.
   // For example,
   //    #8000 $STILDPV_parallel( 2,10 );
   // end // of initial block with additional trace/parallel options
endmodule
