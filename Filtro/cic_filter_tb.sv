// Testbench de verificação para o filtro
module cic_filter_tb;

    parameter DATA_WIDTH = 16;
    parameter DECIMATION_FACTOR = 4;
    parameter CLK_PERIOD = 10; // Clock period in ns
    parameter NUM_SAMPLES = 1000; // Number of samples for the test

    logic clk;
    logic reset;
    logic [DATA_WIDTH-1:0] data_in;
    logic [DATA_WIDTH-1:0] data_out;

    // Instância do filtro CIC
    cic_filter #(.DATA_WIDTH(DATA_WIDTH), .DECIMATION_FACTOR(DECIMATION_FACTOR))
        dut (.clk(clk), .reset(reset), .data_in(data_in), .data_out(data_out));

    // Geração do clock
    always #(CLK_PERIOD/2) clk = ~clk;

    // Aplicar impulso e sinais arbitrários
    integer i;
    initial begin
        clk = 0;
        reset = 1;
        data_in = 0;
        #(2*CLK_PERIOD);
        reset = 0;

        // Aplicar um impulso
        data_in = 1;
        #(CLK_PERIOD);
        data_in = 0;
        
        // Aplicar sinais arbitrários
        for (i = 0; i < NUM_SAMPLES; i++) begin
            data_in = $random;
            #(CLK_PERIOD);
        end
    end

    // Registro da saída em um arquivo
    initial begin
        $dumpfile("cic_filter_output.vcd");
        $dumpvars(0, cic_filter_tb);
    end

endmodule
