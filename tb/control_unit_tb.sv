`timescale 1ns/1ps

module control_unit_tb;

logic [6:0] opcode;

logic RegWrite;
logic MemRead;
logic MemWrite;
logic Branch;
logic Jump;
logic ALUSrc;
logic [1:0] ResultSrc;
logic [1:0] ALUOp;

control_unit dut (
    .opcode(opcode),
    .RegWrite(RegWrite),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .Jump(Jump),
    .ALUSrc(ALUSrc),
    .ResultSrc(ResultSrc),
    .ALUOp(ALUOp)
);

initial begin

    // R-Type
    opcode = 7'b0110011;
    #1;
    assert(RegWrite && !ALUSrc && ALUOp == 2'b10);

    // I-Type
    opcode = 7'b0010011;
    #1;
    assert(RegWrite && ALUSrc && ALUOp == 2'b10);

    // Load
    opcode = 7'b0000011;
    #1;
    assert(RegWrite && MemRead && ALUSrc &&
           ResultSrc == 2'b01);

    // Store
    opcode = 7'b0100011;
    #1;
    assert(MemWrite && ALUSrc);

    // Branch
    opcode = 7'b1100011;
    #1;
    assert(Branch && ALUOp == 2'b01);

    // JAL
    opcode = 7'b1101111;
    #1;
    assert(Jump && RegWrite &&
           ResultSrc == 2'b10);

    // LUI
    opcode = 7'b0110111;
    #1;
    assert(RegWrite && ALUSrc);

    // AUIPC
    opcode = 7'b0010111;
    #1;
    assert(RegWrite && ALUSrc);

    $display("PASS: Control Unit");
    $finish;

end

endmodule