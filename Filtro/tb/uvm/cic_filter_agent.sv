`include "uvm_macros.svh"
import uvm_pkg::*;
`include "cic_filter_monitor.sv"
`include "cic_filter_driver.sv"

class cic_filter_agent extends uvm_agent;
  `uvm_component_utils(cic_filter_agent)

  cic_filter_driver driver;
  cic_filter_monitor monitor;

  // Construtor, build_phase, e connect_phase devem ser definidos aqui

endclass
