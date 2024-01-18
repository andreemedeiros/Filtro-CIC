# Arquivo em Python para plotar os dados em um gráfico

import matplotlib.pyplot as plt
import vcd_parser  # Uma biblioteca hipotética para analisar arquivos VCD

# Carregar dados do arquivo VCD
data = vcd_parser.load("cic_filter_output.vcd")

# Plotar a resposta temporal
plt.plot(data['time'], data['data_out'])
plt.title("Resposta Temporal do Filtro CIC")
plt.xlabel("Tempo")
plt.ylabel("Amplitude")
plt.show()

# Para a resposta em frequência, você pode aplicar FFT aos dados
