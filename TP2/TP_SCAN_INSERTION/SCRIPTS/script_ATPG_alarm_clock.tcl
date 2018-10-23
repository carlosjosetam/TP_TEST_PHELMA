read_netlist /tp/xph3sei/xph3seilan/TP_TEST/TP2/TP_SCAN_INSERTION/corelib_pour_ATPG.v -library -master_module -delete -verbose
read_netlist /tp/xph3sei/xph3seilan/TP_TEST/TP2/TP_SCAN_INSERTION/alarm_clock.v
set_build -merge mux_from_gates
run_build_model CORE
set_drc /tp/xph3sei/xph3seilan/TP_TEST/TP2/TP_SCAN_INSERTION/alarm_clock.spf
run_drc
set_atpg -capture_cycles 9 -full_seq_atpg -full_seq_merge { low } -- pb avec cette commande, la faire par les menus
remove_faults -all
set_faults -model transition
add_faults -all
run_atpg full_sequential_only
write_patterns patterns_alarm_clock.v -internal -format stil -cycle_count -nopatinfo -parallel 0 -cellnames parallel
write_testbench -input /tp/xph3sei/xph3seilan/TP_TEST/TP2/TP_SCAN_INSERTION/patterns_alarm_clock.v -output patterns.v

