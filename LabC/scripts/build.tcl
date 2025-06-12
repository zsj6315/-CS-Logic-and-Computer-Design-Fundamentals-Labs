# build.tcl

# 1. create project

create_project -help

create_project -force -name fpga_project -dir vivado_project -part xc7k160t
set_property SEVERITY {Warning} [get_drc_checks NSTD-1]
set_property SEVERITY {Warning} [get_drc_checks UCIO-1]

# 2. add files
add_files [list \
  src/clkdiv.v \
  src/createnumber.v \
  src/display.v \
  src/MUX41.v \
  src/MyMC14495.v \
  src/operations.v \
  src/top.v \
]

# 3. constraints
add_files -fileset constrs_1 constraints/fpga.xdc
# get_files -filter {FILE_TYPE == "XDC"}

# 4. syn & imp
launch_runs synth_1 -jobs 4
wait_on_run synth_1

launch_runs impl_1 -jobs 4
wait_on_run impl_1

open_run impl_1
puts "\nChecking Port Constraints:"
foreach port [get_ports *] {
    set loc [get_property PACKAGE_PIN $port]
    set iostd [get_property IOSTANDARD $port]
    if {$loc == ""} {
        puts "ERROR: Port $port has no LOC constraint!"
    } else {
        puts "OK: Port $port -> LOC: $loc | IOSTANDARD: $iostd"
    }
}

# 5. create .bit
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

# 6. close project
close_project
exit