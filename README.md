Getting-and-Cleaning-Data-Course-Project Version 1.0
========================================
Zeng Mingwei.
341445826@qq.com
========================================

The "run_analysis.R" script file and "UCI HAR Dataset" folder should be put in the R working directory.
Then run the script file and it will generate a text file named "tidy_dataset.txt" which
contains the tidy data set required in the project.

There are seven steps in the script file to generate the tidy data set. Each step and the
variables generated in the step is described following.

Step1: Read data into R working directory.
	activity_labels: six activity labels.
	features: the names of each variable in the train and test data.
	subject_train: the subject who performed the activity in the train data.
	x_train: training set.
	y_train: training labels.
	subject_test: the subject who performerd the activity in the test data.
	x_test: test set.
	y_test: test labels.

Step2: Merges the training and the test sets to create one data set named "data_set".
	train_set: combines the x_train, subject_train and y_train together in columns.
	test_set: combines the x_test, subject_test and y_test together in columns.
	data_set: combines the train_set and test_set together in rows.

Step3: Extracts only the measurements on the mean and standard deviation for each measurement.
	features: changes the class to character.
	mean_colIndex: indicates the column index whose feature name contain the character "mean()" but no "meanFreq()".
	std_colIndex: indicates the column index whose feature name contain the character "std()".
	mean.std_colIndex: combine the mean_colIndex and std_colIndex and arrang in ascending order.
	data_set: extracts the columns indicated by mean.std_colIndex from original data_set.

Step4: Uses descriptive activity names to name the activities in the data set.
	activity_labels: six activity labels.
	data_set: labels the data_set's activity data with labels in activity_labels.

Step5: Appropriately labels the data set with descriptive variable names.
	data_set: names the data_set's each variable with the names in features.

Step6: Creates a second, independent tidy data set with the average of each activity and each subject.
	data_set.melt: melt the data_set with id = c('subject','activity')
	tidy_dataset: calculates the mean of each variable for each activity and each subject.
	
Step7: Writes the tidy data.

========================================
