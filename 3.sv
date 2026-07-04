`include "uvm_macros.svh"   // UVM macros
import uvm_pkg::*;          // Import UVM package

module tb;

  initial begin
    // Set global verbosity level
    uvm_top.set_report_verbosity_level(UVM_HIGH);

    // Display current verbosity level
    $display("Default Verbosity level : %0d",
             uvm_top.get_report_verbosity_level);

    // Print message with HIGH verbosity
    `uvm_info("TB_TOP", "String", UVM_HIGH);
  end

endmodule
