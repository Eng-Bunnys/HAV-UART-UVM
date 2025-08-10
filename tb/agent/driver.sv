// File: tb/agent/driver.sv
class uart_driver extends uvm_driver #(agent_pkg::uart_txn);
  virtual uart_if vif;
  `uvm_component_utils(uart_driver)
  function new(string name, uvm_component parent); super.new(name,parent); endfunction
  virtual function void build_phase(uvm_phase phase);
    if(!uvm_config_db#(virtual uart_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NOVIF","No VIF specified")
    end
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      agent_pkg::uart_txn req;
      seq_item_port.get_next_item(req);
      // drive simple APB-like write/read
      if (req.is_write) begin
        vif.wr_data <= req.data;
        vif.wr_en <= 1;
        @(posedge vif.clk);
        vif.wr_en <= 0;
      end else begin
        vif.rd_en <= 1;
        @(posedge vif.clk);
        vif.rd_en <= 0;
      end
      seq_item_port.item_done();
    end
  endtask
endclass
