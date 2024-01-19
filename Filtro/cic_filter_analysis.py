# Importando as bibliotecas necessárias
from pyvcd import VCDReader
import matplotlib.pyplot as plt

# Definindo a função para ler o arquivo VCD
def ler_arquivo_vcd(caminho_do_arquivo):
    dados_vcd = []
    with open(caminho_do_arquivo, 'r') as arquivo:
        leitor_vcd = VCDReader(arquivo)
        for timestamp, sinais in leitor_vcd:
            dados_temporais = {"timestamp": timestamp}
            for sinal in sinais:
                dados_temporais[sinal] = sinais[sinal]
            dados_vcd.append(dados_temporais)
    return dados_vcd

# Definindo a função para plotar os dados do VCD
def plotar_dados_vcd(dados_vcd, nome_sinal):
    # Preparando os dados para plotagem
    timestamps = [dado["timestamp"] for dado in dados_vcd]
    valores_sinal = [dado[nome_sinal] for dado in dados_vcd if nome_sinal in dado]

    # Criando o gráfico
    plt.figure(figsize=(10, 6))
    plt.plot(timestamps, valores_sinal, label=nome_sinal)
    plt.title(f'Gráfico do Sinal {nome_sinal} ao Longo do Tempo')
    plt.xlabel('Timestamp')
    plt.ylabel('Valor do Sinal')
    plt.legend()
    plt.show()

# Uso das funções
caminho_do_arquivo_vcd = r'C:\Users\Pessoal\Desktop\CloneGitHub\Filtro_CIC\Filtro\cic_filter_output.vcd'
dados_lidos = ler_arquivo_vcd(caminho_do_arquivo_vcd)

# Substitua 'sinal_exemplo' pelo nome real do sinal no arquivo VCD
nome_do_sinal = 'sinal_exemplo'
plotar_dados_vcd(dados_lidos, nome_do_sinal)
