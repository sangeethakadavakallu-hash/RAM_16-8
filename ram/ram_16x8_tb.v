`timescale 1ns/1ps

module ram_16x8_tb;

    reg        clk;
    reg        we;
    reg [3:0]  addr;
    reg [7:0]  din;
    wire [7:0] dout;

    // Instantiate RAM
    ram_16x8 uut (
        .clk  (clk),
        .we   (we),
        .addr (addr),
        .din  (din),
        .dout (dout)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin

        // Create VCD file for waveform viewing
        $dumpfile("ram_16x8.vcd");
        $dumpvars(0, ram_16x8_tb);

        // Initial values
        clk  = 0;
        we   = 0;
        addr = 0;
        din  = 0;

        // -------------------------
        // Write 0xA5 to address 3
        // -------------------------
        #10;
        we   = 1;
        addr = 4'd3;
        din  = 8'hA5;

        #10;

        // -------------------------
        // Write 0x5A to address 7
        // -------------------------
        addr = 4'd7;
        din  = 8'h5A;

        #10;

        // -------------------------
        // Stop writing
        // -------------------------
        we = 0;

        // Read address 3
        addr = 4'd3;

        #10;

        if (dout == 8'hA5)
            $display("PASS: Address 3 contains A5");
        else
            $display("FAIL: Address 3 contains %h", dout);

        // Read address 7
        addr = 4'd7;

        #10;

        if (dout == 8'h5A)
            $display("PASS: Address 7 contains 5A");
        else
            $display("FAIL: Address 7 contains %h", dout);

        // Read another address
        addr = 4'd3;

        #10;

        $display("Simulation completed.");
        $finish;

    end

endmodule