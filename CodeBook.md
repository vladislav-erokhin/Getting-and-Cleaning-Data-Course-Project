# CodeBook

This code book describes the variables, the data, and transformations or work that performed to clean up the data.

## Source Data Set Information

The data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Transformation details

There is R script called ```run_analysis.R``` that does the following.

1. Loads and merges training and test sets ('train/X_train.txt', 'test/X_test.txt').
2. Loads column names from 'features.txt' and sets them to dataset. (Appropriately labels the data set with descriptive variable names).
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Loads and merges training and test labels ('train/y_train.txt', 'test/y_test.txt').
5. Loads and sets descriptive activity names from 'activity_labels.txt'.
6. Loads and merges training and test subjects ('train/subject_train.txt', 'test/subject_test.txt').
7. Binds subjects, activities, and measurments into one dataset using bind_cols() function from dplyr package.
8. From the data set in step 7, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Result tidy dataset columns

1. Activity
2. Subject ID
3-68. Average of each variable (measurements on the mean and standard deviation for each measurement) for each activity and each subject