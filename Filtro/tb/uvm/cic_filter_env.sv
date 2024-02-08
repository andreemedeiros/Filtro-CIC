`include "uvm_macros.svh"
import uvm_pkg::*;
`include "cic_filter_agent.sv"
`include "cic_filter_scoreboard.sv"

class cic_filter_env extends uvm_env;
  `uvm_component_utils(cic_filter_env)

  cic_filter_agent agent;
  cic_filter_scoreboard scoreboard;

  function new(string name = "cic_filter_env", uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = cic_filter_agent::type_id::create("agent", this);
    scoreboard = cic_filter_scoreboard::type_id::create("scoreboard", this);
  endfunction

endclass


