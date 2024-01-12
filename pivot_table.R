# Setup
library(tidyverse)
library(reshape2)

# CREATE PIVOT TABLE

# Input # 
## import the data from `gen/data-preparation/aggregated_df.csv`
df <- read_csv("aggregated_df.csv")

# Transformation #
## create pivot table 
df_pivot <- df %>% reshape2::dcast(date ~ neighbourhood, fun.aggregate = sum, value.var = "num_reviews")

# Output #
## export results
write_csv(df_pivot, "pivot_table.csv")
