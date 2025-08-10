// File: rtl/uart.sv
// Small UART: configurable baud ticks, transmitter and receiver
module uart #(
  parameter CLK_FREQ = 50_000_000,
  parameter BAUD = 115200
)(
  input  logic clk,
  input  logic rst_n,
  // APB-lite style registers (very small)
  input  logic [7:0]  wr_data,
  input  logic        wr_en,
  input  logic        rd_en,
  output logic [7:0] rd_data,
  // serial
  output logic tx,
  input  logic  rx
);
  // a very small tx only part and echo back for simplicity
  logic [7:0] tx_shift;
  logic [3:0] tx_cnt;
  logic tx_busy;

  assign rd_data = tx_shift; // simple readback

  // Write to tx shift when wr_en
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      tx_shift <= 8'h0;
      tx_cnt <= 0;
      tx_busy <= 0;
      tx <= 1'b1; // idle high
    end else begin
      if (wr_en && !tx_busy) begin
        tx_shift <= wr_data;
        tx_cnt <= 0;
        tx_busy <= 1'b1;
      end else if (tx_busy) begin
        // shift out bit-by-bit with a slow down counter
        if (tx_cnt < 9) begin
          // simplified: toggle tx every N clocks (not accurate baud gen)
          tx <= (tx_cnt==0) ? 0 : tx_shift[0];
          tx_shift <= {1'b1, tx_shift[7:1]};
          tx_cnt <= tx_cnt + 1;
        end else begin
          tx_busy <= 0;
          tx <= 1'b1;
        end
      end
    end
  end
endmodule
