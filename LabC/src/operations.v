module Adder_1b (
    input wire Ci, A, B,
    output wire S, Co
);
    
    assign Co = (A & B) | (A & Ci) | (Ci & B);
    assign S = A ^ B ^ Ci;

endmodule

module Adder_4b (
    input wire op,
    input wire [3 : 0] A, B,
    output wire Co,
    output wire [3 : 0] S
);
    
    wire [3 : 0] tB, temp_op;
    wire [3 : 1] C;
    assign temp_op = {op, op, op, op};
    assign tB = temp_op ^ B;
    Adder_1b
        A0(.Ci(op), .A(A[0]), .B(tB[0]), .S(S[0]), .Co(C[1])),
        A1(.Ci(C[1]), .A(A[1]), .B(tB[1]), .S(S[1]), .Co(C[2])),
        A2(.Ci(C[2]), .A(A[2]), .B(tB[2]), .S(S[2]), .Co(C[3])),
        A3(.Ci(C[3]), .A(A[3]), .B(tB[3]), .S(S[3]), .Co(Co));


endmodule

module my_And_Or_4b (
    input wire op,
    input wire [3 : 0] A, B,
    output wire Co,
    output wire [3 : 0] S
);
    assign Co = 0;
    wire [3 : 0] temp_op;
    assign temp_op = {op, op, op, op};
    assign S = (~temp_op & A & B) | (temp_op & (A | B));
endmodule

module ALU (
    input wire [1 : 0] op,
    input wire [3 : 0] A, B,
    output wire Co,
    output wire [3 : 0] S
);
    wire [3 : 0] S0, S1;
    wire Co0, Co1;
    Adder_4b addsub(.op(op[0]), .A(A), .B(B), .Co(Co0), .S(S0));
    my_And_Or_4b andor(.op(op[0]), .A(A), .B(B), .Co(Co1), .S(S1));
    assign S = op[1] ? S1 : S0;
    assign Co = op[1] ? Co1 : Co0;
endmodule