`timescale 1ns/1ps

module instruction_memory (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

    logic [31:0] memory [0:255];

    integer i;

    initial begin

        // Clear instruction memory
        for (i = 0; i < 256; i = i + 1)
            memory[i] = 32'h00000013;  // NOP

        // Load test program
        $readmemh("tests/program.hex", memory);

    end

    assign instruction = memory[address[9:2]];

endmodule