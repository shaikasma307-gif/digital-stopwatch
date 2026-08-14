`timescale 1ns/1ps

module digital_stopwatch_tb;

reg clk;
reg reset;
reg start_stop;

wire [5:0] minutes;
wire [5:0] seconds;
wire [6:0] hundredths;

digital_stopwatch #(
    .CLK_FREQ(10)
) uut (
    .clk(clk),
    .reset(reset),
    .start_stop(start_stop),
    .minutes(minutes),
    .seconds(seconds),
    .hundredths(hundredths)
);

always #5 clk = ~clk;

initial begin

    $monitor("Time = %02d:%02d.%02d | Reset = %b | Running = %b",
             minutes, seconds, hundredths, reset, uut.running);

    clk = 0;
    reset = 1;
    start_stop = 0;

    #10;

    reset = 0;

    // Start stopwatch
    #10;
    start_stop = 1;

    #10;
    start_stop = 0;

    // Run stopwatch
    #1050;

    // Stop stopwatch
    start_stop = 1;
    #10;
    start_stop = 0;

    #50;

    // Reset stopwatch
    reset = 1;
    #10;

    $display("Simulation completed successfully.");
    $finish;

end

endmodule