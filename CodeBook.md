The script begins by loading up the necessary libraries:
plyr, dplyr and stringr

The sources the zip.R script to ensure that the data is downloaded and unzipped in the proper directory.

Then it sets functions to retrieve elements from a list.

After, it assigns paths to the txt files of interest in the subfolders Test and Train, under UCI HAR Dataset, as well as the 
two txt files that hold the labels.

The script then continues to load the data using the read.table function for each of the files (and paths created before).

Labels are added to the relevant data frames by using colnames

Then it subsequently createas an array with the names of each variable for data sets of type x, i.e. measures, but it 
needs to make them usable by R first by applying the make.names function. In essence, it replaces '-' and '(' or ')' by '.'

To be able to get the mean and std measures, it is necessary to discriminate between variables. It is thus necessary to 
perform a string split with strsplit, but only after the name has been made proper by make.names as it is going to split the
string using '\\.'.

The data frame that has the variable names is then mutated (using dplyr) to add columns that with the first and second elements
of the list created by strsplit.

At this point colnames can be given to the x-type data sets, while the y-type data sets get colname "activity_id"

To be able to visualize the sets better, the x, y and s-type sets are wrapped with tbl_df (although it is not necessary)

At this stage, to be able to have descriptive names for the activities it is necessary to merge the tables. In this case
the script uses the join function from dplyr.

To select only the columns that have the mean and std measures, the script filters the data frame that is hosting the 
labels of the variable names. With the function now clearly isolated in the function_name column, it is easy to use filter from 
dplyr to isolate only the rows that are of interest. 

Gladly, this allows the script to select columns from the data set of maesures which by now is already labeld with the variable name for each column. This operation is done with select and subsetting the variable names that are equal to mean and std.

Now it is time to bind the x, y and s-type data frames together with bind_cols.

The above steps are done interchangeably between the Test and Training data sets.

To keep the data tidy, to the resulting data frames, add a column to keep the source by using mutate marking it "test" or "training" accordingly.

The two sets are now ready to be merged. In this case, the operation is done with bind_rows.

Lastly, the script uses dplyr's summarize to group_by activity_name and subject while doing the mean of the selected variables, i.e. all measures with mean and std. The resulting data frame does not carry the activity_id or source of the measure.

In the end, the output file "FullDataAvgs.txt" is written within the UCI HAR Dataset folder, i.e. "./data/UCI HAR Dataset"
#write output in folder that hosts the Samsung data

As a result, to the existing codebook the following variables are those that apply to the FullDataAvgs.txt file are described here below. Note that the difference between the original feature (variable name) and the "R acceptable" is that it replaces '-' and '(' or ')' by '.'

