codebook.md
===========

These are the columns (i.e. variables) in the final summarized file, activity_by_subject_and_type.txt

There are 132 columns in all.

The first two columns are id variables, identifying each subject and each activity performed.

The remaining columns are data columns.
The data columns are names as follows:   
   
1. first character: t or f for time-domain or frequency domain, respectively.   
2. measurement descriptor, e.g. bodyaccx.  Please see features_info.txt for further details.  A section of features_info.txt is excerpted below, at the bottom of this file.   
3. low-level summary type: "mean" or "std".  These summaries were calculated over a series of time windows while a given participant performed a given activity in a single session.  Note that participants performed each activity more than once.   
4. high-level summary type: ".mean" or ".sd".  These summaries are calculated for each participant-activity.  Therefore, the final data are on the particpant-activity level (as indicated by the values in the subject and activity columns).  
   
   
Features:   

* subject (id number for each participant volunteer 1 - 30)
* activity (activity type: walking, upstairswalking, downstairswalking, sitting, standing, lying)
* tbodyaccxmean.mean
* tbodyaccymean.mean
* tbodyacczmean.mean
* tbodyaccxstd.mean
* tbodyaccystd.mean
* tbodyacczstd.mean
* tgravityaccxmean.mean
* tgravityaccymean.mean
* tgravityacczmean.mean
* tgravityaccxstd.mean
* tgravityaccystd.mean
* tgravityacczstd.mean
* tbodyaccjerkxmean.mean
* tbodyaccjerkymean.mean
* tbodyaccjerkzmean.mean
* tbodyaccjerkxstd.mean
* tbodyaccjerkystd.mean
* tbodyaccjerkzstd.mean
* tbodygyroxmean.mean
* tbodygyroymean.mean
* tbodygyrozmean.mean
* tbodygyroxstd.mean
* tbodygyroystd.mean
* tbodygyrozstd.mean
* tbodygyrojerkxmean.mean
* tbodygyrojerkymean.mean
* tbodygyrojerkzmean.mean
* tbodygyrojerkxstd.mean
* tbodygyrojerkystd.mean
* tbodygyrojerkzstd.mean
* tbodyaccmagmean.mean
* tbodyaccmagstd.mean
* tgravityaccmagmean.mean
* tgravityaccmagstd.mean
* tbodyaccjerkmagmean.mean
* tbodyaccjerkmagstd.mean
* tbodygyromagmean.mean
* tbodygyromagstd.mean
* tbodygyrojerkmagmean.mean
* tbodygyrojerkmagstd.mean
* fbodyaccxmean.mean
* fbodyaccymean.mean
* fbodyacczmean.mean
* fbodyaccxstd.mean
* fbodyaccystd.mean
* fbodyacczstd.mean
* fbodyaccjerkxmean.mean
* fbodyaccjerkymean.mean
* fbodyaccjerkzmean.mean
* fbodyaccjerkxstd.mean
* fbodyaccjerkystd.mean
* fbodyaccjerkzstd.mean
* fbodygyroxmean.mean
* fbodygyroymean.mean
* fbodygyrozmean.mean
* fbodygyroxstd.mean
* fbodygyroystd.mean
* fbodygyrozstd.mean
* fbodyaccmagmean.mean
* fbodyaccmagstd.mean
* fbodyaccjerkmagmean.mean
* fbodyaccjerkmagstd.mean
* fbodygyromagmean.mean
* fbodygyromagstd.mean
* fbodygyrojerkmagmean.mean
* fbodygyrojerkmagstd.mean
* tbodyaccxmean.sd
* tbodyaccymean.sd
* tbodyacczmean.sd
* tbodyaccxstd.sd
* tbodyaccystd.sd
* tbodyacczstd.sd
* tgravityaccxmean.sd
* tgravityaccymean.sd
* tgravityacczmean.sd
* tgravityaccxstd.sd
* tgravityaccystd.sd
* tgravityacczstd.sd
* tbodyaccjerkxmean.sd
* tbodyaccjerkymean.sd
* tbodyaccjerkzmean.sd
* tbodyaccjerkxstd.sd
* tbodyaccjerkystd.sd
* tbodyaccjerkzstd.sd
* tbodygyroxmean.sd
* tbodygyroymean.sd
* tbodygyrozmean.sd
* tbodygyroxstd.sd
* tbodygyroystd.sd
* tbodygyrozstd.sd
* tbodygyrojerkxmean.sd
* tbodygyrojerkymean.sd
* tbodygyrojerkzmean.sd
* tbodygyrojerkxstd.sd
* tbodygyrojerkystd.sd
* tbodygyrojerkzstd.sd
* tbodyaccmagmean.sd
* tbodyaccmagstd.sd
* tgravityaccmagmean.sd
* tgravityaccmagstd.sd
* tbodyaccjerkmagmean.sd
* tbodyaccjerkmagstd.sd
* tbodygyromagmean.sd
* tbodygyromagstd.sd
* tbodygyrojerkmagmean.sd
* tbodygyrojerkmagstd.sd
* fbodyaccxmean.sd
* fbodyaccymean.sd
* fbodyacczmean.sd
* fbodyaccxstd.sd
* fbodyaccystd.sd
* fbodyacczstd.sd
* fbodyaccjerkxmean.sd
* fbodyaccjerkymean.sd
* fbodyaccjerkzmean.sd
* fbodyaccjerkxstd.sd
* fbodyaccjerkystd.sd
* fbodyaccjerkzstd.sd
* fbodygyroxmean.sd
* fbodygyroymean.sd
* fbodygyrozmean.sd
* fbodygyroxstd.sd
* fbodygyroystd.sd
* fbodygyrozstd.sd
* fbodyaccmagmean.sd
* fbodyaccmagstd.sd
* fbodyaccjerkmagmean.sd
* fbodyaccjerkmagstd.sd
* fbodygyromagmean.sd
* fbodygyromagstd.sd
* fbodygyrojerkmagmean.sd
* fbodygyrojerkmagstd.sd
   
   
   
#### From features_info.txt:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
