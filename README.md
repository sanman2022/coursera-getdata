# coursera-getdata
##Getting and Cleaning Data Course Project

This repository contains R code that downloads and does some preprocessing on Human Activity Recognition data set. The original data for this project comes from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

## Content of this Repo

### run_analysis.R
Download this R file in a working directory.
1. This script works with a data directory. If it doesn't exist, it creates one.
2. It downoads the data from the above mentioned source and unzips it. 
3. Runs the analysis. See [CodeBook.md](CodeBook.md) for more info. 
4. Produes tidy.txt and tidy_avg.txt datasets
5. 

## CodeBook.md
Guide to understand the source data, analysis, and result data sets

## tidy.txt
Merged and cleaned (variable names) data set. See [CodeBook.md](CodeBook.md) for more info. 

## tidy_avg.txt
Data set that contains averages of the mean and standard deviation measurements. See [CodeBook.md](CodeBook.md) for more info. 
