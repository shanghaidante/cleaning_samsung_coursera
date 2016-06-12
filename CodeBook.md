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

As a result, to the existing codebook the following variables are those that apply to the FullDataAvgs.txt file are described in the file "new feature names.txt" in the repository. Note that the difference between the original feature (variable name) and the "R acceptable" is that it replaces '-' and '(' or ')' by '.'

