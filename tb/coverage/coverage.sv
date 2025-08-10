// File: tb/coverage/coverage.sv
covergroup uart_cg @(posedge clk);
  coverpoint some_signal {
    bins zero = {0};
    bins ones = {1};
  }
endgroup
