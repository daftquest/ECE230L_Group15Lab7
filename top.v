module top (
    input [9:0] sw,
    output [13:0] led
);

half_sub hSubInst(
    .A(sw[0]),
    .B(sw[1]),
    .Y(led[0]),
    .Borrow(led[1])
);

ones_compliment oneCompInst(
    .A(sw[5:2]),
    .B(sw[9:6]),
    .Out(led[5:2])
);

endmodule