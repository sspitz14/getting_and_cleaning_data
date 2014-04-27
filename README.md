<<<<<<< HEAD
README.md
========================================================
##### Class: Getting and Cleaning Data, Coursera, April 2014
##### Assignment: Peer Assessment (week 3) 
##### Instructor: Jeffrey Leek, Johns Hopkins University
##### Student: Steven Spitz
##### Last Revised: April 27, 2014



## README Sections
1. Files
2. Data Description
  * Starting Data
  * Ending Data
3. Data Acquisition
4. Data Cleaning and Processing Steps

### Section 1: Files

Files in this directory:

1. This README (README.md)
2. The code book (codebook.md)
3. The R script (run_analysis.R)
4. activity_by_subject_and_type.txt (final cleaned data file, rolled up to the participant-activity level)

The readme file describes the data acquisition, data cleaning, and data processing steps, as well as the files for this assignment.

The code book file contains detailed information about the data sets and their variables.

The R script contains all the commands for generating the final summarized data from the initial data.  The R script also contains comments explaining the steps and what the R commands do.

The .txt file contains the final cleaned data

### Section 2: Data Description

#### Starting Data
__Original Data Repository:__   
UCI Machine Learing Repository http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones     

__Original Data Link:__   
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   

__Original Data Source:__   
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.    
Smartlab - Non Linear Complex Systems Laboratory    
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy.    
activityrecognition '@' smartlab.ws    
www.smartlab.ws     

__Original Data Description (from the respository):__     
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

#### Ending Data

__Final Data Set: activity_by_subject_and_type.txt__
The final data contains summarized sensor signals by volunteer (1-30) and by activity (6 types).
Therefore, the file contains 180 data rows (30 subjects x 6 activites = 180 rows), and a header row.

Column 1 is called, subject.  It contains the participant numbers assigned to each volunteer (1 to 30).   
Column 2 is called, activity.  It contains descriptions of the six types of activities performed by each volunteer.

The remaining columns are summarized data; 66 columns of means and 66 columns of standard deviations.   
Summarizations are on the subject-activity level.   
For example, Column 3 is called, tbodyaccxmean.mean.  
The ".mean" suffix indicates that this is the mean (or average) tbodyaccxmean for each subject-activity pair.   
The initial "t" indicates a time-domain measurement.   
The "bodyaccx" describes the measurement itself, in this case, body acceleration in the x-direction.   
The "mean" before the final ".mean" indicates that this measure was averaged over numerous time windows while each participant performed the various activities.

Its associated standard deviation summary variable is called, tbodyaccxmean.sd. and is located in column 69, the first of the standard deviation summary columns.  Note that this variable name is identical, except for its suffix, .sd, indicating it is the standard deviation of mean time-domain body accelarations in the x-direction for each participant-activity pair.   

For a full description of features, please see the code book file, codebook.md.   

### Section 3: Data Acquisition

Data was obtained from the UCI Machine Learning repository.

__Data download URL:__   
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The data are in a self-extracting archive.   
When unzipped, the data will be in a director structure, with the root directory, UCI HAR Dataset containing the following files:   
* README.txt
* features.txt   
* features_info.txt
* activity_labels.txt   

... and two subdirectories: 
* train   
* test   

These subdirectories contain raw and summarized data for training participants and test participants respectively.  The authors randomly assigned measurements belonging to 70% of the 30 volunteers for training data and the remaining for test data.   

For the purpose of this assignment, only summarized training and test data was used.  That is, the subdirectories called, Inertial Signals, located in train and test, were not used.

We did, however use the three files in the train directory and the analogous three files in the test directory.   
The files in the train directory are called,    
* subject_train.txt (containing a single column of subject ids)
* X_train.txt (containing the measurement data, i.e. feature vectors)
* y_train.txt (containing a single column of activity ids, i.e. dependent variables)

The files in the test directory have similar names:
* subject_test.txt (containing a single column of subject ids)
* X_test.txt (containing the measurement data, i.e. feature vectors)
* y_test.txt (containing a single column of activity ids, i.e. dependent variables)

These are the files that were used to assemble the initial data which was processed into the summary data.   


### 4. Data Cleaning and Processing Steps

1. Step 1: Download and extract the data from the zip file, above.
2. Step 2: Merge the training and test data
  * read the three training files and the three test files, described in the Data Acquisition section above
  * column bind the three train files in subject-Xdata-Yactivity order
  * column bind the three test files in subject-Xdata-Yactivity order
  * stack (i.e. rbind) the test data to the train data
  * append initial column headers from the features.txt file
    ** the first feature is called "subject"
    ** This is followed by the Xdata feature names in features.txt
    ** This is followed by a feature name called "activity"
3. Step 3: Retain only Xdata features (i.e. columns) that are means or standard deviations
  * The retained features contained "mean()" or "std()" in their original names
  * Sixty six such features were retained
  * Features containing meanFreq() were not retained, as there were no related stdFreq() variables
  * other summary type variables are excluded
  * these excluded types include: min, max, mad (mean average deviation), iqr (inter-quartile range), etc.
4. Step 4: Clean the activity variable instances (i.e. values).
  * original activity values: 
  * WALKING --> walking
  * WALKING_UPSTAIRS --> upstairswalking
  * WALKING_DOWNSTAIRS --> downstairswalking
  * SITTING --> sitting
  * STANDING --> standing
  * LAYING --> lying
5. Step 5: Clean the names of the Xdata features
  * remove dashes (-) and paretheses
  * remove upper case letters
  * move "mean" and "std" to the end of the feature names
  * sample clean feature name: tbodygyrozstd
6. Step 6: Create a summarized data set, rolled up to the volunteer-activity level
  * each of the 66 retained data features from step 3 above were summarized separately by mean and standard deviation
  * therefore, this data set contains 132 (66 x 2) data columns
  * it also contains two id columns: "subject" and "activity"
  * the summarizations were over each participant-activity pairing (180 such)
  * mean summary headings contain the suffix ".mean"
  * standard deviation summary headings contain the suffix, ".sd" 
  * this is the final data set containing 180 data rows by 134 columns
=======
getting_and_cleaning_data
=========================

peer_assessment_submission
>>>>>>> fd1e385c77196e36fc57450fbd9b84de5def7935
