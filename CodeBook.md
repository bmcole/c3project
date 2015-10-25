# Code Book for Course Project - Getting and Cleaning Data

## Variables in run_analysis.R

###### train
* used to store the training dataset ("UCI HAR Dataset/train/X_train.txt")

###### test
* used to store the test dataset ("UCI HAR Dataset/test/X_test.txt")

###### var_names
* used to read in/assign variable names for both the train and testing dataset 

###### std_indices
* used to the store the indices of variables related to standard deviation measurements

###### mean_indices
* used to the store the indices of variables related to mean measurements

###### reduce
* vector of std_indices combined with mean_indices

###### train_act 
* used to store activity label data for training dataset

###### train_IDs
* used to store subject id data for training dataset

###### test_act 
* used to store activity label data for testing dataset

###### test_IDs
* used to store subject id data for testing dataset

###### activity
* variable created to store the type of activity the subject performed (e.g. Walking)

###### subjectid
* variable created to identify the subject (1-30)

###### mergedDF 
* stores the merged training and test datasets which contain the feature variables related to   standard deviation and mean,  subject ids, and activities

###### names
* used to make the variable names more descriptive 

###### newdf
* used to store the new, independent tidy data set described in step 5 of the project instructions

## Variable names/info/units/etc. from previous codebook given with the data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

## Transformations performed in run_analysis.R

##### making variable names more descriptive
* followed Coursera's guidelines
* all performed using the gsub() function 
* "t" transformed to "time"
* "f" transformed to "frequency"
* "Acc" transformed to "acceleration"
* "Gyro" transformed to "gyroscope"
* "Mag" transformed to "magnitude"
* "BodyBody" transformed to just "body"
* "std" transformed to "standarddeviation"
* "meanFreq" transformed to "meanfrequency"
* elminated hyphens


##### making descriptive activity names
* "1" transformed to "Walking"
* "2" transformed to "Walking Upstairs"
* "3" transformed to "Walking Downstairs"
* "4" transformed to "Sitting"
* "5" transformed to "Standing"
* "6" transformed to "Laying"




