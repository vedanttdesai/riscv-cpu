`timescale 1ns/1ps

module data_memory (

    input  logic        clk,
    input  logic        mem_read,
    input  logic        mem_write,
    input  logic [31:0] address,
    input  logic [31:0] write_data,
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
        if (mem_write)
            memory[address[9:2]] <= write_data;
    end

    // Asynchronous read
    logic [31:0] word;
    logic [7:0] byte_data;

    always_comb begin

        word = memory[address[9:2]];

        case (address[1:0])

            2'b00: byte_data = word[7:0];
            2'b01: byte_data = word[15:8];
            2'b10: byte_data = word[23:16];
            2'b11: byte_data = word[31:24];

        endcase

        if (mem_read)
            read_data = {{24{byte_data[7]}}, byte_data};   // LB
        else
            read_data = 32'd0;

    end

endmodule