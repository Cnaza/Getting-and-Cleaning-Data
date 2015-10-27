library(data.table)
library(plyr)
library(dplyr)
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","zipfile.zip",method = "curl")
#unzip("zipfile.zip")

#Merges the training and the test sets to create one data set
features <- read.table("UCI HAR Dataset/features.txt")
trainingSet <- read.table("UCI HAR Dataset/train/X_train.txt")
testSet <- read.table("UCI HAR Dataset/test/X_test.txt")
setdata<-rbind(trainingSet,testSet)
colnames(setdata)<-features[,2]

#Extracts only the measurements on the mean and standard deviation for each measurement.
setdata<-setdata[,grep("mean|std", colnames(setdata))]

#Uses descriptive activity names to name the activities in the data set
trainingActivity <- read.table("UCI HAR Dataset/train/Y_train.txt")
testActivity <- read.table("UCI HAR Dataset/test/Y_test.txt")
dataActivity<-rbind(trainingActivity,testActivity)
colnames(dataActivity)<-"ActivityNumber"

activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activityLabels)<-c("ActivityNumber","ActivityName")
setdata<-cbind(dataActivity,setdata)

setdata<-join(activityLabels,setdata,by="ActivityNumber")

subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subject<-rbind(subjectTrain,subjectTest)
colnames(subject)<-"Subject"
setdata<-cbind(subject,setdata)

colnames(setdata)<-gsub(pattern="\\()",replacement ="",colnames(setdata))
colnames(setdata)<-gsub(pattern="-",replacement ="",colnames(setdata))
colnames(setdata)<-gsub(pattern="mean",replacement ="Mean",colnames(setdata))
colnames(setdata)<-gsub(pattern="std",replacement ="Std",colnames(setdata))

write.csv(setdata, "data1.csv", row.names = FALSE)
