module top(
  input sw[0],
  input btnC,
  output led[1:0]
);

  behavioral_d_latch partOne(
    .E(btnC),
    .D(sw[0]),
    .Q(led[0]),
    .notQ(led[1])
  );

endmodule
