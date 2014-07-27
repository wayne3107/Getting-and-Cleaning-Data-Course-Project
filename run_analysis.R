## Step1
## Read data into R working directory
activity_labels <- read.csv('./UCI HAR Dataset/activity_labels.txt',header=F,sep='')
features <- read.csv('./UCI HAR Dataset/features.txt',header=F,sep='')
subject_train <- read.csv('./UCI HAR Dataset/train/subject_train.txt',header=F,sep='')
x_train <- read.csv('./UCI HAR Dataset/train/X_train.txt',header=F,sep='')
y_train <- read.csv('./UCI HAR Dataset/train/y_train.txt',header=F,sep='')
subject_test <- read.csv('./UCI HAR Dataset/test/subject_test.txt',header=F,sep='')
x_test <- read.csv('./UCI HAR Dataset/test/X_test.txt',header=F,sep='')
y_test <- read.csv('./UCI HAR Dataset/test/y_test.txt',header=F,sep='')
print("Step1 is done.")

## Step2
## Merges the training and the test sets to create one data set named "data_set".
train_set <- cbind(x_train,subject_train,y_train)
test_set <- cbind(x_test,subject_test,y_test)
data_set <- rbind(train_set,test_set)
print("Step2 is done.")

## Step3
## Extracts only the measurements on the mean and standard deviation for each measurement.
## The extraction rule is that select the variable whose feature name contains "mean()" or "std()" but no "meanFreq()".
features <- as.character(features[,2])
mean_colIndex <- setdiff(grep('mean()',features),grep('meanFreq()',features))
std_colIndex <- grep('std()',features)
mean.std_colIndex <- sort(union(mean_colIndex,std_colIndex))
data_set <- cbind(data_set[,mean.std_colIndex],data_set[,c(length(data_set)-1,length(data_set))])
print("Step3 is done.")

## Step4
## Uses descriptive activity names to name the activities in the data set.
## I just use the activity labels in "activity_labels.txt" to name each activity.
activity_labels <- as.character(activity_labels[,2])
data_set[,length(data_set)] <- activity_labels[data_set[,length(data_set)]]
print("Step4 is done.")

## Step5
## Appropriately labels the data set with descriptive variable names.
## I just use the features names in "features.txt" to name each selected variable.
names(data_set)[1:(length(data_set)-2)] <- features[mean.std_colIndex]
names(data_set)[length(data_set)-1] <- 'subject'
names(data_set)[length(data_set)] <- 'activity'
print("Step5 is done.")

## Step6
## Creates a second, independent tidy data set with the average of each activity and each subject.
data_set.melt <- melt(data_set,id=c('subject','activity'))
tidy_dataset <- dcast(data_set.melt, subject + activity ~ variable, mean)
print("Step6 is done.")

## Step7
## Writes the tidy_dataset
write.csv(tidy_data,'tidy_dataset.txt',row.names=F)
print("Step7 is done.")
