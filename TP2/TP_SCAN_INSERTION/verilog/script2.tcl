gui_start
read_file -format verilog {/tp/xph3sei/xph3seilan/TP_TEST/TP2/exo2/verilog/ALARM_SM_2.v}
create_clock -name "clk" -period 10 -waveform { 0 5  }  { CLOCK }
set_max_area 0
set_scan_configuration  -style multiplexed_flip_flop
set_scan_configuration -replace false -chain_count 1
set test_default_period 100
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 40
set test_stil_netlist_format {verilog}
set_dft_signal -view existing_dft -port "CLOCK" -type ScanClock -timing [list 45 55]
set_dft_signal -view existing_dft -type Reset -port RESETN -active_state 0
compile -scan
create_test_protocol
dft_drc -ver
preview_dft
insert_dft
read_file -format verilog {/tp/xph3sei/xph3seilan/TP_TEST/TP2/exo2/verilog/ALARM_BLOCK.v /tp/xph3sei/xph3seilan/TP_TEST/TP2/exo2/verilog/CLOCK_GEN.v /tp/xph3sei/xph3seilan/TP_TEST/TP2/exo2/verilog/COMPARATOR.v /tp/xph3sei/xph3seilan/TP_TEST/TP2/exo2/verilog/COMPUTE_BLOCK.v /tp/xph3sei/xph3seilan/TP_TEST/TP2/exo2/verilog/TIME_BLOCK.v}
current_design COMPUTE_BLOCK
elaborate COMPUTE_BLOCK -architecture verilog -library DEFAULT
analyze -library WORK -format verilog {/tp/xph3sei/xph3seilan/TP_TEST/TP2/exo2/verilog/TIME_BLOCK.v /tp/xph3sei/xph3seilan/TP_TEST/TP2/exo2/verilog/COMPUTE_BLOCK.v /tp/xph3sei/xph3seilan/TP_TEST/TP2/exo2/verilog/COMPARATOR.v /tp/xph3sei/xph3seilan/TP_TEST/TP2/exo2/verilog/CLOCK_GEN.v /tp/xph3sei/xph3seilan/TP_TEST/TP2/exo2/verilog/ALARM_BLOCK.v}
elaborate COMPUTE_BLOCK -architecture verilog -library DEFAULT
uplevel #0 check_design
set_max_area 0
set_dont_touch [get_cells "U5"]
set_scan_configuration  -style multiplexed_flip_flop
set_scan_configuration -replace false -chain_count 1
set test_default_period 100
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 40
set test_stil_netlist_format {verilog}
set_dft_signal -view existing_dft -port "CLK" -type ScanClock -timing [list 45 55]
set_dft_signal -view existing_dft -type Reset -port RESETN -active_state 0
create_clock -name "clk" -period 10 -waveform { 0 5  }  { U7/INT_CLK }
set_max_area 0
set_dft_configuration -fix_clock enable -fix_reset enable
compile -scan
create_test_protocol
dft_drc -ver
preview_dft -test_points all
insert_dft
set_test_hold 1 test_mode
set_dft_signal  -test_mode 1
set_dft_signal  -type test_mode 1
remove_attribute U5 dont_touch
set_dont_touch [get_cells "U5"]
remove_attribute [get_cells "U5"] dont_touch
preview_dft -test_points all
insert_dft