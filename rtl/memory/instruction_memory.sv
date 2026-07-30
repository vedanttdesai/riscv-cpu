`timescale 1ns/1ps

module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:255];

integer i;

initial begin

    //=====================================================
    // Branch Test Program
    //=====================================================

    // addi x1, x0, 5
    memory[0] = 32'h00500093;

    // addi x2, x0, 5
    memory[1] = 32'h00500113;

    // beq x1, x2, +8
    // If equal, skip next instruction
    memory[2] = 32'h00208463;

    // addi x3, x0, 99
    // SHOULD BE SKIPPED
    memory[3] = 32'h06300193;

    // addi x3, x0, 42
    // SHOULD EXECUTE
    memory[4] = 32'h02A00193;

    // Fill remaining memory with NOPs
    for (i = 5; i < 256; i = i + 1)
        memory[i] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule