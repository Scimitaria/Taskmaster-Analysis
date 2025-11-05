options(repos = "https://cran.rstudio.com")
if(!require(coop))install.packages("coop")
library(coop)
source("data.r")

#TODO: filter insignificant values?, put in a scatterplot
correlation <- (cor(year,data["Place"],use="pairwise.complete.obs"))
print(correlation[order(abs(correlation[,"Place"])),,drop=FALSE])
