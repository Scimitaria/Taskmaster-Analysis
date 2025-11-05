options(repos = "https://cran.rstudio.com")
if(!require(coop))install.packages("coop")
library(coop)
source("data.r")

print(cor(all,data["Place"],use="pairwise.complete.obs"))
