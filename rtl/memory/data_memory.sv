`timescale 1ns/1ps

module data_memory (

    input  logic        clk,
    input  logic        mem_read,
    input  logic        mem_write,
    input  logic [31:0] address,
    input  logic [31:0] write_data,
    input logic [2:0] funct3,
    output logic [31:0] read_data

);

    // 256 words of data memory
    logic [31:0] memory [0:255];

    integer i;

    // Initialize memory to zero
    // Initialize memory
    initial begin

        for (i = 0; i < 256; i = i + 1)
            memory[i] = 32'd0;

        // Test value for LW
        memory[0] = 32'h12345678;

    end

    // Synchronous write
    always_ff @(posedge clk) begin

        if (mem_write) begin

            case (funct3)

                // SB
                3'b000: begin
                    case (address[1:0])
                        2'b00: memory[address[9:2]][7:0]   <= write_data[7:0];
                        2'b01: memory[address[9:2]][15:8]  <= write_data[7:0];
                        2'b10: memory[address[9:2]][23:16] <= write_data[7:0];
                        2'b11: memory[address[9:2]][31:24] <= write_data[7:0];
                    endcase
                end

                // SH
                3'b001: begin
                    case (address[1])
                        1'b0: memory[address[9:2]][15:0]  <= write_data[15:0];
                        1'b1: memory[address[9:2]][31:16] <= write_data[15:0];
                    endcase
                end

                // SW
                3'b010:
                    memory[address[9:2]] <= write_data;

                default: begin
                    // Do nothing
                end

            endcase

        end

    end

    // Asynchronous read
    logic [31:0] word;
    logic [7:0] byte_data;
    logic [15:0] halfword_data;

    always_comb begin

        word = memory[address[9:2]];

        case (address[1:0])

            2'b00: byte_data = word[7:0];
            2'b01: byte_data = word[15:8];
            2'b10: byte_data = word[23:16];
            2'b11: byte_data = word[31:24];

        endcase

        case (address[1])

            1'b0:
                halfword_data = word[15:0];

            1'b1:
                halfword_data = word[31:16];

        endcase

        if (mem_read) begin

            case (funct3)

                3'b000: // LB
                    read_data = {{24{byte_data[7]}}, byte_data};

                3'b001: // LH
                    read_data = {{16{halfword_data[15]}}, halfword_data};

                3'b100: // LBU
                    read_data = {24'd0, byte_data};
                
                3'b101: // LHU
                    read_data = {16'd0, halfword_data};

                default: // LW (temporary)
                    read_data = word;

            endcase

        end
        else
            read_data = 32'd0;

    end

endmodule