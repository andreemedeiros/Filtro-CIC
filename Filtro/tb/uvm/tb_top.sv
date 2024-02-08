//`include "uvm_macros.svh"
//import uvm_pkg::*;
//`include "cic_filter_if.sv"
//`include "cic_filter.sv"
//`include "CicFilterEnv.sv"
//`include "CicFilterTest.sv"

//`timescale 1ns/1ns

module top;

  bit clk = 0;
  always #5 clk = !clk; // Clock de 100MHz

  cic_filter_if dut_vif(clk);

  cic_filter dut(
    .clk(dut_vif.clk),
    .reset(dut_vif.reset),
    .data_in(dut_vif.data_in),
    .data_out(dut_vif.data_out)
  );

  initial begin
    // Conectar a interface virtual com a configuração UVM
    uvm_config_db#(virtual cic_filter_if)::set(null, "*", "vif", dut_vif);
    // Iniciar o teste UVM
    run_test();
  end

endmodule
