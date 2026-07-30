`timescale 1ns/1ps

module cpu_top (

    input logic clk,
    input logic reset

);

    // ============================
    // Program Counter Signals
    // ============================
    logic [31:0] pc;
    logic [31:0] next_pc;

    // ============================
    // Instruction Signals
    // ============================
    logic [31:0] instruction;

    // ============================
    // Control Signals
    // ============================
    logic        reg_write;
    logic        mem_read;
    logic        mem_write;
    logic        branch;
    logic        jump;
    logic        alu_src;
    logic [1:0] result_src;
    logic [1:0] alu_op;

    // ============================
    // Program Counter
    // ============================
    program_counter pc_inst (

        .clk(clk),
        .rst(reset),
        .next_pc(next_pc),
        .pc(pc)

    );

    // ============================
    // Instruction Memory
    // ============================
    instruction_memory imem (

        .address(pc),
        .instruction(instruction)

    );

    // ============================
    // Control Unit
    // ============================
    control_unit cu (

        .opcode(instruction[6:0]),
        .RegWrite(reg_write),
        .MemRead(mem_read),
        .MemWrite(mem_write),
        .Branch(branch),
        .Jump(jump),
        .ALUSrc(alu_src),
        .ResultSrc(result_src),
        .ALUOp(alu_op)

    );

    // ============================
    // Next PC Logic
    // ============================
    assign next_pc = pc + 32'd4;

endmodule