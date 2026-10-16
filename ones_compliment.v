module ones_compliment(
    input [3:0] A, [3:0] B,
    output [4:0] Out
);

wire [3:0] carry;
wire [3:0] carry2;
wire [3:0] stageConnector;

full_adder lsb(
    .A(A[0]),
    .B(~B[0]),
    .Cin(1'b0),
    .Y(stageConnector[0]),
    .Cout(carry[0])
);


genvar i;

generate
    for (i = 1; i < 4; i = i + 1) begin
        full_adder add(
            .A(A[i]),
            .B(~B[i]),
            .Cin(carry[i-1]),
            .Y(stageConnector[i]),
            .Cout(carry[i])
        );
    end
endgenerate

genvar j;
assign carry2[0] = carry[3];

full_adder lsb2(
    .A(stageConnector[0]),
    .B(1'b0),
    .Cin(carry2[0]),
    .Y(Out[0]),
    .Cout(carry2[1])
);

generate
    for (j = 1; j < 5; j = j + 1) begin
        full_adder add1(
            .A(stageConnector[j-1]),
            .B(1'b0),
            .Cin(carry2[j-1]),
            .Y(Out[j]),
            .Cout(carry2[j])
        );
    end
endgenerate



endmodule