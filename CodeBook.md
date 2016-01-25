##Original data
The original data for this project comes from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

##Project Analysis
The data is read into 6 tables
* df_X_train= Training data 
* df_y_train= Activity information for the training data
* df_subject_train=Subject information for the training data
3 similar tables are used for the test data. 

Then this project merges the training and test data, and creates one merged data set. For this exercise train data is followed by test for the merging purpose. Though the sequence doesn’t matter per se, but it has to be done in the same order for all 3 tables.

After merging the two data sets, only the measurements on the mean and standard deviation for each measurement are extracted from the merged data set.
For this purpose features.txt file in the original data is used and the column names that had mean() and std() in their names are selected.

Merged data is scrubbed
* Activity codes (1,2,..6) and renamed to (“WALKING”, “WALKING_UPSTAIRS”, “WALKING_DOWNSTAIRS”, “SITTING”, “STANDING”, “LAYING”)
* Appropriate labels are given to the merged data set

Then the 3 tables are combined to create a tidy data set.

##Data
##tidy

The resultant tidy data set (named “tidy” in this repo) has the following columns (total 68)

First two columns “subject” and “activity” provide the identification of subject and the activity for which a given measurement is recorded as value.

1. subject
2. activity

The next 66 columns represent either a mean or a standard deviation measurement. Columns with 'mean' in their names represent a mean measurement and columns with 'stddev' in their name represent a standard deviation measurement.

3. tbodyaccmeanx
4. tbodyaccmeany
5. tbodyaccmeanz
6. tbodyaccstddevx
7. tbodyaccstddevy
8. tbodyaccstddevz
9. tgravityaccmeanx
10. tgravityaccmeany
11.	tgravityaccmeanz
12.	tgravityaccstddevx
13.	tgravityaccstddevy
14.	tgravityaccstddevz
15.	tbodyaccjerkmeanx
16.	tbodyaccjerkmeany
17.	tbodyaccjerkmeanz
18.	tbodyaccjerkstddevx
19.	tbodyaccjerkstddevy
20.	tbodyaccjerkstddevz
21.	tbodygyromeanx
22.	tbodygyromeany
23.	tbodygyromeanz
24.	tbodygyrostddevx
25.	tbodygyrostddevy
26.	tbodygyrostddevz
27.	tbodygyrojerkmeanx
28.	tbodygyrojerkmeany
29.	tbodygyrojerkmeanz
30.	tbodygyrojerkstddevx
31.	tbodygyrojerkstddevy
32.	tbodygyrojerkstddevz
33.	tbodyaccmagmean
34.	tbodyaccmagstddev
35.	tgravityaccmagmean
36.	tgravityaccmagstddev
37.	tbodyaccjerkmagmean
38.	tbodyaccjerkmagstddev
39.	tbodygyromagmean
40.	tbodygyromagstddev
41.	tbodygyrojerkmagmean
42.	tbodygyrojerkmagstddev
43.	fbodyaccmeanx
44.	fbodyaccmeany
45.	fbodyaccmeanz
46.	fbodyaccstddevx
47.	fbodyaccstddevy
48.	fbodyaccstddevz
49.	fbodyaccjerkmeanx
50.	fbodyaccjerkmeany
51.	fbodyaccjerkmeanz
52.	fbodyaccjerkstddevx
53.	fbodyaccjerkstddevy
54.	fbodyaccjerkstddevz
55.	fbodygyromeanx
56.	fbodygyromeany
57.	fbodygyromeanz
58.	fbodygyrostddevx
59.	fbodygyrostddevy
60.	fbodygyrostddevz
61.	fbodyaccmagmean
62.	fbodyaccmagstddev
63.	fbodybodyaccjerkmagmean
64.	fbodybodyaccjerkmagstddev
65.	fbodybodygyromagmean
66.	fbodybodygyromagstddev
67.	fbodybodygyrojerkmagmean
68.	fbodybodygyrojerkmagstddev



##tidy_avg
From the tidy data table above, a second, independent tidy data set with the average of each variable for each activity and each subject is created.
The resultant data set is named “tidy_avg” in this repo. It has the same columns as tidy(total 68).

There are 180 rows in “tidy_avg” for 30 subjects and 6 activities. Each subject and activity combination serves as a index in this table.



