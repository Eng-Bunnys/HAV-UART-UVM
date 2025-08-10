// File: tb/regmodel/uart_regmodel.sv
class uart_reg_block extends uvm_reg_block;
  `uvm_object_utils(uart_reg_block)
  function new(string name = "uart_reg_block"); super.new(name); endfunction
  virtual function void build();
    // minimal example: actual uvm_reg definitions left as exercise
  endfunction
endclass
