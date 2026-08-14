module digital_stopwatch #(
    parameter CLK_FREQ = 10
)(
    input  wire       clk,
    input  wire       reset,
    input  wire       start_stop,
    output reg [5:0]  minutes,
    output reg [5:0]  seconds,
    output reg [6:0]  hundredths
);

reg [31:0] counter;
reg running;

always @(posedge clk) begin

    if (reset) begin
        counter   <= 0;
        minutes   <= 0;
        seconds   <= 0;
        hundredths <= 0;
        running   <= 0;
    end

    else begin

        if (start_stop)
            running <= ~running;

        if (running) begin

            if (counter == CLK_FREQ - 1) begin
                counter <= 0;

                if (hundredths == 99) begin
                    hundredths <= 0;

                    if (seconds == 59) begin
                        seconds <= 0;

                        if (minutes == 59)
                            minutes <= 0;
                        else
                            minutes <= minutes + 1;

                    end
                    else begin
                        seconds <= seconds + 1;
                    end

                end
                else begin
                    hundredths <= hundredths + 1;
                end

            end
            else begin
                counter <= counter + 1;
            end

        end
    end
end

endmodule