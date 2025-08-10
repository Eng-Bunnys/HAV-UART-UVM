// File: tb/interfaces.sv
interface uart_if(input logic clk, input logic rst_n);
  logic tx; // DUT serial out
  logic rx; // DUT serial in
  // APB-lite style reg access signals (simple)
  logic [7:0] wr_data;
  logic       wr_en;
  logic       rd_en;
  logic [7:0] rd_data;
endinterface
