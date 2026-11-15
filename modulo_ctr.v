module modulo_ctr(
    input Reset, Clock,
    output [2:0] state_outputs,
    output counter_output
);

    wire [2:0] fa_carry;
    wire [2:0] fa_out;
    wire [2:0] d_out;
    wire On;
    
    assign state_outputs = d_out;
    assign On = d_out[2] & d_out[1] & d_out[0];

    /* Use full adders to add 1 every time the d-latches are set */

    full_adder fa0(
        .A(1'b0),
        .B(d_out[0]),
        .Cin(1'b1),
        .Y(fa_out[0]),
        .Cout(fa_carry[0])
    );
    
    full_adder fa1(
        .A(1'b0),
        .B(d_out[1]),
        .Cin(fa_carry[0]),
        .Y(fa_out[1]),
        .Cout(fa_carry[1])
    );
    
    full_adder fa2(
        .A(1'b0),
        .B(d_out[2]),
        .Cin(fa_carry[1]),
        .Y(fa_out[2]),
        .Cout(fa_carry[2])
    );
    
    /* D-latches to hold FA output */
    
    d_flip df0(
        .D(fa_out[0] & ~Reset),
        .Clock(Clock),
        .Q(d_out[0]),
        .Reset(Reset)
    );
    
    d_flip df1(
        .D(fa_out[1] & ~Reset),
        .Clock(Clock),
        .Q(d_out[1]),
        .Reset(Reset)
    );
    
    d_flip df2(
        .D(fa_out[2] & ~Reset),
        .Clock(Clock),
        .Q(d_out[2]),
        .Reset(Reset)
    );
    
    d_flip reset_latch(
        .D(~counter_output),
        .Clock(On),
        .Q(counter_output),
        .Reset(Reset)
    );

endmodule