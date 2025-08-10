// File: tb/scoreboard/scoreboard.sv
class uart_scoreboard extends uvm_component;
  uvm_analysis_export#(agent_pkg::uart_txn) ap;
  `uvm_component_utils(uart_scoreboard)
  function new(string name, uvm_component parent); super.new(name,parent); ap = new("ap", this); endfunction
  function void write(agent_pkg::uart_txn t);
    // For demo: simply report observed transactions
    `uvm_info("SCORE","Observed txn: data=0x%0h write=%0d", UVM_LOW, {t.data, t.is_write});
  endfunction
endclass
