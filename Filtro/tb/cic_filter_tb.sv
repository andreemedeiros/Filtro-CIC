// Testbench de verificação para o filtro
module cic_filter_tb;

    // Parâmetros do Testbench
    parameter DATA_WIDTH = 16;
    parameter CLK_PERIOD = 10; // Período do clock em ns

    // Sinais do Testbench
    logic clk;
    logic reset;
    logic [DATA_WIDTH-1:0] data_in;
    logic [DATA_WIDTH-1:0] data_out;

    // Variável para o arquivo
    int file;

    // Instância do Filtro CIC
    cic_filter #(.DATA_WIDTH(DATA_WIDTH)) dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Geração do Clock
    always #(CLK_PERIOD/2) clk = ~clk;

    // Testes e Registro de Dados
    initial begin
        clk = 0;
        reset = 1;
        data_in = 0;
        #(2 * CLK_PERIOD);
        reset = 0;

        // Abrindo o arquivo para gravação
        file = $fopen("resultado_simulacao.txt", "w");

        // Teste com Sinal de Impulso
        data_in = 1;
        #(CLK_PERIOD);
        $fwrite(file, "Tempo: %0t, Valor de Saída: %0d\n", $time, data_out);
        data_in = 0;
        #(10 * CLK_PERIOD); // Espera para observar a resposta

        // Teste com Sinal de Degrau
        data_in = 1 << (DATA_WIDTH - 1); // Valor máximo para DATA_WIDTH bits
        #(20 * CLK_PERIOD);
        $fwrite(file, "Tempo: %0t, Valor de Saída: %0d\n", $time, data_out);
        data_in = 0;
        #(10 * CLK_PERIOD); // Espera para observar a resposta

        // Teste com Sinal Senoidal
        real sin_arg;
        repeat (100) begin
            sin_arg = 2 * 3.14159 * 1e-3 * $time;
            data_in = $signed($rtoi(DATA_WIDTH'sd32767 * sin(sin_arg)));
            #(CLK_PERIOD);
            $fwrite(file, "Tempo: %0t, Valor de Saída: %0d\n", $time, data_out);
        end

        // Teste com Ruído Branco
        repeat (100) begin
            data_in = $urandom;
            #(CLK_PERIOD);
            $fwrite(file, "Tempo: %0t, Valor de Saída: %0d\n", $time, data_out);
        end

        // Fechando o arquivo
        $fclose(file);

        // Finaliza a simulação
        $finish;
    end

endmodule
