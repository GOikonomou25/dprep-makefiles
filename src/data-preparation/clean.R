# Setup
library(tidyverse)

# CLEAN DATA 

# Input#
reviews <- read_csv("../../data/reviews.csv")
listings <- read_csv("../../data/listings.csv")

# Transformation #
## filter for reviews published since 01/01/2015
reviews_filtered <- reviews %>% filter(date > "2015-01-01")

## filter for `listings` that have received at least 1 review.
listings_filtered <- listings %>% filter(number_of_reviews > 1)

## merge the `reviews` and `listings` dataframes on a common columns (the type of join doesn't really matter since we already filtered out listings without any reviews)
df_merged <- reviews_filtered %>% inner_join(listings_filtered, by = c("listing_id" = "id"))

## group the number of reviews by month and neighborhood.
df_grouped <- df_merged %>%
  mutate(month = format(date, "%m"), year = format(date, "%Y")) %>%
  group_by(year, month, neighbourhood) %>%
  summarise(num_reviews = n())

## create date column
df_grouped <- df_grouped %>% mutate(date = as.Date(paste0(year, "-", month, "-01")))

# Output #
## store the final data frame in `gen/data-preparation` as `aggregated_df.csv`
write_csv(df_grouped, "../../gen/temp/aggregated_df.csv")