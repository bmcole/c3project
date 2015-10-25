
## read entire training & test feature data
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")

## read variable (feature) names and assign them to data frames
var_names <- read.table("UCI HAR Dataset/features.txt")
var_names <- as.character(var_names[,2])
colnames(train) <- var_names
colnames(test) <- var_names

## project task 2: subset to only mean/standard deviation features
std_indices <- grep("std",var_names)
mean_indices <- grep("mean",var_names)
reduce <- c(std_indices,mean_indices)
train <- train[,sort(reduce)]
test <- test[,sort(reduce)]

## bring in activity labels and subject ID's for train/test data
train_act <- read.table("UCI HAR Dataset/train/y_train.txt",col.names=c("activity"))
train_IDs <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names=c("subjectid"))
train <- cbind(train_IDs,train_act,train)

test_act <- read.table("UCI HAR Dataset/test/y_test.txt",col.names=c("activity"))
test_IDs <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names=c("subjectid"))
test <- cbind(test_IDs,test_act,test)


## project task 1: merge train & test data using rbind since same # of columns
mergedDF <- rbind(train,test)

## project task 3: make descriptive activity names 
mergedDF$activity <- gsub(1,"Walking",mergedDF$activity)
mergedDF$activity <- gsub(2,"Walking Upstairs",mergedDF$activity)
mergedDF$activity <- gsub(3,"Walking Downstairs",mergedDF$activity)
mergedDF$activity <- gsub(4,"Sitting",mergedDF$activity)
mergedDF$activity <- gsub(5,"Standing",mergedDF$activity)
mergedDF$activity <- gsub(6,"Laying",mergedDF$activity)

## project task 4: make descriptive variable names
# note: I followed coursera's "text in data sets" conventions
names <- names(mergedDF)
names <- gsub("tBodyAcc-","timebodyacceleration",names)
names <- gsub("tGravityAcc-","timegravityacceleration",names)
names <- gsub("tBodyAccJerk-","timebodyaccelerationjerk",names)
names <- gsub("tBodyGyro-","timebodygyroscope",names)
names <- gsub("tBodyGyroJerk-","timebodygyroscopejerk",names)
names <- gsub("tBodyAccMag-","timebodyaccelerationmagnitude",names)
names <- gsub("tGravityAccMag-","timegravityaccelerationmagnitude",names)
names <- gsub("tBodyAccJerkMag-","timebodyaccelerationjerkmagnitude",names)
names <- gsub("tBodyGyroMag-","timebodygyroscopemagnitude",names)
names <- gsub("tBodyGyroJerkMag-","timebodygyroscopejerkmagnitude",names)
names <- gsub("fBodyAcc-","frequencybodyacceleration",names)
names <- gsub("fBodyAccJerk-","frequencybodyaccelerationjerk",names)
names <- gsub("fBodyGyro-","frequencybodygyroscope",names)
names <- gsub("fBodyAccMag-","frequencybodyaccelerationmagnitude",names)
names <- gsub("fBodyBodyAccJerkMag-","frequencybodyaccelerationjerkmagnitude",names)
names <- gsub("fBodyBodyGyroMag-","frequencybodygyroscopemagnitude",names)
names <- gsub("fBodyBodyGyroJerkMag-","frequencybodygyrocopejerkmagnitude",names)
names <- gsub("std","standarddeviation",names)
names <- gsub("meanFreq","meanfrequency",names)
names <- gsub("()","",names)
names <- gsub("-","",names)
names <- gsub("X","x",names)
names <- gsub("Y","y",names)
names <- gsub("Z","z",names)
names(mergedDF) <- names

# project task 5: create a second, independent tidy data set with the average
# of each variable grouped by each activity and each subject
library(dplyr)
newdf <- group_by(mergedDF,subjectid,activity)
newdf <- summarize_each(newdf,funs(mean))

# write this new dataset to a text file
write.table(newdf, file="step5data.txt",row.names=FALSE)
