Repository made for the assignment of getting and cleaning data on Coursera (Johns Hopkins)

The file run_analysis.R assumes that there is another script zip.R that looks for the source over the internet, downloads and extracts it in the proper folder should it not have been done already.

The zip file is meant to be in the wd, while data is in the subfolder ./data

The script assumes that you have placed and unzipped the data within your working directoyr at "./data/UCI HAR Dataset".

"UCI HAR Dataset" is the name of the unzipped folder.

The script takes into consideration that there are two subfolders where data is placed: Test & Train, both of which have have
x, y and subject_test data files representing the variables' observation, the activities and the subject. All file have the same number of observations but differ in number of variables. Neither has rows or column lables.

The folder "UCI HAR Dataset" has two files features.txt and activity_lables.txt that serve as reference.

There is also a new file "new feature names.txt" that includes all the measure names in the output file, since name was modified to be acceptable by R. In this file, the original feature name is together with the modified R name and a decomposition of the name into vector, measure, measure axis and domain (time or frequencey) which follow the original specifications.

Original files can be found here

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

All credits of the original dataset to the work of Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz in Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
