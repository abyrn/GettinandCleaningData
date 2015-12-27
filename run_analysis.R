# Cleanup using rm, and load required packages
rm(list=ls(all=TRUE))
library(dplyr)

# Load files. The unzipped folder containing the data should be in the working directory
test.set <- read.table("UCI HAR Dataset/test/X_test.txt")
train.set <- read.table("UCI HAR Dataset/train/X_train.txt")

test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

test.activity <- read.table("UCI HAR Dataset/test/y_test.txt")
train.activity <- read.table("UCI HAR Dataset/train/y_train.txt")

# Concatenate the data using cbind first, followed by rbind of the two data sets
test.total <- cbind(test.subject, test.activity, test.set)
train.total <- cbind(train.subject, train.activity, train.set)

data.total <- rbind(test.total, train.total)

# Rename data headers using the features.txt file
names.raw <- c("subject", "activity", as.character(read.table("UCI HAR Dataset/features.txt")[[2]]))
names(data.total) <- names.raw

# Select only data sets that are the mean and std of measured values using grep
sel <- sort(c(1, 2, grep("mean\\(\\)", names(data.total)), grep("std\\(\\)", names(data.total))))

# Subset the data
data.meanstd <- data.total[,sel]

# Convert columns 1 and 2 into factors
data.meanstd$activity <- as.factor(data.meanstd$activity)
data.meanstd$subject <- as.factor(data.meanstd$subject)

# Rename column 2 factors into descriptive values
data.meanstd$activity <- mapvalues(data.meanstd$activity, from = c(1, 2, 3, 4, 5, 6), 
          to = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
          "SITTING", "STANDING", "LAYING"))

# Summarize the data using the dplyr package and export the resulting data table 
data.summary <- group_by(data.meanstd, subject, activity) %>% summarize_each(funs(mean))

write.table(data.summary, file = "CourseProject_Summary.txt", row.names = FALSE)
