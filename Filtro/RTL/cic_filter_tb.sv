// Testbench de verificação para o filtro
module cic_filter_tb;
    // Parâmetros de teste e sinais
    parameter DATA_WIDTH = 16;
    parameter DECIMATION_FACTOR = 4;
    parameter CLK_PERIOD = 10; // Período de clock em ns
    parameter NUM_SAMPLES = 1000; // Número de amostras para o teste

    logic clk;
    logic reset;
    logic [DATA_WIDTH-1:0] data_in;
    logic [DATA_WIDTH-1:0] data_out;

    // Instância do filtro CIC
    cic_filter #(.DATA_WIDTH(DATA_WIDTH), .DECIMATION_FACTOR(DECIMATION_FACTOR))
        dut (.clk(clk), .reset(reset), .data_in(data_in), .data_out(data_out));

    // Geração do clock
    always #(CLK_PERIOD/2) clk = ~clk;

    // Manipulador de arquivo para escrita de resultados
    integer file_handle;

    initial begin
        // Inicializações
        clk = 0;
        reset = 1;
        data_in = 0;
        file_handle = $fopen("resultado_simulacao.txt", "w");
        if (file_handle == 0) begin
            $display("Erro ao abrir o arquivo.");
            $finish;
        end
        #(2*CLK_PERIOD);
        reset = 0;

        // Estímulos de teste
        repeat (NUM_SAMPLES) begin
            data_in = $random;  // Gera um valor aleatório para data_in
            #(CLK_PERIOD);
        end

        // Fechando o arquivo e terminando a simulação
        #(CLK_PERIOD * 100); // Espera um tempo adicional após o último estímulo
        $fclose(file_handle);
        $finish;
    end

    // Escreve os dados de saída no arquivo a cada borda de subida do clock
    always @(posedge clk) begin
        $fwrite(file_handle, "Tempo: %0t, Valor de Saída: %0d\n", $time, data_out);
    end
endmodule
