# Arquivo para gerar o gráfico de análise

# Importando as bibliotecas necessárias
import matplotlib.pyplot as plt
import numpy as np

# Caminho para o arquivo de resultados da simulação no diretório pai
result_file_path = "../tb/resultado_simulacao.txt" 

# Função para ler os dados do arquivo de texto
def read_simulation_results(file_path):
    times = []
    values = []
    with open(file_path, 'r') as file:
        for line in file:
            if 'x' in line or 'Valor de Saída' in line:
                # Ignora linhas que não contêm dados numéricos ou que contenham 'x'
                continue
            parts = line.split(',')
            if len(parts) == 2:
                time_str = parts[0].split(':')[1].strip()
                value_str = parts[1].split(':')[1].strip()
                if value_str.isdigit():
                    times.append(float(time_str))
                    values.append(int(value_str))
    return np.array(times), np.array(values)

# Ler os dados do arquivo
times, values = read_simulation_results(result_file_path)

# Usando stem para plotar os dados
plt.stem(times, values)
plt.title('Resposta do Filtro CIC')
plt.xlabel('Tempo (unidades de simulação)')
plt.ylabel('Valor de Saída')
plt.grid(True)
plt.show()
