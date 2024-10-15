module top(
  input [0:0] sw, 
  input [15:6] sw,
  input btnC,
  output [1:0] led,
  output [15:8] led
);

  behavioral_d_latch partOne(
    .E(btnC),
    .D(sw[0]),
    .Q(led[0]),
    .notQ(led[1])
  );

    memory_system mem(
        .data(sw[15:8]),
        .addr(sw[7:6]),
        .store(btnC),
      .memory(led[15:8])
    );

endmodule
