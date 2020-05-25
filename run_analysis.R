#
# Script to create tidy datasets
#

#
# Clear workspace
#
rm(list = ls())


#
# Set data set path
#
datasetPath <- "./dataset/UCI HAR Dataset"

#
# URL to zipped dataset
#
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#
# Download file
#
download.file(url, "./dataset/tmp.zip")

#
# Unzip archive
#
unzip("./dataset/tmp.zip", exdir	= "./dataset")

#
# Remove archive
#
file.remove("./dataset/tmp.zip")

#
# Feature names converted to proper names 
#
featNames <- read.table(paste0(datasetPath, "/features.txt"), sep = "", header = F)
featNames$V2 <- make.names(featNames$V2)
head(featNames)

#
# Activity labels
#
activityLabels <- read.table(paste0(datasetPath, "/activity_labels.txt"), sep = "", header = F)
activityLabels <- activityLabels$V2
head(activityLabels)

#
# Test data
#
testDf <- read.table(paste0(datasetPath, "/test/X_test.txt"), sep = "", header = F)
head(testDf, c(4, 4))

testLabels <- read.table(paste0(datasetPath, "/test/y_test.txt"), sep = "", header = F)
testLabels <- testLabels$V1
head(testLabels)

testSubject <- read.table(paste0(datasetPath, "/test/subject_test.txt"), sep = "", header = F)
testSubject <- testSubject$V1
head(testSubject)

#
# Train data
#
trainDf <- read.table(paste0(datasetPath, "/train/X_train.txt"), sep = "", header = F)
head(trainDf, c(4, 4))

trainLabels <- read.table(paste0(datasetPath, "/train/y_train.txt"), sep = "", header = F)
trainLabels <- trainLabels$V1
head(trainLabels)

trainSubject <- read.table(paste0(datasetPath, "/train/subject_train.txt"), sep = "", header = F)
trainSubject <- trainSubject$V1
head(trainSubject)

#
# Merges the training and the test sets to create one data set
# Merge testDf and trainDf to ttDf (test train data frame)
#
ttDf <- rbind(testDf, trainDf)
head(ttDf, c(4, 4))
str(ttDf)

#
# Extracts only the measurements on the mean and standard deviation for each measurement.
#
meanIndxs <- stringr::str_which(featNames$V2, "\\.mean\\.")
sdIndxs <- stringr::str_which(featNames$V2, "\\.sd\\.")
ttMeanSdDf <- ttDf[, c(meanIndxs, sdIndxs)]
head(ttMeanSdDf)
str(ttMeanSdDf)

#
# Descriptive activity names to name the activities in the data set
# Merge test labels and train labels to ttLabels (test train labels)
#
ttLabels <- c(testLabels, trainLabels)

for (i in 1:length(activityLabels)) {
  ttLabels[ttLabels == i] <- activityLabels[i]
}

str(ttLabels)

if (nrow(ttDf) != length(ttLabels)) {
  stop("Wrong dimensions")
}

#
# Appropriately labels the data set with descriptive variable names.
#
colnames(ttDf) <- featNames$V2
head(ttDf, c(4, 4))
str(ttDf)

subColNames <- featNames$V2[c(meanIndxs, sdIndxs)]
colnames(ttMeanSdDf) <- subColNames
head(ttMeanSdDf, c(4))
str(ttMeanSdDf)

#
# From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
#
ttSubjects <- c(testSubject, trainSubject)

if (nrow(ttDf) != length(ttSubjects)) {
  stop("Wrong dimensions")
}

ttMeanSdDf$labels <- ttLabels
ttMeanSdDf$subjects <- ttSubjects

groupedDf <- aggregate(ttMeanSdDf[,subColNames], by=list(labels = ttMeanSdDf$labels, subjects = ttMeanSdDf$subjects), FUN = mean)

head(groupedDf)
tail(groupedDf)

#
# Save the created dataset
#
write.table(x = groupedDf, file = "./dataset/avg-of-mean-and-sd-var-group-by-act-and-subj.txt", row.name=FALSE) 

