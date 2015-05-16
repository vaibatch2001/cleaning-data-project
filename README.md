# Cleaning Data Project

## Summary

The repository contains my project for the course "Getting And Cleaning Data" in Coursera

The master branch contains a source file called "run_analysis.R" which performs the following tasks in sequence:

1. Extract the contents of UCI-HAR zip file to the R / RStudio working directory
2. Merge several data files to create a unified table structure
3. Create a new table from the original unified data structure (with transformations)
4. Write the new table to a text file in the RStudio working directory

A Detailed description of each of the above steps is listed in the file "CodeBook.md" which is also located in the master branch of the repository

## Steps for Execution

In order to execute the source file and generate the desired output, please follow the steps mentioned below:

1. Clone the repository
2. Download the UCI-HAR zip file from the URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. Copy the run_analysis.R script and the zip file to your working directory
4. Execute the script

The above steps will generate a text file called "tidy-dataset.txt" in the working directory.

