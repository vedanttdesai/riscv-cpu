`timescale 1ns/1ps

module cpu_top_tb;

logic clk;
logic rst;

cpu_top dut (
    .clk(clk),
    .rst(rst)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;

    #10;
    rst = 0;

    // Let the CPU execute a few instructions
    repeat (5) @(posedge clk);

    $display("-------------------------------------------");
    $display("CPU Execute Stage Test");
    $display("-------------------------------------------");

    $display("PC              = %0d", dut.pc);
    $display("Instruction     = 0x%08h", dut.instruction);

    $display("");

    $display("Register Read 1 = %0d", dut.rd1);
    $display("Register Read 2 = %0d", dut.rd2);

    $display("Immediate       = %0d", dut.immediate);

    $display("");

    $display("ALU Control     = %b", dut.alu_control_signal);
    $display("Operand B       = %0d", dut.operand_b);

    $display("");

    $display("ALU Result      = %0d", dut.alu_result);

    $display("-------------------------------------------");

    $finish;

end

endmodule