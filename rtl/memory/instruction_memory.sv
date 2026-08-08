`timescale 1ns/1ps

module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:255];
integer i;

initial begin

    // addi x1, x0, -16
    memory[0] = 32'hFF000093;

    // addi x2, x0, 2
    memory[1] = 32'h00200113;

    // sra x3, x1, x2
    memory[2] = 32'h4020D1B3;

    // nop
    memory[3] = 32'h00000013;

    for (i = 4; i < 256; i = i + 1)
        memory[i] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule