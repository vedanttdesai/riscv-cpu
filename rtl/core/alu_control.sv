`timescale 1ns/1ps

module alu_control (
    input  logic [1:0] ALUOp,
    input  logic [2:0] funct3,
    input  logic [6:0] funct7,
    output logic [3:0] ALUControl
);

always_comb begin
    case (ALUOp)

        // Load / Store / ADDI
        2'b00:
            ALUControl = 4'b0000;

        // Branch (SUB for comparison)
        2'b01:
            ALUControl = 4'b0001;

        // R-Type / I-Type Arithmetic
        2'b10: begin
            case (funct3)

                3'b000: begin
                    if (funct7 == 7'b0100000)
                        ALUControl = 4'b0001;   // SUB
                    else
                        ALUControl = 4'b0000;   // ADD / ADDI
                end

                3'b111:
                    ALUControl = 4'b0010;   // AND / ANDI

                3'b110:
                    ALUControl = 4'b0011;   // OR / ORI
                
                3'b101: begin
                    if (funct7 == 7'b0100000)
                        ALUControl = 4'b0111;   // SRA
                    else
                        ALUControl = 4'b0110;   // SRL
                end

                3'b100:
                    ALUControl = 4'b0100;   // XOR / XORI
                
                3'b011:
                    ALUControl = 4'b1001;   // SLTU / SLTIU
                
                3'b010:
                    ALUControl = 4'b1000;   // SLT / SLTI
                
                3'b001:
                    ALUControl = 4'b0101;   // SLL

                default:
                    ALUControl = 4'b0000;
            endcase
        end

        default:
            ALUControl = 4'b0000;

    endcase
end

endmodule