##load reshape2 library
library(reshape2)

##get a list of all feautures
features <- read.table("features.txt", header=FALSE, stringsAsFactors=FALSE)

##load activity label
activityLabel <- read.table("activity_labels.txt", header=FALSE)

##load the y training predictor value
y.train <- read.table("./train/y_train.txt", header=FALSE)
names(y.train) <- "Y"
y.train$Activity <- factor(y.train$Y, levels=activityLabel$V1, labels=activityLabel$V2)

##load the training subject feature
train.subject <- read.table("./train/subject_train.txt", header=FALSE)
names(train.subject) <- "SubjectID"

##load the training data set
train.x <- read.table("./train/X_train.txt", header=FALSE)

##Combine all data sets related to the training set
train <- cbind(train.subject, y.train, train.x)

##load the y testing predictor value
y.test <- read.table("./test/y_test.txt", header=FALSE)
names(y.test) <- "Y"
y.test$Activity <- factor(y.test$Y, levels=activityLabel$V1, labels=activityLabel$V2)

##load the testing subject feature
test.subject <- read.table("./test/subject_test.txt", header=FALSE)
names(test.subject) <- "SubjectID"

##load the test data set
test.x <- read.table("./test/X_test.txt", header=FALSE)

##Combine testing set
test <- cbind(test.subject, y.test, test.x)

##combine row bind
data <- rbind(train, test)

##rename the column names
names(data)[4:length(names(data))] <- features[, 2]

##identify listed feautures, features with mean() & std()
features.listed <- names(data)[grep("std\\(\\)|mean\\(\\)", tolower(names(data)))]

##get all listed features with mean() and std()
data.features <- data[, features.listed]

##Introduce SubjectID, ActivityID, Activity to the identified features(*mean(), *std())
data.features <- cbind(data[c(1, 3)], data.features)

##4 Appropriately labels the data set with descriptive activity names. 
##Clean up feature names
names(data.features) <- gsub("\\(\\)", "", gsub("-", ".", names(data.features)))


##5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##Using melt and dcast to aggregate data set
data.features.melt <- melt(data.features, id=c("SubjectID", "Activity"))
data.features.melt.transpose <- dcast(data.features.melt, Activity + SubjectID ~ variable, mean) 

##Write dataset to tidy.txt
write.table(data.features.melt.transpose, file = "tidy.txt", sep = ",", row.names=FALSE)
