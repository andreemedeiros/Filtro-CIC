/*-----------------------------------------------------------------
Autor         : André Medeiros
Criação       : 10/01/24
E-mail        : andre.escariao1@gmail.com
Arquivo       : cic_filter.sv

Descrição     : Filtro CIC implementado em SystemVerilog com resposta
temporal de simulação (ao impulso e a uma entrada arbitrária) e resposta
em frequência.
------------------------------------------------------------------*/

module cic_filter #(
    parameter DATA_WIDTH = 16,   // Largura dos dados de entrada/saída
    parameter DECIMATION_FACTOR = 4  // Fator de decimação
)(
    input logic clk,                // Clock
    input logic reset,              // Reset
    input logic [DATA_WIDTH-1:0] data_in,  // Dado de entrada
    output logic [DATA_WIDTH-1:0] data_out // Dado de saída
);

    // Variáveis internas para o estágio de integrador e comb
    logic [DATA_WIDTH-1:0] integrator;
    logic [DATA_WIDTH-1:0] comb;
    logic [DATA_WIDTH-1:0] comb_delayed [0:DECIMATION_FACTOR-1];

    // Processo de integração
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            integrator <= 0;
        end else begin
            integrator <= integrator + data_in;
        end
    end

    // Processo de decimação e comb
    integer i;
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < DECIMATION_FACTOR; i++) begin
                comb_delayed[i] <= 0;
            end
            comb <= 0;
        end else begin
            comb <= integrator - comb_delayed[DECIMATION_FACTOR-1];
            for (i = DECIMATION_FACTOR-1; i > 0; i--) begin
                comb_delayed[i] <= comb_delayed[i-1];
            end
            comb_delayed[0] <= integrator;
        end
    end

    // Atribuir saída
    always_ff @(posedge clk) begin
        data_out <= comb;
    end

endmodule
