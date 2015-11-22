# GettingAndCleaningDataClassProject


 You should create one R script called run_analysis.R that does the following. 
 
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Running Program

1. Load required data folder into Working Director, FOLDER NAME: UCI HAR Dataset 2
         Download Link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Activity Labels and Features are read into R as factors 
3. grepl function is used for pattern matching mean and std in features data.
4. A boolean table is generated, True if mean or std is in the row, False if no mean or std is found.
5. X_test, Y_test and subject_test table are read into tables
6. Boolean table is multplied with y test to sort only mean and std rows
7. X_train and Y_train data are into tables
8. Tables are combined using cbind
9. Labels are attached to data tables
10. tidy.data file is outputted











