`timescale 1ns/1ps

module cpu_top_tb;

logic clk;
logic rst;

cpu_top dut (
    .clk(clk),
    .rst(rst)
);

//---------------------------------------------------------
// Clock Generation
//---------------------------------------------------------
always #5 clk = ~clk;

//---------------------------------------------------------
// Simulation
//---------------------------------------------------------
initial begin

    clk = 0;
    rst = 1;

    #10;
    rst = 0;

    $display("");
    $display("==============================================================");
    $display("                 RV32I CPU EXECUTION TRACE");
    $display("==============================================================");

    repeat (8) begin

        @(posedge clk);

        $display("--------------------------------------------------------------");
        $display("Time          : %0t", $time);
        $display("PC            : %0d", dut.pc);
        $display("Next PC       : %0d", dut.next_pc);
        $display("Instruction   : %08h", dut.instruction);

        $display("");

        $display("RS1 Value     : %0d", dut.rd1);
        $display("RS2 Value     : %0d", dut.rd2);
        $display("Immediate     : %0d", dut.immediate);

        $display("");

        $display("ALU Control   : %04b", dut.alu_control_signal);
        $display("Operand B     : %0d", dut.operand_b);
        $display("ALU Result    : %0d", dut.alu_result);

        $display("");

        $display("Zero Flag     : %0b", dut.zero);
        $display("Branch        : %0b", dut.branch);
        $display("Take Branch   : %0b", dut.take_branch);
        $display("Branch Target : %0d", dut.branch_target);

        $display("");

        $display("Registers");
        $display("x1 = %0d", dut.rf.registers[1]);
        $display("x2 = %0d", dut.rf.registers[2]);
        $display("x3 = %0d", dut.rf.registers[3]);
        $display("x4 = %0d", dut.rf.registers[4]);

        $display("");

        $display("Memory[0] = %0d", dut.dmem.memory[0]);

    end

    $display("");
    $display("==============================================================");
    $display("Final Register Values");
    $display("==============================================================");
    $display("x1 = %0d", dut.rf.registers[1]);
    $display("x2 = %0d", dut.rf.registers[2]);
    $display("x3 = %0d", dut.rf.registers[3]);
    $display("x4 = %0d", dut.rf.registers[4]);
    $display("==============================================================");

    $finish;

end

endmodule