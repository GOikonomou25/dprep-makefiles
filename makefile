all: plot_Antwerp.pdf plot_all.pdf aggregated_df.csv pivot_table.csv listings.csv reviews.csv

plot_Antwerp.pdf: plot_Antwerp.R pivot_table.csv
	R --vanilla < plot_Antwerp.R

plot_all.pdf: plot_all.R aggregated_df.csv
	R --vanilla < plot_all.R

pivot_table.csv: pivot_table.R aggregated_df.csv
	R --vanilla < pivot_table.R

aggregated_df.csv: clean.R listings.csv reviews.csv
	R --vanilla < clean.R

listings.csv reviews.csv: download.R
	R --vanilla < download.R
