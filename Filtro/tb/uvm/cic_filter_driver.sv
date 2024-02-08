`include "uvm_macros.svh"
import uvm_pkg::*;
`include "cic_filter_transaction.sv"
`include "cic_filter_if.sv"

class cic_filter_driver extends uvm_driver #(cic_filter_transaction);
  `uvm_component_utils(cic_filter_driver)

  virtual cic_filter_if vif;

  // Construtor, build_phase, e run_phase devem ser definidos aqui

endclass
