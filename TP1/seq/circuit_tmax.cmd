read_netlist sxlib.v
read_netlist circuit_seq_scan.vhd
run_build_model fsm
# set_drc circuit_seq.spf
run_drc circuit_seq_scan.spf

add_faults -all
set_faults -fault_coverage
run_atpg basic_scan_only
#write_patterns circuit_seq_scan.stil -internal -format stil  -replace

##set_atpg -capture_cycles 2

#run_atpg fast_sequential_only
#run_atpg basic_scan_only
#run_atpg basic_scan_only
