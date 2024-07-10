module top
(
    input clk,
    input rst_ni,
    output [5:0] led
);

localparam WAIT_TIME = 13500000;
reg [5:0] ledCounter = 0;
reg [23:0] clockCounter = 0;

always @(posedge clk) begin
    if (rst_ni) begin
        clockCounter <= clockCounter + 1;
        if (clockCounter == WAIT_TIME) begin
            clockCounter <= 0;
            ledCounter <= ledCounter + 1;
        end
    end
    else begin
        clockCounter = 0;
        ledCounter = 0;
    end
end

assign led = ledCounter;
endmodule
