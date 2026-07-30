`timescale 1ns/1ps

module cpu_top (
    input logic clk,
    input logic rst
);

    //=========================================================
    // Program Counter
    //=========================================================

    logic [31:0] pc;
    logic [31:0] next_pc;

    assign next_pc = pc + 32'd4;

    program_counter pc_inst (
        .clk(clk),
        .rst(rst),
        .next_pc(next_pc),
        .pc(pc)
    );

    //=========================================================
    // Instruction Memory
    //=========================================================

    logic [31:0] instruction;

    instruction_memory imem (
        .address(pc),
        .instruction(instruction)
    );

    //=========================================================
    // Control Unit
    //=========================================================

    logic reg_write;
    logic mem_read;
    logic mem_write;
    logic branch;
    logic jump;
    logic alu_src;
    logic [1:0] result_src;
    logic [1:0] alu_op;

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

    //=========================================================
    // Register File
    //=========================================================

    logic [31:0] rd1;
    logic [31:0] rd2;
    logic [31:0] write_data;

    assign write_data = alu_result;

    register_file rf (
        .clk(clk),
        .we(reg_write),
        .rs1(instruction[19:15]),
        .rs2(instruction[24:20]),
        .rd(instruction[11:7]),
        .wd(write_data),
        .rd1(rd1),
        .rd2(rd2)
    );

    //=========================================================
    // Immediate Generator
    //=========================================================

    logic [31:0] immediate;

    immediate_generator imm_gen (
        .instruction(instruction),
        .immediate(immediate)
    );

    //=========================================================
    // ALU Control
    //=========================================================

    logic [3:0] alu_control_signal;

    alu_control alu_ctrl (
        .ALUOp(alu_op),
        .funct3(instruction[14:12]),
        .funct7(instruction[31:25]),
        .ALUControl(alu_control_signal)
    );

    //=========================================================
    // ALU Operand MUX
    //=========================================================

    logic [31:0] operand_b;

    assign operand_b = (alu_src) ? immediate : rd2;

    //=========================================================
    // ALU
    //=========================================================

    logic [31:0] alu_result;

    alu alu_inst (
        .a(rd1),
        .b(operand_b),
        .alu_ctrl(alu_control_signal),
        .result(alu_result)
    );

endmodule