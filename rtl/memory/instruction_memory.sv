`timescale 1ns/1ps

module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

logic [31:0] memory [0:255];
integer i;

initial begin

    // addi x1, x0, 5
    memory[0] = 32'h00500093;

    // addi x2, x0, 10
    memory[1] = 32'h00A00113;

    // xor x3, x1, x2
    memory[2] = 32'h0020C1B3;

    for (i = 3; i < 256; i = i + 1)
        memory[i] = 32'h00000013;

end

assign instruction = memory[address[9:2]];

endmodule