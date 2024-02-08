`include "uvm_macros.svh"
import uvm_pkg::*;

class CicFilterSequencer extends uvm_sequencer #(CicFilterTransaction);
  `uvm_component_utils(CicFilterSequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
endclass
