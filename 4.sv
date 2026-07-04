`include "uvm_macros.svh"
import uvm_pkg::*;

//////////////////////////////////////////////////
class driver extends uvm_driver;

  `uvm_component_utils(driver)   // Register with UVM factory

  // Constructor
  function new(string path, uvm_component parent);
    super.new(path, parent);
  endfunction

  // Driver task
  task run();
    `uvm_info("DRV1", "Executed Driver1 Code", UVM_HIGH);
    `uvm_info("DRV2", "Executed Driver2 Code", UVM_HIGH);
  endtask

endclass

//////////////////////////////////////////////////

module tb;

  driver drv;

  initial begin
    drv = new("DRV", null);                  // Create driver

    drv.set_report_id_verbosity("DRV1", UVM_HIGH); // Set verbosity for DRV1

    drv.run();                               // Execute run task
  end

endmodule
