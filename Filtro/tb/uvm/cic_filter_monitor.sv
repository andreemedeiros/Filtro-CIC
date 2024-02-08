`include "uvm_macros.svh"
import uvm_pkg::*;
`include "cic_filter_transaction.sv"
`include "cic_filter_if.sv"

class cic_filter_monitor extends uvm_monitor;
  `uvm_component_utils(cic_filter_monitor)

  virtual cic_filter_if vif;
  uvm_analysis_port #(cic_filter_transaction) analysis_port;

  // Construtor, build_phase, e run_phase devem ser definidos aqui

endclass

