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

    // lb x2, 0(x1)
    memory[1] = 32'h00008103;

    // nop
    memory[2] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule