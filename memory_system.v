module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr
    reg[7:0] byte0, byte1, byte2, byte3;

    always @(*) begin
        if (store) begin
            case(addr)
                2'b00: byte0 <= data;
                2'b01: byte1 <= data;
                2'b02: byte2 <= data;
                2'b03: byte3 <= data;
            endcase
        end
    end

     // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs

    assign memory = addr;

    
  // byte_memory bit0(
  //     demux d0(
  //         .data_in(data),
  //         .store(store),
  //         .addr(latch0)
  //     );
  // );

  // byte_memory bit1(
  //     demux d1(
  //         .data_in(data),
  //         .store(store),
  //         .addr(latch1)
  //     );
  // );

  // byte_memory bit2(
  //     demux d2(
  //         .data_in(data),
  //         .store(store),
  //         .addr(latch2)
  //     );
  // );

  // byte_memory bit3(
  //     demux d3(
  //         .data_in(data),
  //         .store(store),
  //         .addr(latch3)
  //     );
  // );

endmodule
