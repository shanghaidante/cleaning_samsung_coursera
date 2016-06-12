# load libraries
library (plyr)
library (dplyr)
library (stringr)

# source zip script to unzip the data
if(file.exists("zip.r")){
        source("zip.R")}

#create functions that get  element of lists

first_element <- function (x){x[1]}
second_element <- function (x){x[2]}

#get the paths of the files with data

xTrainPath <- "./data/UCI HAR Dataset/train/X_train.txt"
yTrainPath <- "./data/UCI HAR Dataset/train/y_train.txt"
sTrainPath <- "./data/UCI HAR Dataset/train/subject_train.txt"

xTestPath <- "./data/UCI HAR Dataset/test/X_test.txt"
yTestPath <- "./data/UCI HAR Dataset/test/y_test.txt"
sTestPath <- "./data/UCI HAR Dataset/test/subject_test.txt"

#get the path of the files with labels

activitiesPath <-"./data/UCI HAR Dataset/activity_labels.txt"
featuresPath <-"./data/UCI HAR Dataset/features.txt"

# get data into objects
# data in this file does not have headers, headers = FALSE

# get data from data files
xTrainData <- read.table(xTrainPath, header = FALSE, quote="\"", comment.char="")
yTrainData <- read.table(yTrainPath, header = FALSE, quote="\"", comment.char="")
sTrainData <- read.table(sTrainPath, header = FALSE, quote="\"", comment.char="")

xTestData <- read.table(xTestPath, header = FALSE, quote="\"", comment.char="")
yTestData <- read.table(yTestPath, header = FALSE, quote="\"", comment.char="")
sTestData <- read.table(sTestPath, header = FALSE, quote="\"", comment.char="")

#get data from label files
activitynames <- read.table(activitiesPath, header = FALSE, quote="\"", comment.char="")
featuresnames <- read.table(featuresPath, header = FALSE, quote="\"", comment.char="")

#add names to label objects
colnames(activitynames) <- c("activity_id","activity_name")
colnames(featuresnames) <- c("feature_id", "feature_long_name")

#manipulate subject data
colnames(sTrainData) <- "subject"
colnames(sTestData) <- "subject"

#get names from features to include in data and replace into
#featuresnames data frame
datanames <- make.names(featuresnames[,2], unique = TRUE)
featuresnames[,2] <- datanames

#split strings in featurenames to isolate function name, this is to avoid getting meanFreq in filtering
#other than having tidier and nicer data

featureslist <- strsplit(featuresnames[,2], "\\.")

#mutate featurenames df by adding columns to represent short name and function in use

featuresnames <- mutate(featuresnames, function_name = sapply(featureslist, second_element))
featuresnames <- mutate(featuresnames, short_name = sapply(featureslist, first_element))



#assign names to test data and training data dataframes
#chose to keep the long name in any case, information on ReadMe

colnames(xTestData) <- datanames
colnames(xTrainData)<- datanames
colnames(yTestData) <- "activity_id"
colnames(yTrainData) <- "activity_id"

#wrap data frames, not necessary but nice to have
xTrainData <- tbl_df (xTrainData)
yTrainData <- tbl_df (yTrainData)
sTrainData <- tbl_df (sTrainData)

xTestData <- tbl_df (xTestData)
yTestData <- tbl_df (yTestData)
sTestData <- tbl_df (sTestData)

#add activity name to y-type data frame 
yTestData <- join(yTestData, activitynames)
yTrainData <- join(yTrainData, activitynames)

# remove all columns other than mean and std related
# first find all rows in featurenames that have mean or std
# then redefine x-type data frames with only these rows
# wrap mean and std between . . to avoid other measures

colfilter <- filter(featuresnames, function_name =="mean" | function_name=="std")
xTestData <- select(xTestData, colfilter[,1])
xTrainData <- select(xTrainData, colfilter[,1])

#bind y-type data frames to x-type data frames

xTestData <- bind_cols(yTestData, sTestData, xTestData)
xTrainData <- bind_cols(yTrainData, sTrainData, xTrainData)

# add column that states the source either test or training
# keeps reference to table origin for tidiness

xTestData <- mutate(xTestData, source = "test")
xTrainData <- mutate(xTrainData, source = "training")

#bind rows of both data sets test and training
xFullData <- bind_rows(xTestData, xTrainData)

#get new data frame with the average of mean and std
#for each type of activity 1-6

xFullDataAvgs <- summarize_each(group_by(select(xFullData, -activity_id, -source), activity_name, subject),funs(mean))

#write output in folder that hosts the Samsung data

write.table(xFullDataAvgs,file="./data/UCI HAR Dataset/FullDataAvgs.txt", row.names = FALSE)

