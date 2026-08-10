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

    // addi x2, x0, 127
    memory[1] = 32'h07F00113;

    // sb x2, 0(x1)
    memory[2] = 32'h00208023;

    // lw x3, 0(x1)
    memory[3] = 32'h0000A183;

    // nop
    memory[4] = 32'h00000013;

    for (i = 5; i < 256; i = i + 1)
        memory[i] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule