# cleaning_samsung_coursera
repository made for the assignment of getting and cleaning data on Coursera (Johns Hopkins)

The file run_analysis.R assumes that there is another script zip.R that looks for the source over the internet, downloads and extracts it in the proper folder should it not have been done already.

The zip file is meant to be in the wd, while data is in the subfolder ./data

The script assumes that you have placed and unzipped the data within your working directoyr at "./data/UCI HAR Dataset".

"UCI HAR Dataset" is the name of the unzipped folder.

The script takes into consideration that there are two subfolders where data is placed: Test & Train, both of which have have
x, y and subject_test data files representing the variables' observation, the activities and the subject. All file have the same number of observations but differ in number of variables. Neither has rows or column lables.

The folder "UCI HAR Dataset" has two files features.txt and activity_lables.txt that serve as reference.

First begin by preparing the training and test data frames. Both require some transformation.

