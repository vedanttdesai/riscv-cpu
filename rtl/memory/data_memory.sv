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
    initial begin
        for (i = 0; i < 256; i = i + 1)
            memory[i] = 32'd0;
    end

    // Synchronous write
    always_ff @(posedge clk) begin
        if (mem_write)
            memory[address[9:2]] <= write_data;
    end

    // Asynchronous read
    always_comb begin
        if (mem_read)
            read_data = memory[address[9:2]];
        else
            read_data = 32'd0;
    end

endmodule