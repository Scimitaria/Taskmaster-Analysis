options(repos = "https://cran.rstudio.com")
if(!require(coop))install.packages("coop")
library(coop)

#extract Taskmaster data from csv into dataframe
data <- read.csv("taskmaster25.csv")

numerics <- data[c("Prize","Subjective","Objective","Fastest","Live",
                   "Team","Highest","Lowest","Age","GregHarshnessRating",
                   "Seat","Height","Children","Books","Helped",
                   "RefusedHelp")]
#Excluded due to trivial correlation: Winner,PPT,Place
#Almost numeric: Siblings
#String: BirthOrder,SecondLanguage,OutfitColor,Diet,FacialHair,HairColour,ChineseYear
#Boolish: Language,ComedyAward,Headwear,Handedness,Gender
print(cor(numerics,data["Place"],use="complete.obs"))#could also use a numeric conversion of Winner
