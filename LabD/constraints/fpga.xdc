# clocks
set_property PACKAGE_PIN AC18 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports clk]
create_clock -period 10.000 -name clk [get_ports clk] 

# SW[7:0]
set_property PACKAGE_PIN AA10 [get_ports {SW[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[0]}] 

set_property PACKAGE_PIN AB10 [get_ports {SW[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[1]}]

set_property PACKAGE_PIN AA13 [get_ports {SW[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[2]}]

set_property PACKAGE_PIN AA12 [get_ports {SW[3]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[3]}]

set_property PACKAGE_PIN Y13 [get_ports {SW[4]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[4]}] 

set_property PACKAGE_PIN Y12 [get_ports {SW[5]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[5]}]

set_property PACKAGE_PIN AD11 [get_ports {SW[6]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[6]}]

set_property PACKAGE_PIN AD10 [get_ports {SW[7]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[7]}]

set_property PACKAGE_PIN AE10 [get_ports {SW[8]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[8]}]

# SEGMENT[7:0]
set_property PACKAGE_PIN AB22 [get_ports {SEGMENT[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[0]}]

set_property PACKAGE_PIN AD24 [get_ports {SEGMENT[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[1]}]

set_property PACKAGE_PIN AD23 [get_ports {SEGMENT[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[2]}]

set_property PACKAGE_PIN Y21 [get_ports {SEGMENT[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[3]}]

set_property PACKAGE_PIN W20 [get_ports {SEGMENT[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[4]}]

set_property PACKAGE_PIN AC24 [get_ports {SEGMENT[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[5]}]

set_property PACKAGE_PIN AC23 [get_ports {SEGMENT[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[6]}]

set_property PACKAGE_PIN AA22 [get_ports {SEGMENT[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEGMENT[7]}]

# AN[3:0]
set_property PACKAGE_PIN AC22 [get_ports {AN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]

set_property PACKAGE_PIN AB21 [get_ports {AN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]

set_property PACKAGE_PIN AC21 [get_ports {AN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]

set_property PACKAGE_PIN AD21 [get_ports {AN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]

# btn[3:0] and BTNX4
set_property PACKAGE_PIN V18 [get_ports {btn[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[3]}]

set_property PACKAGE_PIN V19 [get_ports {btn[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[2]}]

set_property PACKAGE_PIN V14 [get_ports {btn[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[1]}]

set_property PACKAGE_PIN W14 [get_ports {btn[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[0]}]

set_property PACKAGE_PIN W16 [get_ports BTNX4]
set_property IOSTANDARD LVCMOS18 [get_ports BTNX4]

set_property PACKAGE_PIN AF24 [get_ports Ring]
set_property IOSTANDARD LVCMOS33 [get_ports Ring]

# LED control

set_property PACKAGE_PIN N26 [get_ports clk_LED]
set_property IOSTANDARD LVCMOS33 [get_ports clk_LED]

set_property PACKAGE_PIN N24 [get_ports clr_LED]
set_property IOSTANDARD LVCMOS33 [get_ports clr_LED]

set_property PACKAGE_PIN M26 [get_ports o_LED]
set_property IOSTANDARD LVCMOS33 [get_ports o_LED]

set_property PACKAGE_PIN P18 [get_ports EN_LED]
set_property IOSTANDARD LVCMOS33 [get_ports EN_LED]