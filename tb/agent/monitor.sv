// File: tb/agent/monitor.sv
class uart_monitor extends uvm_monitor;
  virtual uart_if vif;
  uvm_analysis_port#(agent_pkg::uart_txn) ap;
  `uvm_component_utils(uart_monitor)
  function new(string name, uvm_component parent); super.new(name,parent); ap = new("ap", this); endfunction
  virtual function void build_phase(uvm_phase phase);
    if(!uvm_config_db#(virtual uart_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NOVIF","No VIF specified")
    end
  endfunction
  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      // sample simplistic: if rd_en or wr_en, create txn
      if (vif.wr_en) begin
        agent_pkg::uart_txn t = agent_pkg::uart_txn::type_id::create("t");
        t.data = vif.wr_data;
        t.is_write = 1;
        ap.write(t);
      end
      if (vif.rd_en) begin
        agent_pkg::uart_txn t = agent_pkg::uart_txn::type_id::create("t");
        t.data = vif.rd_data;
        t.is_write = 0;
        ap.write(t);
      end
    end
  endtask
endclass
