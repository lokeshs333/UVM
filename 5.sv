`include "uvm_macros.svh"
import uvm_pkg::*;

//////////////////////////////////////////////////
// Driver component to demonstrate UVM reporting
//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
  // Generate driver-specific UVM messages
  task run();
    `uvm_info("DRV1", "Executed Driver1 Code", UVM_HIGH);
    `uvm_info("DRV2", "Executed Driver2 Code", UVM_HIGH);
  endtask
  
endclass

//////////////////////////////////////////////////
// Environment component to demonstrate UVM reporting
//////////////////////////////////////////////////
class env extends uvm_env;
  `uvm_component_utils(env)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
  // Generate environment-specific UVM messages
  task run();
    `uvm_info("ENV1", "Executed ENV1 Code", UVM_HIGH);
    `uvm_info("ENV2", "Executed ENV2 Code", UVM_HIGH);
  endtask
  
endclass

//////////////////////////////////////////////////
// Top-level testbench
// Creates the driver and environment, then
// executes their run tasks to print UVM messages.
//////////////////////////////////////////////////
module tb;
  
  driver drv;
  env e;
  
  initial begin
    drv = new("DRV", null);
    e   = new("ENV", null);

    // Uncomment to enable HIGH verbosity for ENV
    // e.set_report_verbosity_level(UVM_HIGH);

    drv.run();
    e.run();
  end
  
endmodule
