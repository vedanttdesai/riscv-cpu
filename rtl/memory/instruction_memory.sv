`timescale 1ns/1ps

module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:255];

integer i;

initial begin

    // addi x5, x0, 16
    memory[0] = 32'h01000293;

    // jalr x1, x5, 0
    memory[1] = 32'h000280E7;

    // addi x2, x0, 99
    // SHOULD BE SKIPPED
    memory[2] = 32'h06300113;

    // NOP
    memory[3] = 32'h00000013;

    // Target (PC = 16)
    // addi x3, x0, 42
    memory[4] = 32'h02A00193;

    for (i = 5; i < 256; i = i + 1)
        memory[i] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule