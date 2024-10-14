module demux_(
    input [7:0] data_in,    // 8-bit input data
    input [1:0] sel,        // 2-bit select input to choose which latch to write
    input store,            // Store command (btnC) - Enable signal for latches
    output [7:0] latch_out0, // Output of first latch
    output [7:0] latch_out1, // Output of second latch
    output [7:0] latch_out2, // Output of third latch
    output [7:0] latch_out3  // Output of fourth latch
);

    // Internal 8-bit registers for storing data
    reg [7:0] latch0, latch1, latch2, latch3;

    // D-Latch behavior: store data on store signal if selected
    always @(*) begin
        if (store) begin
            case (sel)
                2'b00: latch0 = data_in;   // Select latch 0
                2'b01: latch1 = data_in;   // Select latch 1
                2'b02: latch2 = data_in;   // Select latch 2
                2'b03: latch3 = data_in;   // Select latch 3
            endcase
        end
    end

    // Assign the outputs to the stored latch values
    assign latch_out0 = latch0;
    assign latch_out1 = latch1;
    assign latch_out2 = latch2;
    assign latch_out3 = latch3;

endmodule
