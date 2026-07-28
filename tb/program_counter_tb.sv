`timescale 1ns/1ps

module program_counter_tb;

logic clk;
logic rst;
logic [31:0] next_pc;
logic [31:0] pc;

program_counter dut (
    .clk(clk),
    .rst(rst),
    .next_pc(next_pc),
    .pc(pc)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    next_pc = 32'h00000000;

    #10;
    if (pc !== 32'h00000000) $fatal("Reset failed");

    rst = 0;

    next_pc = 32'h00000004;
    #10;
    if (pc !== 32'h00000004) $fatal("PC = 0x4 failed");

    next_pc = 32'h00000008;
    #10;
    if (pc !== 32'h00000008) $fatal("PC = 0x8 failed");

    next_pc = 32'h0000000C;
    #10;
    if (pc !== 32'h0000000C) $fatal("PC = 0xC failed");

    $display("PASS: Program Counter");
    $finish;
end

endmodule