options(repos = "https://cran.rstudio.com")
if(!require(coop))install.packages("coop")
library(coop)

#extract Taskmaster data from csv into dataframe
data <- read.csv("taskmaster25.csv")
