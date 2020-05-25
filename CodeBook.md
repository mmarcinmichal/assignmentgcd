# Peer-graded Assignment: Getting and Cleaning Data Course Project - CodeBook

The code book describes the variables, the data, and transformations or work that the *run_analysis.R* script performes to clean up the data. 
The finall data frame, i.e. the second, independent tidy data set with the average of each variable for each activity and each subject, contains the following attributes (attributes were coonverted to syntactically valid names out of character vectors using by *make.names()* function):

- labels - activity labels from *activity_labels.txt*
- subjects - test and training subjects from *subject_test.txt* and *subject_train.txt* respectively
- tBodyAcc.mean...X
- tBodyAcc.mean...Y
- tBodyAcc.mean...Z
- tGravityAcc.mean...X
- tGravityAcc.mean...Y
- tGravityAcc.mean...Z
- tBodyAccJerk.mean...X
- tBodyAccJerk.mean...Y
- tBodyAccJerk.mean...Z
- tBodyGyro.mean...X
- tBodyGyro.mean...Y
- tBodyGyro.mean...Z
- tBodyGyroJerk.mean...X
- tBodyGyroJerk.mean...Y
- tBodyGyroJerk.mean...Z
- tBodyAccMag.mean..
- tGravityAccMag.mean..
- tBodyAccJerkMag.mean..
- tBodyGyroMag.mean..
- tBodyGyroJerkMag.mean..
- fBodyAcc.mean...X
- fBodyAcc.mean...Y
- fBodyAcc.mean...Z
- fBodyAccJerk.mean...X
- fBodyAccJerk.mean...Y
- fBodyAccJerk.mean...Z
- fBodyGyro.mean...X
- fBodyGyro.mean...Y
- fBodyGyro.mean...Z
- fBodyAccMag.mean..
- fBodyBodyAccJerkMag.mean..
- fBodyBodyGyroMag.mean..
- fBodyBodyGyroJerkMag.mean..

Please see *features_info.txt* from [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to require more details about features mentioned above.
