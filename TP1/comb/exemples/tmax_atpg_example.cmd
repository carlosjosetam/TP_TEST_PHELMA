#tmax_atpg_example.cmd


## Model build ##

read_netlist ./sxlib.v
read_netlist ./mux.vhd
run_build_model mux


## Design Rules Check ##

add_pi_constraints 1 vdd
add_pi_constraints 0 vss
run_drc


## mode ATPG ##

add_faults -all
set_faults -fault_coverage
run_atpg 
write_patterns mux_patterns.stil -internal -format stil -replace
report_faults -all
quit
