library(plyr)

## folders for test & train data
rootdir <- paste(getwd(),"\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset", sep = "")
testdir <- paste(rootdir, "\\test", sep ="")
traindir <- paste(rootdir, "\\train", sep ="")

## Check if dir exists, else unzip the dataset
if(!file.exists(rootdir)) {
    zipfile <- paste(getwd(),"\\getdata-projectfiles-UCI HAR Dataset.zip", sep = "")
    unzip(zipfile, exdir = "getdata-projectfiles-UCI HAR Dataset")
}

## additonal rows for test data (subject, activity)
activitylabelpath <- paste(rootdir, "\\activity_labels.txt", sep = "")
activitylabels <- read.table(activitylabelpath, header = FALSE, nrows = -1, sep = "", col.names = c("labelID", "Label"))
testlabelpath <- paste(testdir, "\\y_test.txt", sep = "")
testlabels <- read.table(testlabelpath, header = FALSE, nrows = -1, sep = "", col.names = c("labelID"))
testlabels2 <- join(testlabels, activitylabels, by = "labelID")
testlabels2 <- as.vector(testlabels2[, 2])
testsubjectpath <- paste(testdir, "\\subject_test.txt", sep = "")
testsubjects <- read.table(testsubjectpath, header = FALSE, nrows = -1, sep = "", col.names = c("Subject"))

## Column Names for test data (features)
featurepath <- paste(rootdir, "\\features.txt", sep = "")
features <- read.table(featurepath, header = FALSE, sep = "", col.names = c("featureID", "colNames"))
features <- as.vector(features[, 2])

## read test data
testdatapath <- paste(testdir, "\\X_test.txt", sep = "")
testdata <- read.table(testdatapath, header = FALSE, sep = "", col.names = features, nrows = -1)

## Filter columns specific to mean() and std()
colnames_mean <- grep("mean", names(testdata), ignore.case = TRUE)
colnames_std <- grep("std", names(testdata), ignore.case = TRUE)
colnames_total <- c(colnames_mean, colnames_std)
testdata <- testdata[, colnames_total]

## Add columns for activity and subjects
testdata <- cbind("Activity" = testlabels2, testdata)
testdata <- cbind(testsubjects, testdata)


## additonal rows for train data (subject, activity)
trainlabelpath <- paste(traindir, "\\y_train.txt", sep = "")
trainlabels <- read.table(trainlabelpath, header = FALSE, nrows = -1, sep = "", col.names = c("labelID"))
trainlabels2 <- join(trainlabels, activitylabels, by = "labelID")
trainlabels2 <- as.vector(trainlabels2[, 2])
trainsubjectpath <- paste(traindir, "\\subject_train.txt", sep = "")
trainsubjects <- read.table(trainsubjectpath, header = FALSE, nrows = -1, sep = "", col.names = c("Subject"))

## training data
traindatapath <- paste(traindir, "\\X_train.txt", sep = "")
traindata <- read.table(traindatapath, header = FALSE, sep = "", col.names = features, nrows = -1)
traindata <- traindata[, colnames_total]
traindata <- cbind("Activity" = trainlabels2, traindata)
traindata <- cbind(trainsubjects, traindata)

## merge datasets (test and training)
traindata <- rbind(traindata, testdata)

## Create tidy dataset by aggregration (activity & subject)
newdata <- aggregate(traindata[,3:length(colnames)], by = list(Subject = traindata$Subject, Activity = traindata$Activity), mean)

## Export to external file
outputpath <- paste(getwd(), "\\tidy-dataset.txt", sep = "")
write.table(newdata, append = FALSE, file = outputpath, row.names = FALSE)
