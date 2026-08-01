`timescale 1ns/1ps

module instruction_memory (
    input logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:255];
integer i;

initial begin

    // addi x1, x0, 10
    memory[0] = 32'h00A00093;

    // addi x2, x0, 5
    memory[1] = 32'h00500113;

    // bgeu x1, x2, +8
    memory[2] = 32'h0020F463;

    // addi x3, x0, 99 (should be skipped)
    memory[3] = 32'h06300193;

    // addi x3, x0, 42
    memory[4] = 32'h02A00193;

    for (i = 5; i < 256; i = i + 1)
        memory[i] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule