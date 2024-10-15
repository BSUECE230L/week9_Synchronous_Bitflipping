module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output reg [7:0] memory
);

    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr
    reg[7:0] byte0, byte1, byte2, byte3;

    always @(*) begin
        case(addr)
            2'b00: {byte3, byte2, byte1, byte0} <= {8'b0, 8'b0, 8'b0,data};
            2'b01: {byte3, byte2, byte1, byte0} <= {8'b0, 8'b0, data, 8'b0};
            2'b10: {byte3, byte2, byte1, byte0} <= {8'b0, data, 8'b0, 8'b0};
            2'b11: {byte3, byte2, byte1, byte0} <= {data, 8'b0, 8'b0,8'b0};
        endcase
    end

    reg bit0, bit1, bit2, bit3;
    
    always @(*) begin
        case(addr)
            2'b00: {bit3, bit2, bit1, bit0} <= {1'b0, 1'b0, 1'b0, store};
            2'b01: {bit3, bit2, bit1, bit0} <= {1'b0, 1'b0, store, 1'b0};
            2'b10: {bit3, bit2, bit1, bit0} <= {1'b0, store, 1'b0, 1'b0};
            2'b11: {bit3, bit2, bit1, bit0} <= {store, 1'b0, 1'b0, 1'b0};
        endcase
    end
   
   wire [7:0] internal_data[3:0];
   
   byte_memory mem0(
       .data(byte0),
       .store(bit0),
       .memory(internal_data[0])
   );

   byte_memory mem1(
       .data(byte1),
       .store(bit1),
       .memory(internal_data[1])
   );

   byte_memory mem2(
       .data(byte2),
       .store(bit2),
       .memory(internal_data[2])
   );

   byte_memory mem3(
       .data(byte3),
       .store(bit3),
       .memory(internal_data[3])
   );
   
    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs
    
    always @(*) begin 
        case(addr)
            2'b00: memory <= internal_data[0];
            2'b01: memory <= internal_data[1];
            2'b10: memory <= internal_data[2];
            2'b11: memory <= internal_data[3];
        endcase
     end
endmodule
