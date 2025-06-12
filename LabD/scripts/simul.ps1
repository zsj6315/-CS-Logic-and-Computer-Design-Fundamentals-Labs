iverilog -o .\build\wave.out .\src\MUX41.v .\src\MyMC14495.v .\src\clkdiv.v .\src\top.v .\src\display.v .\src\createnumber.v .\src\LED.v .\src\testbench_top.v
vvp -n .\build\wave.out