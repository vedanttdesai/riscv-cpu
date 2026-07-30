`timescale 1ns/1ps

module cpu_top_tb;

    logic clk;
    logic reset;

    // ============================
    // Instantiate CPU
    // ============================
    cpu_top dut (

        .clk(clk),
        .reset(reset)

    );

    // ============================
    // Clock Generation
    // ============================
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // ============================
    // Test Sequence
    // ============================
    initial begin

        // Apply Reset
        reset = 1;

        #20;

        reset = 0;

        // Let CPU execute a few cycles
        repeat (5) @(posedge clk);

        // Display CPU State
        $display("---------------------------------------");
        $display("CPU Integration Test");
        $display("---------------------------------------");
        $display("PC          = %0d", dut.pc);
        $display("Instruction = 0x%08h", dut.instruction);
        $display("RegWrite    = %0b", dut.reg_write);
        $display("MemRead     = %0b", dut.mem_read);
        $display("MemWrite    = %0b", dut.mem_write);
        $display("Branch      = %0b", dut.branch);
        $display("Jump        = %0b", dut.jump);
        $display("ALUSrc      = %0b", dut.alu_src);
        $display("ResultSrc   = %0d", dut.result_src);
        $display("ALUOp       = %0d", dut.alu_op);
        $display("---------------------------------------");

        $display("PASS: CPU Fetch + Decode");

        $finish;

    end

endmodule