`include "uvm_macros.svh"
import uvm_pkg::*;

//////////////////////////////////////////////////
// Driver component demonstrating report logging
// based on message severity.
//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
  
  // Generate reports with different severities
  task run();
    `uvm_info("DRV", "Informational Message", UVM_NONE);
    `uvm_warning("DRV", "Potential Error");
    `uvm_error("DRV", "Real Error");
    `uvm_error("DRV", "Second Real Error");
  endtask
  
endclass

//////////////////////////////////////////////////
// Top-level testbench
// Logs ERROR messages to a file while displaying
// them on the console.
//////////////////////////////////////////////////
module tb;

  driver d;
  int file;
  
  initial begin
    // Open log file
    file = $fopen("log.txt", "w");

    d = new("DRV", null);

    // Log only ERROR reports to the file
    d.set_report_severity_file(UVM_ERROR, file);

    // Log all reports to the same file (optional)
    // d.set_report_default_file(file);

    // Display and log ERROR reports
    d.set_report_severity_action(UVM_ERROR, UVM_DISPLAY | UVM_LOG);

    // Enable logging for INFO/WARNING (optional)
    // d.set_report_severity_action(UVM_INFO, UVM_DISPLAY | UVM_LOG);
    // d.set_report_severity_action(UVM_WARNING, UVM_DISPLAY | UVM_LOG);

    d.run();

    // Close log file
    #10;
    $fclose(file);
  end
  
endmodule
