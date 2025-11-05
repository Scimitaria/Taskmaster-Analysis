#extract Taskmaster data from csv into dataframe
data <- read.csv("taskmaster25.csv")

#invert Place to get positive correlation
data$Place <- data$Place * -1

#Numeric values
#Excluded due to trivial correlation: Winner,PPT,Place
numerics <- data[c("Prize","Subjective","Objective","Fastest","Live",
                   "Team","Highest","Lowest","Age","GregHarshnessRating",
                   "Seat","Height","Children","Books","Helped","RefusedHelp")]

##########################
## convert non-numerics ##
##########################
#If an element is a feature, change to one, otherwise change it to 0
#This allows correlation checking between non-numeric values
numericize <- function(lst,cond){
    as.numeric(lst == cond)
}

#Hair
blondeHair <- numericize(data$HairColour,"Blonde")
brownHair <- numericize(data$HairColour,"Brown")
blackHair <- numericize(data$HairColour,"Black")
greyHair <- numericize(data$HairColour,"Grey")
redHair <- numericize(data$HairColour,"Red")
bald <- numericize(data$HairColour,"Bald")
cleanShaven <- numericize(data$FacialHair,"N")
hair <- data.frame(blondeHair,brownHair,blackHair,greyHair,redHair,bald,cleanShaven)

#Outfit - excluded colors that only appear once
darkBlueOutfit <- numericize(data$OutfitColor,"Dark blue")
yellowOutfit <- numericize(data$OutfitColor,"Yellow")
orangeOutfit <- numericize(data$OutfitColor,"Orange")
whiteOutfit <- numericize(data$OutfitColor,"White")
greenOutfit <- numericize(data$OutfitColor,"Green")
beigeOutfit <- numericize(data$OutfitColor,"Beige")
blackOutfit <- numericize(data$OutfitColor,"Black")
blueOutfit <- numericize(data$OutfitColor,"Blue")
greyOutfit <- numericize(data$OutfitColor,"Grey")
pinkOutfit <- numericize(data$OutfitColor,"Pink")
headwear <- numericize(data$Headwear,"Y")
outfit <- data.frame(orangeOutfit,yellowOutfit,greenOutfit,blueOutfit,darkBlueOutfit,beigeOutfit,blackOutfit,whiteOutfit,greyOutfit,pinkOutfit,headwear)

#Chinese Year
rooster <- numericize(data$ChineseYear,"Rooster")
monkey <- numericize(data$ChineseYear,"Monkey")
rabbit <- numericize(data$ChineseYear,"Rabbit")
dragon <- numericize(data$ChineseYear,"Dragon")
sheep <- numericize(data$ChineseYear,"Sheep")
tiger <- numericize(data$ChineseYear,"Tiger")
horse <- numericize(data$ChineseYear,"Horse")
snake <- numericize(data$ChineseYear,"Snake")
dog <- numericize(data$ChineseYear,"Dog")
pig <- numericize(data$ChineseYear,"Pig")
rat <- numericize(data$ChineseYear,"Rat")
ox <- numericize(data$ChineseYear,"Ox")
year <- data.frame(rat,ox,tiger,rabbit,dragon,snake,horse,sheep,monkey,rooster,dog,pig)

#other
notNominatedForAward <- numericize(data$ComedyAward,"N")
multilingual <- numericize(data$Language,"Yes")
ambidextrous <- numericize(data$Handedness,"")
rightHanded <- numericize(data$Handedness,"R")
leftHanded <- numericize(data$Handedness,"L")
meat <- numericize(data$Diet,"Meat")
male <- numericize(data$Gender,"M")
misc <- data.frame(notNominatedForAward,multilingual,ambidextrous,rightHanded,leftHanded,male,meat)

##################
## class clowns ##
##################
#Siblings was a char for some reason
#also 0 siblings was represented as NA which is dumb
siblings <- suppressWarnings(as.numeric(data$Siblings))
siblings[is.na(siblings)] <- 0

#BirthOrder made me bust out the alcohol
oldest <- as.numeric(grepl("Oldest",data$BirthOrder))
middle <- numericize(data$BirthOrder,"Middle")
youngest <- as.numeric(grepl("Youngest",data$BirthOrder))
only <- as.numeric(is.na(data$BirthOrder) | data$BirthOrder == "")
birthOrder <- data.frame(oldest,middle,youngest,only)


all <- data.frame(hair,outfit,year,siblings,birthOrder,misc)