## Getting and Cleaning Data

###Project Course

You should create one R script called run_analysis.R that does the following: 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps
1. Libraries installed:

 * library(data.table)
 * library(plyr)
 * library(dplyr)


2. Downloaded and unzip the file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. Created data set with training and test set
4. Selected columns with mean and std
5. Removed () and - in the column names
6. Joined activity labels to data set
7. Joined subject to data set
8. Wrote file in csv file
9. Run source("run_analysis.R")