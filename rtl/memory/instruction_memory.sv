`timescale 1ns/1ps

module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:255];
integer i;

initial begin

    // addi x1, x0, 0
    memory[0] = 32'h00000093;

    // lui x2, 0xABCD1
    memory[1] = 32'hABCD1137;

    // sh x2, 0(x1)
    memory[2] = 32'h00209023;

    // lw x3, 0(x1)
    memory[3] = 32'h0000A183;

    // nop
    memory[4] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule