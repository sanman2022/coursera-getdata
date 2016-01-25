##Original data
The original data for this project comes from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

##Project Analysis
The data is read into 6 tables
df_X_train= Training data 
df_y_train= Activity information for the training data
df_subject_train=Subject information for the training data
3 similar tables are used for the test data. 

Then this project merges the training and test data, and creates one merged data set. For this exercise train data is followed by test for the merging purpose. Though the sequence doesn’t matter per se, but it has to be done in the same order for all 3 tables.

After merging the two data sets, only the measurements on the mean and standard deviation for each measurement are extracted from the merged data set.
For this purpose features.txt file in the original data is used and the column names that had mean() and std() in their names are selected.

Merged data is scrubbed
1. Activity codes (1,2,..6) and renamed to (“WALKING”, “WALKING_UPSTAIRS”, “WALKING_DOWNSTAIRS”, “SITTING”, “STANDING”, “LAYING”)

2. Appropriate labels are given to the merged data set

Then the 3 tables are combined to create a tidy data set.

##Data
##tidy
The resultant tidy data set (named “tidy” in this repo) has the following columns (total 68)


[1] "subject"                    "activity"                   "tbodyaccmeanx"              "tbodyaccmeany"              "tbodyaccmeanz"             
[6] "tbodyaccstddevx"            "tbodyaccstddevy"            "tbodyaccstddevz"            "tgravityaccmeanx"           "tgravityaccmeany"          
[11] "tgravityaccmeanz"           "tgravityaccstddevx"         "tgravityaccstddevy"         "tgravityaccstddevz"         "tbodyaccjerkmeanx"         
[16] "tbodyaccjerkmeany"          "tbodyaccjerkmeanz"          "tbodyaccjerkstddevx"        "tbodyaccjerkstddevy"        "tbodyaccjerkstddevz"       
[21] "tbodygyromeanx"             "tbodygyromeany"             "tbodygyromeanz"             "tbodygyrostddevx"           "tbodygyrostddevy"          
[26] "tbodygyrostddevz"           "tbodygyrojerkmeanx"         "tbodygyrojerkmeany"         "tbodygyrojerkmeanz"         "tbodygyrojerkstddevx"      
[31] "tbodygyrojerkstddevy"       "tbodygyrojerkstddevz"       "tbodyaccmagmean"            "tbodyaccmagstddev"          "tgravityaccmagmean"        
[36] "tgravityaccmagstddev"       "tbodyaccjerkmagmean"        "tbodyaccjerkmagstddev"      "tbodygyromagmean"           "tbodygyromagstddev"        
[41] "tbodygyrojerkmagmean"       "tbodygyrojerkmagstddev"     "fbodyaccmeanx"              "fbodyaccmeany"              "fbodyaccmeanz"             
[46] "fbodyaccstddevx"            "fbodyaccstddevy"            "fbodyaccstddevz"            "fbodyaccjerkmeanx"          "fbodyaccjerkmeany"         
[51] "fbodyaccjerkmeanz"          "fbodyaccjerkstddevx"        "fbodyaccjerkstddevy"        "fbodyaccjerkstddevz"        "fbodygyromeanx"            
[56] "fbodygyromeany"             "fbodygyromeanz"             "fbodygyrostddevx"           "fbodygyrostddevy"           "fbodygyrostddevz"          
[61] "fbodyaccmagmean"            "fbodyaccmagstddev"          "fbodybodyaccjerkmagmean"    "fbodybodyaccjerkmagstddev"  "fbodybodygyromagmean"      
[66] "fbodybodygyromagstddev"     "fbodybodygyrojerkmagmean"   "fbodybodygyrojerkmagstddev"

First two columns “subject” and “activity” provide the identification of subject and the activity for which a given measurement is recorded as value.

##tidy_avg
From the tidy data table above, a second, independent tidy data set with the average of each variable for each activity and each subject is created.
The resultant data set is named “tidy_avg” in this repo. It has the same columns as tidy(total 68).

There are 180 rows in “tidy_avg” for 30 subjects and 6 activities. Each subject and activity combination serves as a index in this table.



