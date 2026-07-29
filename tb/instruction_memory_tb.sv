`timescale 1ns/1ps

module instruction_memory_tb;

logic [31:0] address;
logic [31:0] instruction;

instruction_memory dut (
    .address(address),
    .instruction(instruction)
);

initial begin

    // Instruction 0
    address = 32'd0;
    #1;
    assert(instruction == 32'h00A00093);

    // Instruction 1
    address = 32'd4;
    #1;
    assert(instruction == 32'h01400113);

    // Instruction 2
    address = 32'd8;
    #1;
    assert(instruction == 32'h002081B3);

    // Instruction 3
    address = 32'd12;
    #1;
    assert(instruction == 32'h00302023);

    // NOP
    address = 32'd16;
    #1;
    assert(instruction == 32'h00000013);

    $display("PASS: Instruction Memory");
    $finish;

end

endmodule