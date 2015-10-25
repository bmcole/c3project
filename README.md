
#### How the script "run_analyis.R" works

The script begins by reading in the original HAR training and test datasets from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
These datasets are stored in the dataframe objects "train" and "test" respectively.

Then, variable names are read in from the HAR data and assigned to the data frames "train" and "test".
Next, the training and test dataframes are subset to only mean/standard deviation variables using grep

Then, the data on what activity the observation (subject) was performing was read in , as well as the subject ID identifier.
These two new variables were then merged (binded) with to the train and test dataframes.

After that, the rest of the script either makes the activity names more descriptive, or the variable names more descriptive.

Finally, the last block of code creates a second, independent tidy data set with the average of each variable for each activity and each subject. This dataframe is then written to an appropriate text file "step5data.txt"

#### CodeBook.md

The codebook contains info about the variables used in run_analysis.R, as wel as info on how I chose to make the 
activity names and variable names more descriptive.

