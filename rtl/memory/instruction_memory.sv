`timescale 1ns/1ps

module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:255];

integer i;

initial begin

    //=====================================================
    // JAL Test Program
    //=====================================================

    // addi x1, x0, 5
    memory[0] = 32'h00500093;

    // jal x4, +8
    // Jump to PC = 12
    // x4 should receive PC+4 = 8
    memory[1] = 32'h0080026F;

    // addi x2, x0, 99
    // SHOULD BE SKIPPED
    memory[2] = 32'h06300113;

    // addi x3, x0, 42
    // SHOULD EXECUTE
    memory[3] = 32'h02A00193;

    // Fill remaining memory with NOPs
    for (i = 4; i < 256; i = i + 1)
        memory[i] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule