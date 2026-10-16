module ones_compliment(
    input [3:0] A, [3:0] B,
    output [4:0] Out
);

wire [3:0] carry;
wire [3:0] carry2;
wire [3:0] stageConnector;

full_adder lsb(
    .A(A[0]),
    .B(B[0]),
    .Cin(1'b0),
    .Y(stageConnector[0]),
    .Cout(carry[0])
);


genvar i;

generate
    for (i = 1; i < 4; i = i + 1) begin
        full_adder add(
            .A(A[i]),
            .B(B[i]),
            .Cin(carry[i-1]),
            .Y(stageConnector[i]),
            .Cout(carry[i])
        );
    end
endgenerate

genvar j;
assign carry2[0] = carry[3];

generate
    for (j = 0; j < 4; j = j + 1) begin
        full_adder add1(
            .A(stageConnector[j]),
            .B(1'b0),
            .Cin(carry2[j]),
            .Y(Out[j]),
            .Cout(carry2[j+1])
        );
    end
endgenerate



endmodule