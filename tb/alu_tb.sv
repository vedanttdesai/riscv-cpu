`timescale 1ns/1ps

module alu_tb;

logic [31:0] a, b;
logic [3:0] alu_ctrl;
logic [31:0] result;

alu dut (
    .a(a),
    .b(b),
    .alu_ctrl(alu_ctrl),
    .result(result)
);

initial begin

    // ADD
    a = 10; b = 20; alu_ctrl = 4'b0000; #1;
    if (result !== 30) $fatal("ADD failed");

    // SUB
    a = 20; b = 10; alu_ctrl = 4'b0001; #1;
    if (result !== 10) $fatal("SUB failed");

    // AND
    a = 32'hF0F0; b = 32'h0FF0; alu_ctrl = 4'b0010; #1;
    if (result !== (a & b)) $fatal("AND failed");

    // OR
    alu_ctrl = 4'b0011; #1;
    if (result !== (a | b)) $fatal("OR failed");

    // XOR
    alu_ctrl = 4'b0100; #1;
    if (result !== (a ^ b)) $fatal("XOR failed");

    // SLL
    a = 1; b = 3; alu_ctrl = 4'b0101; #1;
    if (result !== 8) $fatal("SLL failed");

    // SRL
    a = 32; b = 2; alu_ctrl = 4'b0110; #1;
    if (result !== 8) $fatal("SRL failed");

    // SRA
    a = -32'sd8; b = 1; alu_ctrl = 4'b0111; #1;
    if (result !== -32'sd4) $fatal("SRA failed");

    // SLT
    a = -5; b = 3; alu_ctrl = 4'b1000; #1;
    if (result !== 1) $fatal("SLT failed");

    // SLTU
    a = 5; b = 10; alu_ctrl = 4'b1001; #1;
    if (result !== 1) $fatal("SLTU failed");

    $display("PASS: ALU");
    $finish;

end

endmodule