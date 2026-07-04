`include "uvm_macros.svh"
import uvm_pkg::*;

//////////////////////////////////////////////////
// Driver component demonstrating severity override
// using a specific report ID.
//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
  // Generate reports with different severity levels
  task run();
    `uvm_info("DRV", "Informational Message", UVM_NONE);
    `uvm_warning("DRV", "Potential Error");
    `uvm_error("DRV", "Real Error");

    #10;
    `uvm_fatal("DRV", "Simulation cannot continue DRV1");

    #10;
    `uvm_fatal("DRV1", "Simulation Cannot Continue DRV1");
  endtask
  
endclass

//////////////////////////////////////////////////
// Top-level testbench
// Overrides the FATAL severity to ERROR only for
// report ID "DRV", allowing simulation to continue.
//////////////////////////////////////////////////
module tb;

  driver d;
  
  initial begin
    d = new("DRV", null);

    // Override FATAL to ERROR for report ID "DRV"
    d.set_report_severity_id_override(UVM_FATAL, "DRV", UVM_ERROR);

    // Override all FATAL reports (optional)
    // d.set_report_severity_override(UVM_FATAL, UVM_ERROR);

    d.run();
  end
  
endmodule
