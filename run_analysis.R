#Libraries
library("reshape2")

#Export Dataset

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
path <- "UCI_Dataset.zip"

#Download zip file
download.file(url, path)

#Extract data
unzip(path, files = NULL, exdir = ".")

#Read data test
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

#Read data train
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

#Read labels and features
activityLbls <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("UCI HAR Dataset/features.txt")[,2]

#Project
#1.Merges the training and the test sets to create one data set.
ds <- rbind(X_train,X_test)
subject <- rbind(subject_train,subject_test)
activity <- rbind(y_train,y_test)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
stdDev <- grep("mean()|std()", features)
ds <- ds[,stdDev]

#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names.
names(ds) <- sapply(features, function(x) {gsub("[()]", "",x)})[stdDev]
names(subject) <- 'subject'
names(activity) <- 'activity'

ds <- cbind(subject,activity, ds)
activities <- factor(ds$activity)
levels(activities) <- activityLbls
ds$activity <- activities

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
ds2 <- melt(ds, id=c("subject","activity"))
ds2 <- dcast(ds2, subject + activity ~ variable, mean)

write.table(ds2, "tidy.txt", sep = ",", row.name = FALSE)
