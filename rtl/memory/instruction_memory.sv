`timescale 1ns/1ps

module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:255];
integer i;

initial begin

    // addi x1, x0, 8
    memory[0] = 32'h00800093;

    // jalr x3, 0(x1)
    memory[1] = 32'h000081E7;

    // This instruction should be skipped
    // addi x4, x0, 99
    memory[2] = 32'h06300213;

    // Target: PC = 8
    // addi x4, x0, 42
    memory[3] = 32'h02A00213;

    // nop
    memory[4] = 32'h00000013;

    for (i = 5; i < 256; i = i + 1)
        memory[i] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule