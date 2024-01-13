DATA = ../../data
TEMP = ../../gen/temp
OUTPUT = = ../../gen/output

all: $(TEMP)/pivot_table.csv $(OUTPUT)/plot_Antwerp.pdf $(OUTPUT)/plot_all.pdf

$(TEMP)/pivot_table.csv: $(TEMP)/aggregated_df.csv pivot_table.R
	R -e "dir.create('../../gen/output', recursive = TRUE)"
	R --vanilla < pivot_table.R

$(OUTPUT)/plot_Antwerp.pdf: $(TEMP)/pivot_table.csv plot_antwerp.R
	R --vanilla < plot_antwerp.R

$(OUTPUT)/plot_all.pdf: $(TEMP)/aggregated_df.csv plot_all.R
	R --vanilla < plot_all.R