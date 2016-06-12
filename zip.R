#Check if /data exists in wd, if not create
if(!file.exists("./data")) {dir.create("./data")}

# assign names to zip file and expected output folder
# it is assumed that the zip file is in the wd

dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipname <- "getdata-projectfiles-UCI HAR Dataset.zip"
filename<- "./data/UCI HAR Dataset"

# check if zip exists, if not download

if(!file.exists(zipname)) {
        download.file(dataUrl,zipname)
}

# check if the extraction folder exists

if(!file.exists(filename)) {
        unzip(zipname, exdir="./data")
}

## you can now run run_analysis.R