## CodeBook
This script will download and unzip the file in your working directory.

## 1. Read data test
* subject_test : subject ID
* X_test : values of variables
* y_test : activity ID

## 2. Read data training
* subject_train  : subject IDs
* X_train : values of variables
* y_train : activity ID

## 3. Read labels and features
* activityLbls : Description of activity IDs
* features : label of each variables

## 4. Merge the training and test, subject and activity
* ds : bind of X_train and X_test
* subject : bind of subject_train and subject_test
* activity : bind of y_train and y_test

## 5. Extract only mean and std
Create a vector of mean and std labels.
* stdDev : a vector of mean and std labels extracted from features
* ds : dataSet will contain mean and std variables

## 6. Update Column label of Dataset
Rename column labels.

## 7. Adding Subject and Activity to the dataSet
Combine training and test data of subject and activity.
* ds : bind of dataSet, subject and activity

## 8. Rename ID to activity label
* activities : factored activity column of dataSet 

## 9. Output tidy data
DataSet is melted to create tidy data. 
Output the data as *tidy.txt*.
