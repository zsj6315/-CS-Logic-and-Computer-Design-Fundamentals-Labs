# program.tcl

open_hw_manager
connect_hw_server

# find
set hw_targets [get_hw_targets]
if {[llength $hw_targets] == 0} {
    puts "ERROR: No JTAG cables detected!"
    exit
}

# check the first
set hw_target [lindex $hw_targets 0]
current_hw_target $hw_target
open_hw_target

# get device
set hw_devices [get_hw_devices]
if {[llength $hw_devices] == 0} {
    puts "ERROR: No FPGA devices found on the JTAG chain!"
    exit
}
set hw_device [lindex $hw_devices 0] ;

# copy .bit path
set bitstream_file "vivado_project/fpga_project.runs/impl_1/top.bit"
if {![file exists $bitstream_file]} {
    puts "ERROR: Bitstream file not found: $bitstream_file"
    exit
}

# program
puts "Programming device: $hw_device"
set_property PROGRAM.FILE $bitstream_file $hw_device
program_hw_devices $hw_device

close_hw_target
disconnect_hw_server
close_hw
exit