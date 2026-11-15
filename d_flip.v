module d_flip(
    input D, Clock, Reset,
    output reg Q,
    output NotQ
);

    initial begin
        Q <= 0;
    end
    
    always @(posedge Clock or posedge Reset) begin
        if (Clock)
            Q <= D;
//        else if (Reset)
//            Q <= 0;
    end
    
    assign NotQ = ~Q;

endmodule