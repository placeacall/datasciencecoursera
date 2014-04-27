datasciencecoursera
===================
The data sets used in the peer assignment are downloaded from http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

The script run_analysis.R is heavily commented with entire details of the working of the script

The script must be run from the working sirectory of the unzipped archive UCI HAR Dataset

A summary of highlighted runflow of the script are as follows.

1.  Load DataSets
  1.  Load feature data set :features.txt
  2.  Load activity data set :activity_labels.txt
  3.  Load training predictor data set :./train/y_train.txt
  4.  Load the subject training set:./train/subject_train.txt
  5.  Load the training data set: ./train/subject_train.txt
  6.  Combine all training set into training dataset
  7.  Load test predictor data set :./test/y_test.txt
  8.  Load the subject testing set :./test/subject_test.txt
  9.  Load the testing data set :./test/X_test.txt
  6.  Combine all test dataset into test dataset  

2.  Combine training and testing data sets into one main data set

3.  Retain only feature names with mean() and std() 

4.  Cleanup feature names

5.  Aggregate data set

6.  Write output, The output of the script is a csv file names tidy.txt