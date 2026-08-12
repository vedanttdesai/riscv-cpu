`timescale 1ns/1ps

module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:255];
integer i;

initial begin

    // jal x3, +8
    memory[0] = 32'h008001EF;

    // This instruction should be skipped
    // addi x4, x0, 99
    memory[1] = 32'h06300213;

    // Branch target
    // addi x4, x0, 42
    memory[2] = 32'h02A00213;

    // nop
    memory[3] = 32'h00000013;

    for (i = 4; i < 256; i = i + 1)
        memory[i] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule