# Setup 
library(tidyverse)

# PLOT ANTWERP 

# Input # 
## import the data from `gen/analysis/pivot_table`
df_pivot <- read_csv("pivot_table.csv")

pdf("plot_Antwerp.pdf")
plot(x = df_pivot$date, 
     y = df_pivot$Stadspark, 
     col = "red", 
     type = "l", 
     xlab = "",
     ylab = "Total number of reviews", 
     main = "Effect of COVID-19 pandemic on Airbnb review count")


lines(df_pivot$date, df_pivot$`Sint-Andries`, col="blue")
lines(df_pivot$date, df_pivot$`Centraal Station`, col="green")

legend("topleft", c("Stadspark", "Sint Andries", "Centraal Station"), fill=c("red", "blue", "green"))
dev.off()
