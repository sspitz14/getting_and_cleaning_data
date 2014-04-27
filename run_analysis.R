# Getting and Cleaning Data
# Peer Assessment Assignment
# Student: Steven Spitz
# Date: April 27, 2014

# You should create one R script called run_analysis.R that does the following:
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive variable or feature (column) names
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Checklist:
#
# The explanation is as important as the script, so make sure you have the readme
# have you combined the training and test x and y into one block, given them headings, and turned the numeric activities into something easier to read.
# have you extracted some variables to do with mean and standard deviation from the full set
# have you explained what those variables are and your criteria for picking them in the readme
# have you gotten the average of each variable for each combination of subject and activity and saved the data frame of this as a set of tidy data
# have you loaded up your current script, an up to date readme! and your tidy data


data.dir <- "C:\\Users\\SJS\\Documents\\Coursera\\Cleaning Data\\Project_Tidy_Data\\UCI HAR Dataset\\"
setwd(data.dir)
# -------------------------------------------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
# -------------------------------------------------------------------------------------------------

# training data from 21 volunteers (70% of 30)
# test data from 9 volunteers (30% of 30)

# ROWS are split into training and test sets (i.e. two groups)
# COLUMNS are split into three groups: subject number, sensor signal data, and activity type
# The strategy is to read all six (2 x 3) files and then to:
#     1) separately assemble the training and test sets (using cbind)
#     2) stack the training and test sets (using rbind)
# Finally, a character vector of column headings is created and assigned as colnames

tran.path.features <- "train\\X_train.txt"
test.path.features <- "test\\X_test.txt"
tran.path.labels   <- "train\\Y_train.txt"
test.path.labels   <- "test\\Y_test.txt"
tran.path.subjects <- "train\\subject_train.txt"
test.path.subjects <- "test\\subject_test.txt"

# read the data
tran.dat <- read.table(tran.path.features, header=FALSE)
test.dat <- read.table(test.path.features, header=FALSE)

tran.act <- read.table(tran.path.labels, header=FALSE)
test.act <- read.table(test.path.labels, header=FALSE)

tran.sub <- read.table(tran.path.subjects, header=FALSE)
test.sub <- read.table(test.path.subjects, header=FALSE)

# put the training data together
tran.all <- cbind.data.frame(tran.sub, tran.dat, tran.act)
rm(tran.sub, tran.dat, tran.act)

# put the test data together
test.all <- cbind.data.frame(test.sub, test.dat, test.act)
rm(test.sub, test.dat, test.act)

# stack the training and test data
full.all <- rbind.data.frame(tran.all, test.all)
rm(tran.all, test.all)

# read the data names
name.dat <- read.table("features.txt", header=FALSE)

# create column names and affix them to the full data frame
name.dat <- as.character(name.dat[,2])
col.name <- c("subject", name.dat, "activity")
rm(name.dat)
colnames(full.all) <- col.name

# -------------------------------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# -------------------------------------------------------------------------------------------------

# NOTE: 
# meanFreq features such as fBodyBodyGyroMag-meanFreq() will not be included
# according to features_info.txt, 
#     meanFreq(): Weighted average of the frequency components to obtain a mean frequency
#     ... There is no analogue for stdFreq()
#     On the other hand, mean(): Mean value and std(): Standard deviation are related ...
#     because the are moments of the same variable.

keep.col <- grepl("(mean\\()|(std\\()|subject|activity", col.name)
mean.std <- full.all[,keep.col]

# -------------------------------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set
# -------------------------------------------------------------------------------------------------

library(qdap)

# create a hash table of key-value pairs (e.g. 1 WALKING; 2 WALKING_UPSTAIRS; etc.)
act.labels <- read.table("activity_labels.txt", header=FALSE)
# make the activity descriptions lower case
act.labels[,2] <- tolower(act.labels[,2])
# remove underscores
act.label.list <- strsplit(act.labels[,2], "_")
# reverse the order of walkingupstairs (to upstairswalking) for better readability
act.label.char <- sapply(act.label.list, function(x) paste(sort(x), collapse=""))
# replace "laying" with "lying" to fix grammatical error
act.label.char <- gsub("laying", "lying", act.label.char)
# replace the old activity descriptions with the new activity descriptions
act.labels[,2] <- act.label.char

# replace numeric activities (1:6) with their descriptions
mean.std$activity <- qdap::lookup(mean.std$activity, act.labels)

# make the activity variable a factor
mean.std$activity <- factor(mean.std$activity)

# -------------------------------------------------------------------------------------------------
# 4. Appropriately label the data set with descriptive variable or feature (column) names
# -------------------------------------------------------------------------------------------------

col.names <- names(mean.std)

# remove dashes and parentheses and convert upper case letters to lower case
col.names <- tolower(gsub("-|\\(|\\)", "", col.names))

# make sure "mean" or "std", if they exist, are always at the end
shiftstr <- function(x, string) {if(grepl(string,x)) paste(sub(string,"",x),string, sep="") else x}
col.names <- sapply(col.names, function(x) shiftstr(x, string="mean"))
col.names <- sapply(col.names, function(x) shiftstr(x, string="std"))

# remove "bodybody" where it appears, and replace it with "body"
col.names <- sub("bodybody", "body", col.names)

# reattach the modified column names onto the data frame
names(mean.std) <- col.names

# -------------------------------------------------------------------------------------------------
# 5. Create a second, independent tidy data set with the average of each variable for each activity 
#    and each subject. 
# -------------------------------------------------------------------------------------------------

library(doBy)

# summarize activity by subject and activity type.  summary stats = mean, std.
activity.by.subject.and.type <- summaryBy(. ~ subject + activity, data=mean.std, FUN=c(mean, sd))

# save summary file in csv format but with .txt extension
write.table(activity.by.subject.and.type, file="activity_by_subject_and_type.txt", row.names=F, sep=",")


# -------------------------------------------------------------------------------------------------
# 6. Create code book. 
# -------------------------------------------------------------------------------------------------

# from https://class.coursera.org/getdata-002/forum/thread?thread_id=302:
datanames <- names(activity.by.subject.and.type)
outputlines <- paste("* ", datanames, sep="")
# write.table will create listofnames.md in the current working directory
write.table(outputlines, file="listofnames.md", quote = FALSE, col.names=FALSE, row.names=FALSE)




 