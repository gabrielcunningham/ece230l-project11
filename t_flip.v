module t_flip(
    input T, Clock, Reset,
    output Q, NotQ
);

    wire InD;
    wire OutQ;

    d_flip d_flip(
        .D(InD & ~Reset),
        .Clock(Clock),
        .Q(OutQ),
        .Reset(Reset)
    );
    
    assign InD = T ^ OutQ;
    
    assign Q = OutQ;
    assign NotQ = ~Q;

endmodule