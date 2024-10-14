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
  byte_memory bit0(
    
  );

  byte_memory bit1(

  );

  byte_memory bit2(

  );

  byte_memory bit3(

  );

    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs

endmodule
