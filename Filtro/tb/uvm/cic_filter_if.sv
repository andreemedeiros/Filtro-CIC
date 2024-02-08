interface cic_filter_if(input logic clk);

  parameter DATA_WIDTH = 16;
  logic reset;
  logic [DATA_WIDTH-1:0] data_in;
  logic [DATA_WIDTH-1:0] data_out;

endinterface
