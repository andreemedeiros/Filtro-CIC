`include "uvm_macros.svh"
import uvm_pkg::*;
`include "cic_filter_env.sv"

class cic_filter_test extends uvm_test;
  `uvm_component_utils(cic_filter_test)

  cic_filter_env env;

  function new(string name = "cic_filter_test", uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = cic_filter_env::type_id::create("env", this);
  endfunction

  // Defina run_phase se necessário
endclass
