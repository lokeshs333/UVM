//------------------------------------------------------------------------------
// Include the UVM macros file.
// This file contains commonly used UVM macros such as:
// `uvm_info, `uvm_error, `uvm_warning, `uvm_fatal, etc.
//------------------------------------------------------------------------------
`include "uvm_macros.svh"

//------------------------------------------------------------------------------
// Import the entire UVM package.
// This gives access to all UVM classes like uvm_component,
// uvm_test, uvm_driver, uvm_sequence, etc.
//------------------------------------------------------------------------------
import uvm_pkg::*;

//------------------------------------------------------------------------------
// Top-level testbench module.
// Simulation starts from this module.
//------------------------------------------------------------------------------
module tb;

  //--------------------------------------------------------------------------
  // Initial block starts execution at simulation time 0.
  // It runs only once during the entire simulation.
  //--------------------------------------------------------------------------
  initial begin

    // Wait for 50 time units before executing the statements below.
    #50;

    //----------------------------------------------------------------------
    // UVM reporting macro.
    //
    // Syntax:
    // `uvm_info(ID, MESSAGE, VERBOSITY)
    //
    // ID         : Used to identify the source of the message.
    // MESSAGE    : Message to print.
    // VERBOSITY  : Controls whether the message is displayed.
    //----------------------------------------------------------------------
    `uvm_info("TB_TOP", "Hello World", UVM_LOW);

    //----------------------------------------------------------------------
    // Standard SystemVerilog print statement.
    // Always prints the message irrespective of verbosity settings.
    //----------------------------------------------------------------------
    $display("Hello World with Display");

  end

endmodule
