# Makefile para compilar e executar com o xrun

# Caminho para a pasta Filtro
FILTRO_PATH = Filtro

# Caminho para a pasta RTL
RTL_PATH = Filtro/RTL

# Caminho para a pasta Plot
PLOT_PATH = Filtro/Plot

# Nome dos arquivos SV (coloque os nomes reais aqui)
SV_FILES = cic_filter.sv cic_filter_tb.sv

# Nome dos arquivos Python
PY_FILES = cic_filter_analysis.py

# Define a regra "all" para compilar e executar
all: xrun plot_results

# Comando para compilar e executar
xrun:
	cd $(RTL_PATH); \
	xrun -sv $(SV_FILES)

# Comando para executar o script Python após a simulação
plot_results: xrun
	cd $(PLOT_PATH); \
	python $(PY_FILES)

# Comando para limpar arquivos temporários
clean:
	cd $(FILTRO_PATH); \
	rm -rf INCA_libs xcelium.d simv simv.daidir csrc ucli.key xrun.history

# Define a regra padrão quando "make" é executado sem argumentos
.DEFAULT_GOAL := all
