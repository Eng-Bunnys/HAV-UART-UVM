// File: tb/tb_top.sv
`include "uvm_macros.svh"
import uvm_pkg::*;

module tb_top;
  logic clk;
  logic rst_n;
  uart_if dut_if(.clk(clk), .rst_n(rst_n));

  // DUT
  uart dut (
    .clk(clk), .rst_n(rst_n),
    .wr_data(dut_if.wr_data), .wr_en(dut_if.wr_en), .rd_en(dut_if.rd_en), .rd_data(dut_if.rd_data),
    .tx(dut_if.tx), .rx(dut_if.rx)
  );

  // simple clock
  initial clk = 0; always #10 clk = ~clk;

  initial begin
    rst_n = 0; repeat (10) @(posedge clk); rst_n = 1;
    // run UVM
    run_test();
  end
endmodule
