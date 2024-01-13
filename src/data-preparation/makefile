DATA = ../../data
TEMP = ../../gen/temp

all: $(DATA)/listings.csv $(DATA)/reviews.csv $(TEMP)/aggregated_df.csv

../../data/reviews.csv: download.R
	R --vanilla < download.R

../../data/listings.csv: download.R
	R -e "dir.create('../../data', recursive = TRUE)"
	R --vanilla < download.R

../../gen/temp/aggregated_df.csv: ../../data/listings.csv ../../data/reviews.csv  clean.R
	R -e "dir.create('../../gen/temp', recursive = TRUE)"
	R --vanilla < clean.R
