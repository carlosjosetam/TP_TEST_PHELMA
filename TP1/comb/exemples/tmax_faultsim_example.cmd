#tmax_faultsim_example.cmd


## Model build ##

read_netlist ./sxlib.v
read_netlist ./mux.vhd
run_build_model mux


## Design Rules Check ##

add_pi_constraints 1 vdd
add_pi_constraints 0 vss
run_drc


## mode FAULTS SIMULATION ##

set_patterns -external ./mux_patterns.stil
add_faults -all
set_faults -fault_coverage
run_fault_sim
report_faults -all
quit


