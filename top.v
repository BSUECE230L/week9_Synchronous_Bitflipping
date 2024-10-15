module top(
  input [15:0] sw,
  input btnC,
  output [15:0] led
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
