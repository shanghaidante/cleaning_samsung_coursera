For both cases, either test or traing the following is to be done:

1. get data from txt file into R object from X_train.txt, noting that the data is separated by a space
2. get data from txt file into R object from Y_train.txt, noting that the data is separated by a space but only 1 col
3. get data from txt file into R object from features.txt, noting that the data is separated by a space
4. get data from txt file into R object from activity_labels.txt, noting that the data is separated by a space but only 1 col
5. merge data from features as top row on dataframe object from X_train
6. transform object with data from Y_train by adding the descriptive name of the activity on an extra column
7. merge data from the object described in point 6 onto the object described in point 5 by adding two columns
8. add an extra column to identify if data has origin from test or training

the above routine is repeated for the data corresponding to X_test and Y_test, while there is no need to repeat the loading of data
in features.txt and activity_lables.txt

Note that the object that host the data from features.txt and activity_lables.txt should not be altered.

to obtain only the columns that are of interest, that is those that host the mean() and std() functions to the vector,
create an array that identifies which column number has the mean or std functions within.

with the above array in order, this can be used to create an new dataframe object that has selected the columns from the 
dataframe that results from point 8 described above for both the test data and training data.

merge the resulting 2 dataframes into a single dataframe

summarize dataframe using the mean function to obtain the average of each variable (i.e. those from features.txt for the sole
observations of mean and std) and each type of activity (i.e. those described in activity_labels)
