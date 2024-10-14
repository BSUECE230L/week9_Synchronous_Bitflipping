module behavioral_d_latch(
    input Set,
    input Reset,
    output reg Q,
    output NotQ
);

    always @(Set, Reset) begin 
        if (Set)
            Q = 1;
        else if (Reset)
            Q = 0;
    end
    assign NotQ = ~Q; 

endmodule
