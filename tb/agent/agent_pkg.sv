package agent_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"
// Define transaction class
class uart_txn extends uvm_sequence_item;
  rand bit [7:0] data;
  rand bit is_write;
  `uvm_object_utils(uart_txn)
  function new(string name="uart_txn"); super.new(name); endfunction
endclass
endpackage
