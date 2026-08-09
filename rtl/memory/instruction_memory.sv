`timescale 1ns/1ps

module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:255];
integer i;

initial begin

    // addi x1, x0, -1
    memory[0] = 32'hFFF00093;

    // sltiu x2, x1, 1
    memory[1] = 32'h0010B113;

    // nop
    memory[2] = 32'h00000013;

    for (i = 3; i < 256; i = i + 1)
        memory[i] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule