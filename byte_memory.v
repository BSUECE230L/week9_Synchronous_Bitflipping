module byte_memory(
    input [7:0] data,
    input store,
    output reg [7:0] memory
);

    // Herein, implement D-Latch style memory
    // that stores the input data into memory
    // when store is high
  always @(store) begin
    if(store)
      memory = data;
    else if(~store)
      memory = memory;
  end

    // Memory should always output the value
    // stored, and it should only change
    // when store is high

endmodule
