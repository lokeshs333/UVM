`include "uvm_macros.svh"
import uvm_pkg::*;

//////////////////////////////////////////////////
// Driver component demonstrating different UVM
// report macros and their severity levels.
//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
  // Generate INFO, WARNING, ERROR and FATAL reports
  task run();
    `uvm_info("DRV", "Informational Message", UVM_NONE);
    `uvm_warning("DRV", "Potential Error");
    `uvm_error("DRV", "Real Error");
    #10;
    `uvm_fatal("DRV", "Simulation cannot continue");
  endtask
  
endclass

//////////////////////////////////////////////////
// Top-level testbench
// Creates the driver and executes the reporting
// example.
//////////////////////////////////////////////////
module tb;

  driver d;
  
  initial begin
    d = new("DRV", null);
    d.run();
  end
  
endmodule
