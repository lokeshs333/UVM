`include "uvm_macros.svh"
import uvm_pkg::*;

//////////////////////////////////////////////////
// Driver component to generate UVM report messages
//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
  // Print a driver report message
  task run();
    `uvm_info("DRV", "Executed Driver Code", UVM_HIGH);
  endtask
  
endclass

//////////////////////////////////////////////////
// Monitor component to generate UVM report messages
//////////////////////////////////////////////////
class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
  // Print a monitor report message
  task run();
    `uvm_info("MON", "Executed Monitor Code", UVM_HIGH);
  endtask
  
endclass

//////////////////////////////////////////////////
// Environment containing the driver and monitor
//////////////////////////////////////////////////
class env extends uvm_env;
  `uvm_component_utils(env)
  
  driver drv;
  monitor mon;
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
  // Create child components and execute them
  task run();
    drv = new("DRV", this);
    mon = new("MON", this);
    drv.run();
    mon.run();
  endtask
  
endclass

//////////////////////////////////////////////////
// Top-level testbench
// Applies HIGH verbosity to the entire environment
// hierarchy and executes the environment.
//////////////////////////////////////////////////
module tb;
  
  env e;
  
  initial begin
    e = new("ENV", null);

    // Apply HIGH verbosity to ENV and all child components
    e.set_report_verbosity_level_hier(UVM_HIGH);

    e.run();
  end
  
endmodule
