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
    logic [31:0] branch_target;

    assign branch_target = pc + immediate;
    assign pc_plus4 = pc + 32'd4;
    assign lui_data = immediate;
    assign auipc_data = pc + immediate;

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

    logic [31:0] alu_result;
    logic [31:0] memory_read_data;
    logic [31:0] write_back_data;
    logic [31:0] pc_plus4;
    logic [31:0] lui_data;
    logic [31:0] auipc_data;

    logic zero;
    logic take_branch;

    always_comb begin
        case (result_src)

            2'b00:
                write_back_data = alu_result;

            2'b01:
                write_back_data = memory_read_data;

            2'b10:
                write_back_data = pc_plus4;

            2'b11:
                write_back_data = (instruction[6:0] == 7'b0110111) ?
                                    lui_data : auipc_data;

            default:
                write_back_data = 32'd0;

        endcase
    end

    register_file rf (
        .clk(clk),
        .we(reg_write),
        .rs1(instruction[19:15]),
        .rs2(instruction[24:20]),
        .rd(instruction[11:7]),
        .wd(write_back_data),
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

    alu alu_inst (
        .a(rd1),
        .b(operand_b),
        .alu_ctrl(alu_control_signal),
        .result(alu_result),
        .zero(zero)
    );

    //=========================================================
    // Data Memory
    //=========================================================

    data_memory dmem (
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(alu_result),
        .write_data(rd2),
        .read_data(memory_read_data)
    );

    //=========================================================
    // Branch Logic
    //=========================================================

    logic branch_taken;

    always_comb begin
        case (instruction[14:12])

            3'b000: branch_taken =  zero;                          // BEQ
            3'b001: branch_taken = !zero;                          // BNE
            3'b100: branch_taken = ($signed(rd1) <  $signed(rd2)); // BLT
            3'b101: branch_taken = ($signed(rd1) >= $signed(rd2)); // BGE
            3'b110: branch_taken = (rd1 < rd2);                    // BLTU
            3'b111: branch_taken = (rd1 >= rd2);                   // BGEU

            default: branch_taken = 1'b0;

        endcase
    end

assign take_branch = branch && branch_taken;

    //=========================================================
    // Next PC Logic
    //=========================================================

    logic [31:0] jalr_target;

    assign jalr_target = alu_result & 32'hFFFFFFFE;

    assign next_pc =
        (jump && instruction[6:0] == 7'b1100111) ? jalr_target :
        (jump)                                   ? branch_target :
        (take_branch)                            ? branch_target :
                                                pc_plus4;

endmodule