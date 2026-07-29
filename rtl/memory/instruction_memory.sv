`timescale 1ns/1ps

module instruction_memory (

    input  logic [31:0] address,
    output logic [31:0] instruction

);

    // 256 words of instruction memory
    logic [31:0] memory [0:255];

    // Loop variable
    integer i;

    // Read instruction
    assign instruction = memory[address[9:2]];

    // Initialize instruction memory
    initial begin

        // ADDI x1, x0, 10
        memory[0] = 32'h00A00093;

        // ADDI x2, x0, 20
        memory[1] = 32'h01400113;

        // ADD x3, x1, x2
        memory[2] = 32'h002081B3;

        // SW x3, 0(x0)
        memory[3] = 32'h00302023;

        // Fill remaining memory with NOP
        for (i = 4; i < 256; i = i + 1) begin
            memory[i] = 32'h00000013;
        end

    end

endmodule