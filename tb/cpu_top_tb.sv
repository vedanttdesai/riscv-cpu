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
    $display("===============================================");
    $display("        RV32I CPU EXECUTION TRACE");
    $display("===============================================");

    repeat (6) begin

        @(posedge clk);

        $display("-----------------------------------------------");
        $display("Time         : %0t", $time);
        $display("PC           : %0d", dut.pc);
        $display("Instruction  : %08h", dut.instruction);

        $display("");

        $display("RS1 Value    : %0d", dut.rd1);
        $display("RS2 Value    : %0d", dut.rd2);
        $display("Immediate    : %0d", dut.immediate);

        $display("");

        $display("ALU Control  : %04b", dut.alu_control_signal);
        $display("Operand B    : %0d", dut.operand_b);
        $display("ALU Result   : %0d", dut.alu_result);

        $display("");

        $display("Registers");
        $display("x1 = %0d", dut.rf.registers[1]);
        $display("x2 = %0d", dut.rf.registers[2]);
        $display("x3 = %0d", dut.rf.registers[3]);

    end

    $display("===============================================");
    $finish;

end

endmodule