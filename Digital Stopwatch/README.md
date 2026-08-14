Features
Start and stop functionality
Reset functionality
Displays minutes, seconds, and hundredths
Automatic time counting
24-hour maximum counting range
Suitable for FPGA and digital circuit simulation
Inputs
Input	Description
clk	Clock signal
reset	Resets the stopwatch to zero
start_stop	Starts or stops the stopwatch
Outputs
Output	Description
minutes	Minutes
seconds	Seconds
hundredths	Hundredths of a second
Working Principle

When start_stop is enabled, the stopwatch counts elapsed time. The hundredths counter increments first, followed by seconds and minutes. When reset is activated, all counters return to zero.

Project Files
digital_stopwatch.v - Main Verilog design
digital_stopwatch_tb.v - Testbench
expected_output.txt - Expected simulation output
Simulation

Using Icarus Verilog:

iverilog -o stopwatch_sim digital_stopwatch.v digital_stopwatch_tb.v
vvp stopwatch_sim
Applications
Digital watches
Sports timing systems
Laboratory timers
FPGA-based timing systems
Event timing applications