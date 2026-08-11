module ram_16x8 (
    input  wire       clk,
    input  wire       we,
    input  wire [3:0] addr,
    input  wire [7:0] din,
    output reg  [7:0] dout
);

    // 16 locations, each 8 bits wide
    reg [7:0] mem [0:15];

    // Synchronous RAM
    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;

        dout <= mem[addr];
    end

endmodule