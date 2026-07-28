`timescale 1ns/1ps

module immediate_generator_tb;

logic [31:0] instruction;
logic [31:0] immediate;

immediate_generator dut (
    .instruction(instruction),
    .immediate(immediate)
);

initial begin

    // I-Type (ADDI x0, x0, 10)
    instruction = 32'h00A00013;
    #1;
    if (immediate !== 32'd10)
        $fatal("I-Type failed");

    // S-Type (imm = 8)
    instruction = 32'h00002423;
    #1;
    if (immediate !== 32'd8)
        $fatal("S-Type failed");

    // U-Type (LUI)
    instruction = 32'h12345037;
    #1;
    if (immediate !== 32'h12345000)
        $fatal("U-Type failed");

    // J-Type (JAL with offset 0)
    instruction = 32'h0000006F;
    #1;
    if (immediate !== 32'd0)
        $fatal("J-Type failed");

    $display("PASS: Immediate Generator");
    $finish;

end

endmodule