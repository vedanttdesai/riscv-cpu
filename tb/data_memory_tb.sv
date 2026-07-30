`timescale 1ns/1ps

module data_memory_tb;

logic clk;
logic mem_read;
logic mem_write;
logic [31:0] address;
logic [31:0] write_data;
logic [31:0] read_data;

data_memory dut (
    .clk(clk),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .address(address),
    .write_data(write_data),
    .read_data(read_data)
);

// Clock generation
initial clk = 0;
always #5 clk = ~clk;

initial begin

    // Initialize
    mem_read   = 0;
    mem_write  = 0;
    address    = 0;
    write_data = 0;

    // -------------------------
    // WRITE
    // -------------------------
    address    = 32'd8;
    write_data = 32'd123;
    mem_write  = 1;

    @(posedge clk);     // Perform write

    #1;                 // Allow NBA update to complete

    mem_write = 0;

    // -------------------------
    // READ
    // -------------------------
    mem_read = 1;

    #1;

    assert(read_data == 32'd123)
        else $fatal("Expected 123, got %0d", read_data);

    // -------------------------
    // READ DISABLED
    // -------------------------
    mem_read = 0;

    #1;

    assert(read_data == 32'd0)
        else $fatal("Expected 0, got %0d", read_data);

    $display("PASS: Data Memory");

    $finish;

end

endmoduled