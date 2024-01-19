# Makefile para compilar e executar com o xrun

# Caminho para a pasta Filtro
FILTRO_PATH = Filtro

# Caminho para a pasta rtl
RTL_PATH = Filtro/rtl

# Caminho para a pasta tb
TB_PATH = Filtro/tb

# Caminho para a pasta plot
PY_PATH = Filtro/plot

# Nome do arquivo RTL 
RTL_FILE = $(RTL_PATH)/cic_filter.sv

# Nome do arquivo testbench
TB_FILE = $(TB_PATH)/cic_filter_tb.sv

# Nome dos arquivos Python
PY_FILES = cic_filter_analysis.py

# Define a regra "all" para compilar e executar
all: xrun plot_results

# Comando para compilar e executar
xrun:
	xrun -sv -incdir $(RTL_PATH) $(RTL_FILE) $(TB_FILE)

# Comando para executar o script Python após a simulação
plot_results: xrun
	cd $(PY_PATH); \
	python $(PY_FILES)

# Comando para limpar arquivos temporários
clean:
	cd $(FILTRO_PATH); \
	rm -rf INCA_libs xcelium.d simv simv.daidir csrc ucli.key xrun.history

# Define a regra padrão quando "make" é executado sem argumentos
.DEFAULT_GOAL := all
