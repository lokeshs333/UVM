`include "uvm_macros.svh"
import uvm_pkg::*;

//////////////////////////////////////////////////
// Driver component demonstrating UVM quit count.
// Simulation stops once the maximum error count
// reaches the configured limit.
//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
  // Generate INFO, WARNING and multiple ERROR reports
  task run();
    `uvm_info("DRV", "Informational Message", UVM_NONE);
    `uvm_warning("DRV", "Potential Error");
    `uvm_error("DRV", "Real Error");
    `uvm_error("DRV", "Second Real Error");

    /*
    // Uncomment to observe FATAL behavior
    #10;
    `uvm_fatal("DRV", "Simulation cannot continue DRV1");

    #10;
    `uvm_fatal("DRV1", "Simulation Cannot Continue DRV1");
    */
  endtask
  
endclass

//////////////////////////////////////////////////
// Top-level testbench
// Sets the maximum quit count and executes
// the driver.
//////////////////////////////////////////////////
module tb;

  driver d;
  
  initial begin
    d = new("DRV", null);

    // Stop simulation after 3 quit-count reports
    d.set_report_max_quit_count(3);

    d.run();
  end
  
endmodule
