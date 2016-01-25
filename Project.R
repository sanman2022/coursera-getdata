library(plyr);
library(dplyr);
# create the data directory in the current if it does not already exists
mainDir=getwd();
if (!file.exists("data"))
{
  dir.create(file.path(mainDir, "data"));
  
}
#download the files and unzip them
fileURL="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
download.file(fileURL,destfile = "./data/Project5.zip", mode="wb");
unzip("data/Project5.zip", exdir="data");

#read the files into data tables
df_X_train=read.table("data/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep="", stringsAsFactors = FALSE )
df_y_train=read.table("data/UCI HAR Dataset/train/y_train.txt", header= FALSE, sep="", stringsAsFactors = FALSE)
df_subject_train=read.table("data/UCI HAR Dataset/train/subject_train.txt", header= FALSE, sep="", stringsAsFactors = FALSE)
df_X_test=read.table("data/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep="", stringsAsFactors = FALSE )
df_y_test=read.table("data/UCI HAR Dataset/test/y_test.txt", header= FALSE, sep="", stringsAsFactors = FALSE)
df_subject_test=read.table("data/UCI HAR Dataset/test/subject_test.txt", header= FALSE, sep="", stringsAsFactors = FALSE)

# Step 1: Merge the training and the test sets to create one data set.

#Merge the data frames into one dataset in the same order train followed by test.
df_X=as.data.frame(rbind(df_X_train,df_X_test))
df_y=as.data.frame(rbind(df_y_train, df_y_test))
df_subject=as.data.frame(rbind(df_subject_train, df_subject_test))

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

#read features.txt to figure out mean and standard deviation columns
df_features=read.table("data/UCI HAR Dataset/features.txt", header = FALSE, sep="", stringsAsFactors = FALSE )
# find the features that have mean or std text in them
vector_mean_and_std_features=grep("mean\\(\\)|std\\(\\)",df_features$V2)
# extract the needed columns from the merged data set X
df_mean_and_std_data=df_X[,vector_mean_and_std_features]


# Step 3: Uses descriptive Activity names to name the activities in the data set

colnames(df_y)="activity"
df_y$activity=sub("1", "WALKING", df_y$activity)
df_y$activity=sub("2", "WALKING_UPSTAIRS", df_y$activity)
df_y$activity=sub("3", "WALKING_DOWNSTAIRS", df_y$activity)
df_y$activity=sub("4", "SITTING", df_y$activity)
df_y$activity=sub("5", "STANDING", df_y$activity)
df_y$activity=sub("6", "LAYING", df_y$activity)

# Step 4: Appropriately labels the data set with descriptive variable names.
# Activity table  is already labeled appropriately with the column name activity
# Extract the names of columns
colnames(df_mean_and_std_data)=df_features[vector_mean_and_std_features,2]
colnames(df_subject)="subject";
# clean up the column names
names(df_mean_and_std_data)=gsub("\\(\\)", "", names(df_mean_and_std_data),);
names(df_mean_and_std_data)=gsub("std", "stddev", names(df_mean_and_std_data),);
names(df_mean_and_std_data)=gsub("-", "", names(df_mean_and_std_data),);
names(df_mean_and_std_data)=tolower(names(df_mean_and_std_data));

#combine data frames into one tidy data frame
tidy=cbind( df_subject, df_y, df_mean_and_std_data)

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
avg_std_ColMeans=function(data){colMeans(data[,-c(1,2)])}
tidy_avg <- ddply(tidy, .(subject, activity), avg_std_ColMeans)
write.table(tidy, "data/tidy.txt", row.names = FALSE)
write.table(tidy_avg, "data/tidy_avg.txt", row.names = FALSE)