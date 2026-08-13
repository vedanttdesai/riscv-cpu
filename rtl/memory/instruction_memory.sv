`timescale 1ns/1ps

module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:255];
integer i;

initial begin

    // lui x1, 0xABCDE
    memory[0] = 32'hABCDE0B7;

    // nop
    memory[1] = 32'h00000013;

    for (i = 2; i < 256; i = i + 1)
        memory[i] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule