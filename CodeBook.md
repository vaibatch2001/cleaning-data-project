# Code Book for Cleaning Data Project

This document explains in detail the source code used in the script "run_analysis.R".

## Sections

The script is divided into the following sections via comment breaks

* load the required libraries
* access folders for test & train data
* check if dir exists, else unzip the dataset
* create additonal rows for test data (subject, activity)
* extract column Names for test data (features)
* read test data
* filter columns specific to mean() and std()
* add columns for activity and subjects
* add additonal rows for train data (subject, activity)
* get training data
* merge datasets (test and training)
* create tidy dataset by aggregration (activity & subject)
* export to external file

### load the required libraries

Loads the relevant library / libraries

### access folders for test & train data

Creates path variables for the required folders within the UCI-HAR dataset

* rootdir - The path to the HAR dataset root folder
* testdir - The path to the test directory within the root folder
* traindir - The path to the train directory within the root folder

### check if dir exists, else unzip the dataset

If the contents of the HAR zip file has not yet been extracted, extract the contents into a new folder 

### create additional rows for test data (subject, activity)

Extract the activity names and subject ID's from the relevant text files as vectors for the test dataset

### extract column Names for test data (features)

Extract the column names for the test dataset from the relevant file

### read test data

Read the test dataset into a table / frame and use the column names extracted earlier to label the table columns 

### filter columns specific to mean() and std()

Remove all columns from the test data frame which do not mention either "mean" or "std"

### add columns for activity and subjects

Add the activity and subject vectors created earlier as columns at the beginning of the test data table

### create additional rows for train data (subject, activity)

Extract the activity names and subject ID's from the relevant text files as vectors for the training dataset

### get training data

Read the training dataset into a table / frame, along with the column names and the additional columns for activity and subject ID's (extracted earlier)

### merge datasets (test and training)

Append the test table rows to the training table to form a single unified data source

### create tidy dataset by aggregation (activity & subject)

Create a new data set with the average / mean of each variable for each activity and each subject

### export to external file

Write the new table to a file names "tidy-dataset.txt" and save it to the working directory


