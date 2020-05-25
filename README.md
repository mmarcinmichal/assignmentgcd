# Peer-graded Assignment: Getting and Cleaning Data Course Project

The script called *run_analysis.R* downloads data from [webpage](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and prepares required tidy datasets. The script works as following:

1. Clear workspace.
2. Set data set path (*dataset* folder contains the downloaded and unzipped raw data).
3. Set URL to zipped dataset.
4. Download zip file from the given URL.
5. Unzip archive.
6. Remove the downloaded and unziped archive.
7. Load feature names and convert them to proper names.
8. Load activity labels.
9. Load test data.
10. Load test labels.
11. Load test subjects.
12. Load train data.
13. Load train labels.
14. Load train subjects.
15. Merges the training and the test sets to create one data set. 
16. Extract only the measurements on the mean and standard deviation for each measurement.
17. Set descriptive activity names to name the activities in the data set.
18. Create appropriately labels the data set with descriptive variable names.
19. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
20. Save the created dataset