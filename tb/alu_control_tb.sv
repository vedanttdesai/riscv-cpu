`timescale 1ns/1ps

module alu_control_tb;

logic [1:0] ALUOp;
logic [2:0] funct3;
logic [6:0] funct7;
logic [3:0] ALUControl;

alu_control dut (
    .ALUOp(ALUOp),
    .funct3(funct3),
    .funct7(funct7),
    .ALUControl(ALUControl)
);

initial begin

    $display("----------------------------------------");
    $display("ALU Control Unit Test");
    $display("----------------------------------------");

    // ADD
    ALUOp  = 2'b10;
    funct3 = 3'b000;
    funct7 = 7'b0000000;
    #10;
    $display("ADD  -> %b", ALUControl);

    // SUB
    funct7 = 7'b0100000;
    #10;
    $display("SUB  -> %b", ALUControl);

    // AND
    funct3 = 3'b111;
    funct7 = 7'b0000000;
    #10;
    $display("AND  -> %b", ALUControl);

    // OR
    funct3 = 3'b110;
    #10;
    $display("OR   -> %b", ALUControl);

    // LOAD/STORE
    ALUOp = 2'b00;
    #10;
    $display("LOAD -> %b", ALUControl);

    // BRANCH
    ALUOp = 2'b01;
    #10;
    $display("BRCH -> %b", ALUControl);

    $display("----------------------------------------");
    $finish;

end

endmodule