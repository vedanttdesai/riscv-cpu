`timescale 1ns/1ps

module register_file_tb;

logic clk;
logic we;
logic [4:0] rs1, rs2, rd;
logic [31:0] wd;
logic [31:0] rd1, rd2;

register_file dut (
    .clk(clk),
    .we(we),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .wd(wd),
    .rd1(rd1),
    .rd2(rd2)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    we  = 0;
    rs1 = 0;
    rs2 = 0;
    rd  = 0;
    wd  = 0;

    // Write x5 = 100
    #10;
    we = 1;
    rd = 5;
    wd = 32'd100;

    #10;
    we = 0;

    // Read x5
    rs1 = 5;
    #1;
    if (rd1 !== 32'd100)
        $fatal("Read x5 failed");

    // Try writing x0
    we = 1;
    rd = 0;
    wd = 32'd999;

    #10;
    we = 0;

    rs1 = 0;
    #1;
    if (rd1 !== 32'd0)
        $fatal("x0 modified");

    $display("PASS: Register File");
    $finish;
end

endmodule
