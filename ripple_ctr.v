module ripple_ctr(
    input Reset, Clock,
    output [2:0] stage_outputs
);

    wire [2:0] q_carry;

    t_flip t_flip0(
        .T(1'b1),
        .Clock(Clock),
        .Reset(Reset),
        .Q(q_carry[0])
    );
    
    t_flip t_flip1(
        .T(1'b1),
        .Clock(q_carry[0]),
        .Reset(Reset),
        .Q(q_carry[1])
    );
    
    t_flip t_flip2(
        .T(1'b1),
        .Clock(q_carry[1]),
        .Reset(Reset),
        .Q(q_carry[2])
    );
    
    assign stage_outputs = q_carry;

endmodule