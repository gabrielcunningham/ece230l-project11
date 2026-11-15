module top(
    input btnU, btnC,
    output [6:0] led
);

    /* Implement Ripple Counter Solution */
    ripple_ctr ripple_ctr(
        .Reset(btnU),
        .Clock(btnC),
        .stage_outputs(led[2:0])
    );
    
    /* Implement Modulo Counter Solution */
    modulo_ctr modulo_ctr(
        .Reset(btnU),
        .Clock(btnC),
        .state_outputs(led[5:3]),
        .counter_output(led[6])
    );

endmodule