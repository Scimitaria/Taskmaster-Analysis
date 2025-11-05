options(repos = "https://cran.rstudio.com")
if(!require(coop))install.packages("coop")
library(coop)
source("data.r")

#TODO: put in a scatterplot
correlation <- (cor(all,data["Place"],use="pairwise.complete.obs"))
sorted <- correlation[rev(order(abs(correlation[,"Place"]))),,drop=FALSE]
filtered <- correlation[which(abs(correlation)>0.2),,drop=FALSE]
sorted_and_filtered <- sorted[which(abs(sorted)>0.2),,drop=FALSE]
print(sorted_and_filtered)