Variable Name			R Acceptable Name		domain	vectorname		measurefunction	measureaxis
fBodyAccJerk-mean()-X		fBodyAcc.std...X		f	fBodyAccJerk		mean()		X
fBodyAccJerk-mean()-Y		fBodyAcc.std...Y		f	fBodyAccJerk		mean()		Y
fBodyAccJerk-mean()-Z		fBodyAcc.std...Z		f	fBodyAccJerk		mean()		Z
fBodyAccJerk-std()-X		fBodyAccJerk.mean...X		f	fBodyAccJerk		std()		X
fBodyAccJerk-std()-Y		fBodyAccJerk.mean...Y		f	fBodyAccJerk		std()		Y
fBodyAccJerk-std()-Z		fBodyAccJerk.mean...Z		f	fBodyAccJerk		std()		Z
fBodyAccMag-mean()		fBodyGyro.std...X		f	fBodyAccMag		mean()		NA
fBodyAccMag-std()		fBodyGyro.std...Y		f	fBodyAccMag		std()		NA
fBodyAcc-mean()-X		tBodyGyroMag.std..		f	fBodyAcc		mean()		X
fBodyAcc-mean()-Y		tBodyGyroJerkMag.mean..		f	fBodyAcc		mean()		Y
fBodyAcc-mean()-Z		tBodyGyroJerkMag.std..		f	fBodyAcc		mean()		Z
fBodyAcc-std()-X		fBodyAcc.mean...X		f	fBodyAcc		std()		X
fBodyAcc-std()-Y		fBodyAcc.mean...Y		f	fBodyAcc		std()		Y
fBodyAcc-std()-Z		fBodyAcc.mean...Z		f	fBodyAcc		std()		Z
fBodyBodyAccJerkMag-mean()	fBodyGyro.std...Z		f	fBodyBodyAccJerkMag	mean()		NA
fBodyBodyAccJerkMag-std()	fBodyAccMag.mean..		f	fBodyBodyAccJerkMag	std()		NA
fBodyBodyGyroJerkMag-mean()	fBodyBodyAccJerkMag.std..	f	fBodyBodyGyroJerkMag	mean()		NA
fBodyBodyGyroJerkMag-mean()	fBodyBodyGyroJerkMag.mean..	f	fBodyBodyGyroJerkMag	mean()		NA
fBodyBodyGyroJerkMag-std()	fBodyBodyGyroJerkMag.std..	f	fBodyBodyGyroJerkMag	std()		NA
fBodyBodyGyroJerkMag-std()	fBodyBodyGyroMag.mean..		f	fBodyBodyGyroJerkMag	std()		NA
fBodyBodyGyroMag-mean()		fBodyAccMag.std..		f	fBodyBodyGyroMag	mean()		NA
fBodyBodyGyroMag-std()	fBodyBodyAccJerkMag.mean..		f	fBodyBodyGyroMag	std()		NA
fBodyBodyGyroMag-std()	fBodyBodyGyroMag.std..			f	fBodyBodyGyroMag	std()		NA
fBodyGyro-mean()-X	fBodyAccJerk.std...X			f	fBodyGyro		mean()		X
fBodyGyro-mean()-Y	fBodyAccJerk.std...Y			f	fBodyGyro		mean()		Y
fBodyGyro-mean()-Z	fBodyAccJerk.std...Z			f	fBodyGyro		mean()		Z
fBodyGyro-std()-X	fBodyGyro.mean...X			f	fBodyGyro		std()		X
fBodyGyro-std()-Y	fBodyGyro.mean...Y			f	fBodyGyro		std()		Y
fBodyGyro-std()-Z	fBodyGyro.mean...Z			f	fBodyGyro		std()		Z
tBodyAccJerkMag-mean()	tBodyAccMag.std..			t	tBodyAccJerkMag		mean()		NA
tBodyAccJerkMag-std()	tGravityAccMag.mean..			t	tBodyAccJerkMag		std()		NA
tBodyAccJerk-mean()-X	tBodyAccJerk.mean...X			t	tBodyAccJerk		mean()		X
tBodyAccJerk-mean()-Y	tBodyAccJerk.mean...Y			t	tBodyAccJerk		mean()		Y
tBodyAccJerk-mean()-Z	tBodyAccJerk.mean...Z			t	tBodyAccJerk		mean()		Z	
tBodyAccJerk-std()-X	tBodyAccJerk.std...X			t	tBodyAccJerk		std()		X
tBodyAccJerk-std()-Y	tBodyAccJerk.std...Y			t	tBodyAccJerk		std()		Y
tBodyAccJerk-std()-Z	tBodyAccJerk.std...Z			t	tBodyAccJerk		std()		Z
tBodyAccMag-mean()	tBodyGyroJerk.std...X			t	tBodyAccMag		mean()		NA
tBodyAccMag-std()	tBodyGyroJerk.std...Y			t	tBodyAccMag		std()		NA
tBodyAcc-mean()-X	tBodyAcc.mean...X			t	tBodyAcc		mean()		X
tBodyAcc-mean()-Y	tBodyAcc.mean...Y			t	tBodyAcc		mean()		Y
tBodyAcc-mean()-Z	tBodyAcc.mean...Z			t	tBodyAcc		mean()		Z
tBodyAcc-std()-X	tBodyAcc.std...X			t	tBodyAcc		std()		X
tBodyAcc-std()-Y	tBodyAcc.std...Y			t	tBodyAcc		std()		Y
tBodyAcc-std()-Z	tBodyAcc.std...Z			t	tBodyAcc		std()		Z
tBodyGyroJerkMag-mean()	tBodyAccJerkMag.std..			t	tBodyGyroJerkMag	mean()		NA
tBodyGyroJerkMag-std()	tBodyGyroMag.mean..			t	tBodyGyroJerkMag	std()		NA
tBodyGyroJerk-mean()-X	tBodyGyro.std...X			t	tBodyGyroJerk		mean()		X
