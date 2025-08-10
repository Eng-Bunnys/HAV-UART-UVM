// File: tb/sequences/uart_sequences.sv
class basic_write_read_seq extends uvm_sequence #(agent_pkg::uart_txn);
  `uvm_object_utils(basic_write_read_seq)
  function new(string name = "basic_write_read_seq"); super.new(name); endfunction
  task body();
    agent_pkg::uart_txn tx;
    tx = agent_pkg::uart_txn::type_id::create("tx");
    tx.data = 8'hA5; tx.is_write = 1;
    start_item(tx); finish_item(tx);
    // read back
    agent_pkg::uart_txn rd = agent_pkg::uart_txn::type_id::create("rd");
    rd.is_write = 0;
    start_item(rd); finish_item(rd);
  endtask
endclass
