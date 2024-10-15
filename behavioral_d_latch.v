module behavioral_d_latch(
    input D,
    input E,
    output reg Q,
    output NotQ
);

    always @(E) begin 
        if (E)
            Q <= D;
        else if (~E)
            Q <= Q;
    end
    assign NotQ = ~Q; 

endmodule
