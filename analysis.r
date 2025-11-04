options(repos = "https://cran.rstudio.com")
if(!require(coop))install.packages("coop")
library(coop)

#If an element is a feature, change to one, otherwise change it to 0
#This allows correlation checking between non-numeric values
numericize <- function(lst,cond){
    as.numeric(lst == cond)
}

#extract Taskmaster data from csv into dataframe
data <- read.csv("taskmaster25.csv")

#Siblings was a char for some reason
data$Siblings <- suppressWarnings(as.numeric(data$Siblings))

#invert Place to get positive correlation
data$Place <- data$Place * -1

print(numericize(data$Winner,"Y"))

numerics <- data[c("Prize","Subjective","Objective","Fastest","Live",
                   "Team","Highest","Lowest","Age","GregHarshnessRating",
                   "Seat","Height","Children","Books","Helped","RefusedHelp","Siblings")]
#Excluded due to trivial correlation: Winner,PPT,Place
#String: BirthOrder,SecondLanguage,OutfitColor,Diet,FacialHair,HairColour,ChineseYear
#Boolish: Language,ComedyAward,Headwear,Handedness,Gender

print(cor(numerics,data["Place"],use="pairwise.complete.obs"))
